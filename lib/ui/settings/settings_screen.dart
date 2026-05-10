import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/crypto/export_crypto.dart';
import 'package:moon_manifest/data/repositories/export_repository.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/manifestation_guide_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

final exportRepositoryProvider = Provider<ExportRepository>((ref) {
  return ExportRepository(ref.watch(cycleRepositoryProvider), ExportCrypto());
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: AppColors.darkNavy,
        leading: const BackButton(color: AppColors.moonSilver),
        title: const Text(
          'Settings',
          style: TextStyle(color: AppColors.moonWhite, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Notifications section
          _SectionCard(
            title: 'Notifications',
            children: [
              const Text(
                'Reminder frequency (times per day)',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
              Row(
                children: [3, 6, 9].map((freq) {
                  final selected = settings.notificationFrequency == freq;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(
                        '$freq×',
                        style: TextStyle(
                          color: selected ? AppColors.deepIndigo : AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      selected: selected,
                      selectedColor: AppColors.mutedGold,
                      backgroundColor: AppColors.midNavy,
                      onSelected: (_) {
                        ref.read(settingsProvider.notifier).setNotificationFrequency(freq);
                      },
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Wake window',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _TimePickerButton(
                      label: 'Start',
                      value: settings.wakeWindowStart,
                      onPicked: (time) {
                        ref.read(settingsProvider.notifier).setWakeWindow(time, settings.wakeWindowEnd);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _TimePickerButton(
                      label: 'End',
                      value: settings.wakeWindowEnd,
                      onPicked: (time) {
                        ref.read(settingsProvider.notifier).setWakeWindow(settings.wakeWindowStart, time);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Moon style section
          _SectionCard(
            title: 'Moon Style',
            children: [
              const Text(
                'Choose how the moon looks throughout the app',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 16),
              const _MoonStylePicker(),
            ],
          ),
          const SizedBox(height: 16),

          // Data section
          _SectionCard(
            title: 'Data',
            children: [
              _ActionButton(
                icon: Icons.upload_outlined,
                label: 'Export Data',
                onPressed: () => _handleExport(context, ref),
              ),
              const SizedBox(height: 12),
              _ActionButton(
                icon: Icons.download_outlined,
                label: 'Import Data',
                onPressed: () => _handleImport(context, ref),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // About section
          _SectionCard(
            title: 'About',
            children: [
              const Text(
                'Moon Manifest is a personal ritual companion designed to help you align your intentions with the lunar cycle. '
                'Each new moon, you set up to three intentions and spend the following 28 days nurturing them through daily gratitude '
                'and reflection. Your data is stored securely on your device and never sent to any server. '
                'Use the export feature to create an encrypted backup, and import it on a new device to restore your practice.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ManifestationGuideScreen()),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.menu_book_outlined, size: 18, color: AppColors.mutedGold),
                    const SizedBox(width: 8),
                    Text(
                      'Manifestation Guide',
                      style: TextStyle(
                        color: AppColors.mutedGold,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right, size: 18, color: AppColors.mutedGold),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleExport(BuildContext context, WidgetRef ref) async {
    final password = await _showPasswordDialog(context, title: 'Set Export Password');
    if (password == null || password.isEmpty) return;

    try {
      final repo = ref.read(exportRepositoryProvider);
      final encrypted = await repo.exportData(password);

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/moon_manifest_backup.mmb');
      await file.writeAsBytes(encrypted);

      await Share.shareXFiles(
        [XFile(file.path, mimeType: 'application/octet-stream')],
        subject: 'Moon Manifest Backup',
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _handleImport(BuildContext context, WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );

    if (result == null || result.files.isEmpty) return;

    final fileBytes = result.files.first.bytes;
    if (fileBytes == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not read file.'),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return;
    }

    if (!context.mounted) return;
    final password = await _showPasswordDialog(context, title: 'Enter Import Password');
    if (password == null || password.isEmpty) return;

    try {
      final repo = ref.read(exportRepositoryProvider);
      await repo.importData(fileBytes, password);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data imported successfully.'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } on ExportCryptoException {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password or corrupted file.'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Import failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<String?> _showPasswordDialog(BuildContext context, {required String title}) async {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.darkNavy,
        title: Text(title, style: const TextStyle(color: AppColors.moonWhite)),
        content: TextField(
          controller: controller,
          obscureText: true,
          autofocus: true,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: const InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: AppColors.textMuted),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textMuted),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mutedGold),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: const Text('OK', style: TextStyle(color: AppColors.mutedGold)),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.mutedGold,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _TimePickerButton extends StatelessWidget {
  final String label;
  final String value;
  final ValueChanged<String> onPicked;

  const _TimePickerButton({
    required this.label,
    required this.value,
    required this.onPicked,
  });

  @override
  Widget build(BuildContext context) {
    final parts = value.split(':');
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.textMuted),
        backgroundColor: AppColors.midNavy,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: hour, minute: minute),
          builder: (ctx, child) => Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: AppColors.mutedGold,
                surface: AppColors.darkNavy,
              ),
            ),
            child: child!,
          ),
        );
        if (picked != null) {
          final h = picked.hour.toString().padLeft(2, '0');
          final m = picked.minute.toString().padLeft(2, '0');
          onPicked('$h:$m');
        }
      },
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: Icon(icon, color: AppColors.mutedGold, size: 20),
        label: Text(label, style: const TextStyle(color: AppColors.textPrimary, fontSize: 15)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: const BorderSide(color: AppColors.dimGold),
          backgroundColor: AppColors.midNavy,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class _MoonStylePicker extends ConsumerWidget {
  const _MoonStylePicker();

  static const _styles = [
    ('classic', 'Classic'),
    ('starfield', 'Starfield'),
    ('aura', 'Aura'),
    ('halo', 'Halo'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(settingsProvider.select((s) => s.moonStyle));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _styles.map((entry) {
        final (value, label) = entry;
        final selected = current == value;
        return GestureDetector(
          onTap: () => ref.read(settingsProvider.notifier).setMoonStyle(value),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? AppColors.mutedGold.withValues(alpha: 0.15)
                      : AppColors.midNavy,
                  border: Border.all(
                    color: selected
                        ? AppColors.mutedGold
                        : AppColors.textMuted.withValues(alpha: 0.3),
                    width: selected ? 2 : 1,
                  ),
                ),
                child: Center(
                  child: Icon(
                    _iconFor(value),
                    color: selected ? AppColors.mutedGold : AppColors.textSecondary,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: selected ? AppColors.mutedGold : AppColors.textMuted,
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  static IconData _iconFor(String style) {
    return switch (style) {
      'starfield' => Icons.star_outline,
      'aura' => Icons.flare,
      'halo' => Icons.lens_blur,
      _ => Icons.circle_outlined,
    };
  }
}
