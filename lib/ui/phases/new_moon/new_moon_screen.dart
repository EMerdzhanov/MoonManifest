import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/data/models/cycle.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/manifestation_guide_screen.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class NewMoonScreen extends ConsumerStatefulWidget {
  const NewMoonScreen({super.key});

  @override
  ConsumerState<NewMoonScreen> createState() => _NewMoonScreenState();
}

class _NewMoonScreenState extends ConsumerState<NewMoonScreen> {
  final List<TextEditingController> _controllers = [
    TextEditingController(),
  ];
  bool _isSubmitting = false;

  static const int _maxIntentions = 7;

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addIntention() {
    if (_controllers.length < _maxIntentions) {
      setState(() {
        _controllers.add(TextEditingController());
      });
    }
  }

  void _removeIntention(int index) {
    if (_controllers.length > 1) {
      setState(() {
        _controllers[index].dispose();
        _controllers.removeAt(index);
      });
    }
  }

  bool get _hasAtLeastOneNonEmpty =>
      _controllers.any((c) => c.text.trim().isNotEmpty);

  Future<void> _plantIntentions() async {
    if (_isSubmitting || !_hasAtLeastOneNonEmpty) return;
    setState(() => _isSubmitting = true);

    final engine = ref.read(moonPhaseEngineProvider);
    final now = engine.now;
    final phaseInfo = engine.currentPhase(now);

    final intentions = _controllers
        .where((c) => c.text.trim().isNotEmpty)
        .map((c) => Intention(
              id: '${now.millisecondsSinceEpoch}_${c.hashCode}',
              text: c.text.trim(),
              createdAt: now,
            ))
        .toList();

    await HapticFeedback.mediumImpact();
    await ref.read(activeCycleProvider.notifier).startCycle(
          id: now.millisecondsSinceEpoch.toString(),
          newMoonDate: phaseInfo.phaseStart,
          intentions: intentions,
        );

    await ref.read(scratchpadProvider.notifier).clear();

    if (mounted) {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lunarAsync = ref.watch(lunarStateProvider);
    final cycleAsync = ref.watch(activeCycleProvider);

    return CalmScaffold(
      onHistoryTap: () => context.push('/history'),
      onSettingsTap: () => context.push('/settings'),
      body: lunarAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.mutedGold),
        ),
        error: (err, _) => Center(
          child: Text(
            'Something went wrong.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        data: (lunarState) {
          final cycle = cycleAsync.valueOrNull;
          final isLocked = cycle != null && cycle.intentionsLocked;

          return isLocked
              ? _buildLockedView(context, cycle, lunarState)
              : _buildInputView(context, lunarState);
        },
      ),
    );
  }

  Widget _buildInputView(BuildContext context, dynamic lunarState) {
    final isGracePeriod = lunarState.isGracePeriod as bool;
    final graceDeadline = lunarState.graceDeadline as DateTime?;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 92),
          MoonPhaseIndicator(
            illumination: lunarState.illumination as double,
            phase: MoonPhase.newMoon,
            size: 140,
          ),
          const SizedBox(height: 48),
          Text(
            'New Moon.\nSet your intentions.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
          ),
          if (isGracePeriod && graceDeadline != null) ...[
            const SizedBox(height: 16),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.dimGold,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: AppColors.mutedGold.withValues(alpha: 0.4),
                    width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.access_time,
                      color: AppColors.mutedGold, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Grace period ends ${DateFormat('MMM d, h:mm a').format(graceDeadline)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.mutedGold,
                        ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Ask yourself: What do I truly need beneath my desires? Set intentions that speak to your underlying needs \u2014 growth, connection, peace, abundance.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ManifestationGuideScreen()),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome, size: 14, color: AppColors.mutedGold.withValues(alpha: 0.7)),
                const SizedBox(width: 6),
                Text(
                  'How to write powerful intentions',
                  style: TextStyle(
                    color: AppColors.mutedGold.withValues(alpha: 0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mutedGold.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Intentions',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _controllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controllers[index],
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Intention ${index + 1}\u2026',
                          filled: true,
                          fillColor: AppColors.cardDark,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: AppColors.mutedGold, width: 1),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                      ),
                    ),
                    if (_controllers.length > 1) ...[
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline,
                            color: AppColors.textMuted),
                        onPressed: () => _removeIntention(index),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
          if (_controllers.length == _maxIntentions) ...[
            const SizedBox(height: 4),
            Text(
              'Seven intentions is a meaningful number. Take care to choose what matters most.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.mutedGold,
                  ),
            ),
          ],
          if (_controllers.length < _maxIntentions) ...[
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: _addIntention,
              icon: const Icon(Icons.add, color: AppColors.mutedGold, size: 18),
              label: Text(
                'Add intention',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.mutedGold,
                    ),
              ),
            ),
          ],
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  (_hasAtLeastOneNonEmpty && !_isSubmitting)
                      ? _plantIntentions
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mutedGold,
                foregroundColor: AppColors.deepIndigo,
                disabledBackgroundColor:
                    AppColors.mutedGold.withValues(alpha: 0.3),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.deepIndigo),
                    )
                  : const Text(
                      'Plant these intentions',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  bool _isEditing = false;
  List<TextEditingController>? _editControllers;

  void _startEditing(Cycle cycle) {
    setState(() {
      _isEditing = true;
      _editControllers = cycle.intentions
          .map((i) => TextEditingController(text: i.text))
          .toList();
    });
  }

  void _cancelEditing() {
    _editControllers?.forEach((c) => c.dispose());
    setState(() {
      _isEditing = false;
      _editControllers = null;
    });
  }

  Future<void> _saveEdits(Cycle cycle) async {
    if (_editControllers == null) return;

    final now = DateTime.now();
    final updated = _editControllers!
        .asMap()
        .entries
        .where((e) => e.value.text.trim().isNotEmpty)
        .map((e) {
      final original = e.key < cycle.intentions.length
          ? cycle.intentions[e.key]
          : null;
      return Intention(
        id: original?.id ?? '${now.millisecondsSinceEpoch}_${e.key}',
        text: e.value.text.trim(),
        createdAt: original?.createdAt ?? now,
      );
    }).toList();

    await HapticFeedback.lightImpact();
    await ref.read(activeCycleProvider.notifier).updateIntentions(updated);

    _editControllers?.forEach((c) => c.dispose());
    setState(() {
      _isEditing = false;
      _editControllers = null;
    });
  }

  Widget _buildLockedView(BuildContext context, Cycle cycle, dynamic lunarState) {
    final canEdit = lunarState.phase == MoonPhase.newMoon;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 92),
          MoonPhaseIndicator(
            illumination: lunarState.illumination as double,
            phase: MoonPhase.newMoon,
            size: 140,
          ),
          const SizedBox(height: 48),
          Text(
            'These are your intentions for this cycle.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            _isEditing
                ? 'Edit your intentions below.'
                : 'They have been planted. Trust the process.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 32),

          if (_isEditing && _editControllers != null) ...[
            // Editable intention fields
            ...List.generate(_editControllers!.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _editControllers![index],
                  decoration: InputDecoration(
                    hintText: 'Intention ${index + 1}...',
                    filled: true,
                    fillColor: AppColors.cardDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: AppColors.mutedGold, width: 1),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                ),
              );
            }),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _cancelEditing,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.textMuted),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _saveEdits(cycle),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mutedGold,
                      foregroundColor: AppColors.deepIndigo,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Save changes'),
                  ),
                ),
              ],
            ),
          ] else ...[
            // Read-only intention cards
            ...cycle.intentions.map(
              (intention) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: AppColors.mutedGold.withValues(alpha: 0.2),
                        width: 1),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.brightness_2_outlined,
                          color: AppColors.mutedGold, size: 16),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          intention.text,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.textPrimary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (canEdit) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _startEditing(cycle),
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: const Text('Edit intentions'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: AppColors.mutedGold.withValues(alpha: 0.5)),
                    foregroundColor: AppColors.mutedGold,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You can edit until the waxing phase begins.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
              ),
            ],
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
