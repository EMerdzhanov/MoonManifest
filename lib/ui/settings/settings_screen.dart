import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/crypto/export_crypto.dart';
import 'package:moon_manifest/data/repositories/export_repository.dart';
import 'package:moon_manifest/l10n/app_localizations.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/ui/shared/manifestation_guide_screen.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

final exportRepositoryProvider = Provider<ExportRepository>((ref) {
  return ExportRepository(ref.watch(cycleRepositoryProvider), ExportCrypto());
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: AppColors.darkNavy,
        leading: const BackButton(color: AppColors.moonSilver),
        title: Text(
          l10n.settingsTitle,
          style: const TextStyle(color: AppColors.moonWhite, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Notifications section
          _SectionCard(
            title: l10n.settingsNotifications,
            children: [
              Text(
                l10n.settingsReminderFrequency,
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
              Row(
                children: [3, 6, 9].map((freq) {
                  final selected = settings.notificationFrequency == freq;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(
                        '$freq\u00d7',
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
              Text(
                l10n.settingsWakeWindow,
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _TimePickerButton(
                      label: l10n.settingsWakeWindowStart,
                      value: settings.wakeWindowStart,
                      onPicked: (time) {
                        ref.read(settingsProvider.notifier).setWakeWindow(time, settings.wakeWindowEnd);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _TimePickerButton(
                      label: l10n.settingsWakeWindowEnd,
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
            title: l10n.settingsMoonStyle,
            children: [
              Text(
                l10n.settingsMoonStyleDescription,
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 16),
              const _MoonStylePicker(),
            ],
          ),
          const SizedBox(height: 16),

          // Language section
          _SectionCard(
            title: l10n.settingsLanguage,
            children: [
              Text(
                l10n.settingsLanguageDescription,
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
              _LanguagePicker(currentLocale: settings.locale),
            ],
          ),
          const SizedBox(height: 16),

          // Data section
          _SectionCard(
            title: l10n.settingsData,
            children: [
              _ActionButton(
                icon: Icons.upload_outlined,
                label: l10n.settingsExportData,
                onPressed: () => _handleExport(context, ref),
              ),
              const SizedBox(height: 12),
              _ActionButton(
                icon: Icons.download_outlined,
                label: l10n.settingsImportData,
                onPressed: () => _handleImport(context, ref),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // About section
          _SectionCard(
            title: l10n.settingsAbout,
            children: [
              Text(
                l10n.settingsAboutDescription,
                style: const TextStyle(
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
                      l10n.settingsManifestationGuide,
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
    final l10n = AppLocalizations.of(context)!;
    final password = await _showPasswordDialog(context, title: l10n.settingsExportPasswordTitle);
    if (password == null || password.isEmpty) return;

    try {
      final repo = ref.read(exportRepositoryProvider);
      final encrypted = await repo.exportData(password);

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/moon_manifest_backup.mmb');
      await file.writeAsBytes(encrypted);

      await Share.shareXFiles(
        [XFile(file.path, mimeType: 'application/octet-stream')],
        subject: l10n.settingsExportSubject,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.settingsExportFailed(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _handleImport(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );

    if (result == null || result.files.isEmpty) return;

    final fileBytes = result.files.first.bytes;
    if (fileBytes == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.settingsCouldNotReadFile),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return;
    }

    if (!context.mounted) return;
    final password = await _showPasswordDialog(context, title: l10n.settingsImportPasswordTitle);
    if (password == null || password.isEmpty) return;

    try {
      final repo = ref.read(exportRepositoryProvider);
      await repo.importData(fileBytes, password);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.settingsDataImported),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } on ExportCryptoException {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.settingsWrongPassword),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.settingsImportFailed(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<String?> _showPasswordDialog(BuildContext context, {required String title}) async {
    final l10n = AppLocalizations.of(context)!;
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
          decoration: InputDecoration(
            hintText: l10n.settingsPasswordHint,
            hintStyle: const TextStyle(color: AppColors.textMuted),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textMuted),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mutedGold),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.commonCancel, style: const TextStyle(color: AppColors.textSecondary)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: Text(l10n.commonOk, style: const TextStyle(color: AppColors.mutedGold)),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.watch(settingsProvider.select((s) => s.moonStyle));

    final styles = [
      ('classic', l10n.settingsMoonStyleClassic),
      ('starfield', l10n.settingsMoonStyleStarfield),
      ('aura', l10n.settingsMoonStyleAura),
      ('halo', l10n.settingsMoonStyleHalo),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: styles.map((entry) {
        final (value, label) = entry;
        final selected = current == value;
        return GestureDetector(
          onTap: () {
            if (current != value) {
              HapticFeedback.lightImpact();
              ref.read(settingsProvider.notifier).setMoonStyle(value);
            }
          },
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 64,
                height: 64,
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
                  child: MoonPhaseIndicator(
                    illumination: 0.5,
                    phase: MoonPhase.waxing,
                    size: 40,
                    styleOverride: value,
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
}

class _LanguagePicker extends ConsumerWidget {
  final String? currentLocale;

  const _LanguagePicker({required this.currentLocale});

  // Language code -> native display name (always shown in native script)
  static const _languages = [
    (null, 'Device default'), // will be replaced with l10n key
    ('en', 'English'),
    ('bg', '\u0411\u044a\u043b\u0433\u0430\u0440\u0441\u043a\u0438'),
    ('de', 'Deutsch'),
    ('es', 'Espa\u00f1ol'),
    ('fr', 'Fran\u00e7ais'),
    ('hi', '\u0939\u093f\u0928\u094d\u0926\u0940'),
    ('ja', '\u65e5\u672c\u8a9e'),
    ('pt', 'Portugu\u00eas'),
    ('ru', '\u0420\u0443\u0441\u0441\u043a\u0438\u0439'),
    ('tr', 'T\u00fcrk\u00e7e'),
    ('zh', '\u4e2d\u6587'),
  ];

  String _currentDisplayName(AppLocalizations l10n) {
    if (currentLocale == null) return l10n.settingsDeviceDefault;
    for (final (code, name) in _languages) {
      if (code == currentLocale) return name;
    }
    return currentLocale!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () => _showLanguageSheet(context, ref, l10n),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.midNavy,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.textMuted),
        ),
        child: Row(
          children: [
            const Icon(Icons.language, size: 18, color: AppColors.mutedGold),
            const SizedBox(width: 10),
            Text(
              _currentDisplayName(l10n),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }

  void _showLanguageSheet(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkNavy,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textMuted.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.settingsLanguage,
                      style: const TextStyle(
                        color: AppColors.mutedGold,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ..._languages.map((entry) {
                  final (code, nativeName) = entry;
                  final isSelected = currentLocale == code;
                  final displayName = code == null ? l10n.settingsDeviceDefault : nativeName;

                  return ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    title: Text(
                      displayName,
                      style: TextStyle(
                        color: isSelected ? AppColors.mutedGold : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check, size: 18, color: AppColors.mutedGold)
                        : null,
                    onTap: () {
                      ref.read(settingsProvider.notifier).setLocale(code);
                      Navigator.of(ctx).pop();
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
