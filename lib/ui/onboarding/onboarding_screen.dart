import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/ui/onboarding/widgets/onboarding_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedFrequency = 3;
  TimeOfDay _wakeStart = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay _wakeEnd = const TimeOfDay(hour: 22, minute: 0);

  static const int _totalPages = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> _pickTime({required bool isStart}) async {
    final initial = isStart ? _wakeStart : _wakeEnd;
    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.mutedGold,
              onPrimary: AppColors.deepIndigo,
              surface: AppColors.cardDark,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _wakeStart = picked;
        } else {
          _wakeEnd = picked;
        }
      });
    }
  }

  void _advance() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _begin();
    }
  }

  Future<void> _begin() async {
    final notifier = ref.read(settingsProvider.notifier);
    await notifier.setNotificationFrequency(_selectedFrequency);
    await notifier.setWakeWindow(
      _formatTime(_wakeStart),
      _formatTime(_wakeEnd),
    );
    await notifier.setOnboardingComplete();
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalPages, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.mutedGold : AppColors.textMuted,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildWelcomePage() {
    return OnboardingPage(
      title: 'Welcome to\nMoon Manifest',
      body: 'This app guides a manifestation practice tied to the moon.',
      illustration: Icon(
        Icons.nightlight_round,
        size: 96,
        color: AppColors.moonSilver,
      ),
    );
  }

  Widget _buildCyclePage() {
    const phases = [
      (MoonPhase.newMoon, 0.0),
      (MoonPhase.waxing, 0.5),
      (MoonPhase.fullMoon, 1.0),
      (MoonPhase.waning, 0.5),
    ];

    return OnboardingPage(
      title: 'The Cycle',
      body: 'Each lunar month flows through four distinct phases, each with its own energy.',
      illustration: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: phases.map((entry) {
          final (phase, illumination) = entry;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MoonPhaseIndicator(
                  illumination: illumination,
                  phase: phase,
                  size: 56,
                ),
                const SizedBox(height: 8),
                Text(
                  phase.displayName,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWhatYouDoPage() {
    const phaseDescriptions = [
      (MoonPhase.newMoon, 'Set intentions and plant seeds for new beginnings.'),
      (MoonPhase.waxing, 'Take action and build momentum toward your goals.'),
      (MoonPhase.fullMoon, 'Celebrate wins and release what no longer serves you.'),
      (MoonPhase.waning, 'Reflect, rest, and integrate lessons learned.'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What You\'ll Do',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ...phaseDescriptions.map((entry) {
            final (phase, desc) = entry;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MoonPhaseIndicator(
                    illumination: phase == MoonPhase.newMoon
                        ? 0.0
                        : phase == MoonPhase.fullMoon
                            ? 1.0
                            : 0.5,
                    phase: phase,
                    size: 36,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          phase.displayName,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.moonSilver,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          desc,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPreferencesPage() {
    const frequencies = [3, 6, 9];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text(
            'Your Preferences',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Customize how and when you receive guidance.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text(
            'Notification Frequency',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'How many reminders per phase?',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: frequencies.map((freq) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ChoiceChip(
                  label: Text('$freq / phase'),
                  selected: _selectedFrequency == freq,
                  onSelected: (_) => setState(() => _selectedFrequency = freq),
                  selectedColor: AppColors.mutedGold,
                  backgroundColor: AppColors.cardDark,
                  labelStyle: TextStyle(
                    color: _selectedFrequency == freq
                        ? AppColors.deepIndigo
                        : AppColors.textSecondary,
                    fontWeight: _selectedFrequency == freq
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                  side: BorderSide(
                    color: _selectedFrequency == freq
                        ? AppColors.mutedGold
                        : AppColors.textMuted,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 36),
          Text(
            'Wake Window',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'We\'ll only send notifications during this window.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _TimePickerTile(
                  label: 'Wake Up',
                  time: _wakeStart,
                  onTap: () => _pickTime(isStart: true),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TimePickerTile(
                  label: 'Wind Down',
                  time: _wakeEnd,
                  onTap: () => _pickTime(isStart: false),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _totalPages - 1;

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: [
                  _buildWelcomePage(),
                  _buildCyclePage(),
                  _buildWhatYouDoPage(),
                  _buildPreferencesPage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
              child: Column(
                children: [
                  _buildPageIndicators(),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _advance,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.mutedGold,
                        foregroundColor: AppColors.deepIndigo,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        isLastPage ? 'Begin' : 'Continue',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimePickerTile extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;

  const _TimePickerTile({
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.textMuted.withValues(alpha: 0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: AppColors.mutedGold),
                const SizedBox(width: 6),
                Text(
                  time.format(context),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
