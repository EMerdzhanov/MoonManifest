import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';

/// A compact horizontal bar showing the 4 phases of the current cycle
/// with a "you are here" indicator. Always visible on phase screens.
class CycleProgressBar extends ConsumerWidget {
  const CycleProgressBar({super.key});

  static const _manifestColor = Color(0xFF4A9E6B);
  static const _releaseColor = Color(0xFF7B8CBA);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lunarAsync = ref.watch(lunarStateProvider);

    return lunarAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (state) {
        final engine = ref.read(moonPhaseEngineProvider);
        final now = engine.now;
        final phaseInfo = engine.currentPhase(now);

        // Compute cycle dates
        final nextNewMoon = phaseInfo.nextNewMoon;
        final nextFullMoon = phaseInfo.nextFullMoon;

        // Estimate cycle boundaries
        // Total cycle is ~29.5 days from one new moon to the next
        DateTime cycleStart;
        DateTime cycleFullMoon;
        DateTime cycleEnd;

        if (state.phase == MoonPhase.newMoon ||
            state.phase == MoonPhase.waxing) {
          cycleStart = phaseInfo.phaseStart;
          if (state.phase == MoonPhase.waxing) {
            cycleStart =
                phaseInfo.phaseStart.subtract(const Duration(days: 3));
            cycleStart = engine.currentPhase(cycleStart).phaseStart;
          }
          cycleFullMoon = nextFullMoon;
          cycleEnd = engine.nextNewMoon(cycleFullMoon);
        } else if (state.phase == MoonPhase.fullMoon) {
          cycleFullMoon = phaseInfo.phaseStart;
          final before = cycleFullMoon.subtract(const Duration(days: 12));
          cycleStart = engine.currentPhase(before).phaseStart;
          cycleEnd = nextNewMoon;
        } else {
          // Waning
          final before =
              phaseInfo.phaseStart.subtract(const Duration(days: 3));
          cycleFullMoon = engine.currentPhase(before).phaseStart;
          final beforeFull =
              cycleFullMoon.subtract(const Duration(days: 12));
          cycleStart = engine.currentPhase(beforeFull).phaseStart;
          cycleEnd = nextNewMoon;
        }

        final totalDuration =
            cycleEnd.difference(cycleStart).inHours.toDouble();
        if (totalDuration <= 0) return const SizedBox.shrink();

        // Phase segment positions (as fractions of total cycle)
        final fullMoonFrac =
            cycleFullMoon.difference(cycleStart).inHours / totalDuration;
        final currentFrac =
            now.difference(cycleStart).inHours / totalDuration;

        // New moon ~1 day, waxing ~14 days, full moon ~1 day, waning ~14 days
        const newMoonFrac = 1.0 / 29.5;
        final waningStart = fullMoonFrac + newMoonFrac;

        final fmt = DateFormat('MMM d');

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              // The bar
              SizedBox(
                height: 20,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final dotX =
                        (currentFrac.clamp(0.0, 1.0) * width).toDouble();

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Track segments
                        Positioned.fill(
                          child: Row(
                            children: [
                              // New Moon segment
                              _Segment(
                                flex: (newMoonFrac * 1000).round(),
                                color: _manifestColor,
                                isFirst: true,
                              ),
                              // Waxing segment
                              _Segment(
                                flex: ((fullMoonFrac - newMoonFrac) * 1000)
                                    .round(),
                                color: _manifestColor,
                              ),
                              // Full Moon segment
                              _Segment(
                                flex: (newMoonFrac * 1000).round(),
                                color: _manifestColor,
                              ),
                              // Waning segment
                              _Segment(
                                flex: ((1.0 - waningStart) * 1000).round(),
                                color: _releaseColor,
                                isLast: true,
                              ),
                            ],
                          ),
                        ),
                        // "You are here" dot
                        Positioned(
                          left: dotX - 5,
                          top: 2,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mutedGold,
                              border: Border.all(
                                color: AppColors.deepIndigo,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.mutedGold.withValues(alpha: 0.4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Phase divider at full moon
                        Positioned(
                          left: (fullMoonFrac.clamp(0.0, 1.0) * width) - 0.5,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 1,
                            color: AppColors.textMuted.withValues(alpha: 0.3),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 6),
              // Date labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fmt.format(cycleStart.toLocal()),
                    style: TextStyle(
                      color: AppColors.textMuted.withValues(alpha: 0.6),
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    state.phase.displayName,
                    style: const TextStyle(
                      color: AppColors.mutedGold,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    fmt.format(cycleEnd.toLocal()),
                    style: TextStyle(
                      color: AppColors.textMuted.withValues(alpha: 0.6),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Segment extends StatelessWidget {
  final int flex;
  final Color color;
  final bool isFirst;
  final bool isLast;

  const _Segment({
    required this.flex,
    required this.color,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex > 0 ? flex : 1,
      child: Container(
        height: 4,
        margin: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: isFirst ? 0 : 1,
          right: isLast ? 0 : 1,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.4),
          borderRadius: BorderRadius.horizontal(
            left: isFirst ? const Radius.circular(2) : Radius.zero,
            right: isLast ? const Radius.circular(2) : Radius.zero,
          ),
        ),
      ),
    );
  }
}
