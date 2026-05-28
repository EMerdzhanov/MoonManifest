import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/manifestation_guide_screen.dart';
import 'package:moon_manifest/ui/shared/lunar_cycle_screen.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class WaitingScreen extends ConsumerStatefulWidget {
  const WaitingScreen({super.key});

  @override
  ConsumerState<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends ConsumerState<WaitingScreen> {
  List<TextEditingController> _controllers = [TextEditingController()];
  bool _scratchpadLoaded = false;
  bool _showSavedIndicator = false;

  static const int _maxIntentions = 7;

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _saveDrafts() {
    final text = _controllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .join('\n');
    ref.read(scratchpadProvider.notifier).save(text);
    setState(() => _showSavedIndicator = false);
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _showSavedIndicator = true);
      }
    });
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
      _saveDrafts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lunarAsync = ref.watch(lunarStateProvider);
    final scratchpadAsync = ref.watch(scratchpadProvider);

    // Load scratchpad text on first build
    if (!_scratchpadLoaded) {
      scratchpadAsync.whenData((text) {
        if (text != null && text.trim().isNotEmpty) {
          final lines = text.split('\n').where((l) => l.trim().isNotEmpty).toList();
          if (lines.isNotEmpty) {
            for (final c in _controllers) {
              c.dispose();
            }
            _controllers = lines
                .take(_maxIntentions)
                .map((l) => TextEditingController(text: l.trim()))
                .toList();
          }
        }
        _scratchpadLoaded = true;
      });
    }

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
        data: (state) {
          final engine = ref.read(moonPhaseEngineProvider);
          final nextNewMoon = state.nextNewMoon;
          final daysUntil = nextNewMoon.difference(engine.now).inDays;
          final formattedDate =
              DateFormat('MMMM d').format(nextNewMoon);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 101),
                MoonPhaseIndicator(
                  illumination: state.illumination,
                  phase: state.phase,
                  size: 140,
                ),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.dimGold,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.mutedGold.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.schedule, color: AppColors.mutedGold, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'The manifestation window is not yet open',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.mutedGold,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your first cycle begins at the new moon on $formattedDate.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$daysUntil',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              fontFamily: 'CormorantGaramond',
                              fontSize: 64,
                              color: AppColors.mutedGold,
                            ),
                      ),
                      Text(
                        daysUntil == 1 ? 'day away' : 'days away',
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                  letterSpacing: 1.2,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Prepare while you wait
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Prepare while you wait',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.mutedGold,
                        ),
                  ),
                ),
                const SizedBox(height: 12),

                _PrepCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Learn how to manifest',
                  subtitle: 'The 4 rules that make this practice work',
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ManifestationGuideScreen()),
                  ),
                ),
                const SizedBox(height: 10),
                _PrepCard(
                  icon: Icons.dark_mode_outlined,
                  title: 'Understand the lunar cycle',
                  subtitle: 'See where you are and what each phase means',
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LunarCycleScreen()),
                  ),
                ),

                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Draft your intentions',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Use this space to reflect and prepare. What do you wish to call in?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 12),
                ...List.generate(_controllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controllers[index],
                            onChanged: (_) => _saveDrafts(),
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
                }),
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
                const SizedBox(height: 8),
                AnimatedOpacity(
                  opacity: _showSavedIndicator ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 12, color: AppColors.mutedGold.withValues(alpha: 0.7)),
                      const SizedBox(width: 4),
                      Text(
                        'Draft saved',
                        style: TextStyle(
                          color: AppColors.mutedGold.withValues(alpha: 0.7),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PrepCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PrepCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.mutedGold.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22, color: AppColors.mutedGold),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
