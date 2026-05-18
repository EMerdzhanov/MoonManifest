import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/data/models/cycle.dart';
import 'package:moon_manifest/data/models/lunar_state.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class FullMoonScreen extends ConsumerStatefulWidget {
  const FullMoonScreen({super.key});

  @override
  ConsumerState<FullMoonScreen> createState() => _FullMoonScreenState();
}

class _FullMoonScreenState extends ConsumerState<FullMoonScreen> {
  final TextEditingController _gratitudeController = TextEditingController();
  int _currentIntentionIndex = 0;
  bool _isListening = false;
  bool _speechAvailable = false;
  bool _speechInitialized = false;
  stt.SpeechToText? _speech;

  @override
  void initState() {
    super.initState();
    // Speech is lazy-initialized on first mic tap to avoid
    // native crashes on iOS simulator where speech APIs are unavailable.
  }

  Future<void> _initSpeechIfNeeded() async {
    if (_speechInitialized) return;
    _speechInitialized = true;
    try {
      _speech = stt.SpeechToText();
      final available = await _speech!.initialize(
        onError: (error) {
          if (mounted) setState(() => _isListening = false);
        },
        onStatus: (status) {
          if ((status == 'done' || status == 'notListening') && mounted) {
            setState(() => _isListening = false);
          }
        },
      );
      if (mounted) {
        setState(() => _speechAvailable = available);
      }
    } catch (e) {
      debugPrint('Speech init failed: $e');
      _speechAvailable = false;
    }
  }

  @override
  void dispose() {
    _gratitudeController.dispose();
    _speech?.stop();
    super.dispose();
  }

  Future<void> _toggleListening() async {
    await _initSpeechIfNeeded();
    if (!_speechAvailable || _speech == null) return;

    if (_isListening) {
      await _speech!.stop();
      setState(() => _isListening = false);
    } else {
      setState(() => _isListening = true);
      try {
        await _speech!.listen(
          onResult: (result) {
            if (result.recognizedWords.isNotEmpty) {
              final current = _gratitudeController.text;
              final separator = current.isEmpty ? '' : ' ';
              _gratitudeController.text = current + separator + result.recognizedWords;
              _gratitudeController.selection = TextSelection.fromPosition(
                TextPosition(offset: _gratitudeController.text.length),
              );
            }
          },
          listenFor: const Duration(seconds: 30),
          pauseFor: const Duration(seconds: 5),
          listenOptions: stt.SpeechListenOptions(partialResults: false),
        );
      } catch (e) {
        debugPrint('Speech listen failed: $e');
        setState(() => _isListening = false);
      }
    }
  }

  Future<void> _confirmGratitude(Cycle cycle, List<Intention> intentions) async {
    final text = _gratitudeController.text.trim();
    if (text.isEmpty) return;

    final intention = intentions[_currentIntentionIndex];
    final gratitude = Gratitude(
      intentionId: intention.id,
      text: text,
      createdAt: DateTime.now(),
    );

    await ref.read(activeCycleProvider.notifier).addGratitude(gratitude);

    if (_currentIntentionIndex < intentions.length - 1) {
      await HapticFeedback.lightImpact();
      setState(() {
        _currentIntentionIndex++;
        _gratitudeController.clear();
      });
    } else {
      await HapticFeedback.heavyImpact();
      await ref.read(activeCycleProvider.notifier).completeGratitude();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lunarAsync = ref.watch(lunarStateProvider);
    final activeCycleAsync = ref.watch(activeCycleProvider);

    return CalmScaffold(
      onSettingsTap: () => context.push('/settings'),
      onHistoryTap: () => context.push('/history'),
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
          return activeCycleAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.mutedGold),
            ),
            error: (err, _) => Center(
              child: Text(
                'Something went wrong.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            data: (cycle) {
              if (cycle == null || cycle.intentions.isEmpty) {
                return _buildNoIntentionsView(context);
              }
              if (cycle.gratitudeCompleted) {
                return _buildCompletedView(context, lunarState);
              }
              return _buildCeremonyView(context, cycle, lunarState.isGracePeriod, lunarState.graceDeadline);
            },
          );
        },
      ),
    );
  }

  Widget _buildNoIntentionsView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MoonPhaseIndicator(
              illumination: ref.watch(lunarStateProvider).valueOrNull?.illumination ?? 1.0,
              phase: MoonPhase.fullMoon,
              size: 140,
            ),
            const SizedBox(height: 48),
            Text(
              'No intentions were set this cycle',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedView(BuildContext context, LunarState lunarState) {
    final nextNewMoon = lunarState.nextNewMoon.toLocal();
    final dateStr = DateFormat('MMMM d').format(nextNewMoon);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const Spacer(flex: 3),
          MoonPhaseIndicator(
            illumination: ref.watch(lunarStateProvider).valueOrNull?.illumination ?? 1.0,
            phase: MoonPhase.fullMoon,
            size: 140,
          ),
          const SizedBox(height: 48),
          Text(
            'The work is done.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Now release.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.mutedGold,
                  letterSpacing: 1.2,
                ),
          ),
          const Spacer(flex: 4),
          Text(
            'The waning phase begins soon.\nYour next cycle starts at the new moon on $dateStr.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildCeremonyView(
    BuildContext context,
    Cycle cycle,
    bool isGracePeriod,
    DateTime? graceDeadline,
  ) {
    final intentions = cycle.intentions;
    final safeIndex = _currentIntentionIndex.clamp(0, intentions.length - 1);
    final intention = intentions[safeIndex];
    final isLastIntention = safeIndex == intentions.length - 1;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 91),
          MoonPhaseIndicator(
            illumination: ref.watch(lunarStateProvider).valueOrNull?.illumination ?? 1.0,
            phase: MoonPhase.fullMoon,
            size: 140,
          ),
          const SizedBox(height: 48),
          Text(
            'Full Moon. Give thanks.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
          ),
          if (isGracePeriod && graceDeadline != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.dimGold,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Grace period active',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.mutedGold,
                      letterSpacing: 0.8,
                    ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Text(
            'Thank the universe as if you already have what you asked for',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 24),
          // Progress indicator
          if (intentions.length > 1) ...[
            Text(
              '${safeIndex + 1} of ${intentions.length}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 0.8,
                  ),
            ),
            const SizedBox(height: 12),
          ],
          // Intention card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.cardDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.dimGold, width: 1),
            ),
            child: Text(
              intention.text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textPrimary,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          const SizedBox(height: 24),
          // Gratitude input
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _gratitudeController,
                  maxLines: 5,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: 'I am so grateful that\u2026',
                    filled: true,
                    fillColor: AppColors.cardDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.mutedGold, width: 1),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                ),
              ),
              if (_speechAvailable) ...[
                const SizedBox(width: 8),
                Material(
                  color: _isListening ? AppColors.mutedGold : AppColors.cardDark,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: _toggleListening,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Icon(
                        _isListening ? Icons.mic : Icons.mic_none_outlined,
                        color: _isListening ? AppColors.deepIndigo : AppColors.textSecondary,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          // Action button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _confirmGratitude(cycle, intentions),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mutedGold,
                foregroundColor: AppColors.deepIndigo,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                isLastIntention ? 'Complete ceremony' : 'Next intention',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.deepIndigo,
                      letterSpacing: 0.8,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
