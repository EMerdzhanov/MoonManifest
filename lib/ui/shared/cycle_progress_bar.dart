import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/cycle_timeline.dart';
import 'package:moon_manifest/ui/shared/lunar_cycle_screen.dart';

/// A compact horizontal bar that expands to show the cycle timeline on tap.
class CycleProgressBar extends ConsumerStatefulWidget {
  const CycleProgressBar({super.key});

  @override
  ConsumerState<CycleProgressBar> createState() => _CycleProgressBarState();
}

class _CycleProgressBarState extends ConsumerState<CycleProgressBar> {
  static const _manifestColor = Color(0xFF4A9E6B);
  static const _releaseColor = Color(0xFF7B8CBA);

  @override
  Widget build(BuildContext context) {
    final lunarAsync = ref.watch(lunarStateProvider);

    return lunarAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (state) {
        final engine = ref.read(moonPhaseEngineProvider);
        final now = engine.now;
        final phaseInfo = engine.currentPhase(now);

        final nextNewMoon = phaseInfo.nextNewMoon;
        final nextFullMoon = phaseInfo.nextFullMoon;

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

        final fullMoonFrac =
            cycleFullMoon.difference(cycleStart).inHours / totalDuration;
        final currentFrac =
            now.difference(cycleStart).inHours / totalDuration;

        const newMoonFrac = 1.0 / 29.5;
        final waningStart = fullMoonFrac + newMoonFrac;

        final fmt = DateFormat('MMM d');

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Tappable bar
              GestureDetector(
                onTap: () => _showTimelineSheet(context, state, engine),
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
                              Positioned.fill(
                                child: Row(
                                  children: [
                                    _Segment(
                                      flex: (newMoonFrac * 1000).round(),
                                      color: _manifestColor,
                                      isFirst: true,
                                    ),
                                    _Segment(
                                      flex: ((fullMoonFrac - newMoonFrac) * 1000)
                                          .round(),
                                      color: _manifestColor,
                                    ),
                                    _Segment(
                                      flex: (newMoonFrac * 1000).round(),
                                      color: _manifestColor,
                                    ),
                                    _Segment(
                                      flex: ((1.0 - waningStart) * 1000).round(),
                                      color: _releaseColor,
                                      isLast: true,
                                    ),
                                  ],
                                ),
                              ),
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
                                        color: AppColors.mutedGold
                                            .withValues(alpha: 0.4),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: (fullMoonFrac.clamp(0.0, 1.0) * width) -
                                    0.5,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: 1,
                                  color: AppColors.textMuted
                                      .withValues(alpha: 0.3),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Date labels + expand hint
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.phase.displayName,
                              style: const TextStyle(
                                color: AppColors.mutedGold,
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_up,
                              size: 12,
                              color: AppColors.textMuted,
                            ),
                          ],
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
              ),

            ],
          ),
        );
      },
    );
  }

  void _showTimelineSheet(BuildContext context, dynamic state, dynamic engine) {
    final entries = buildCycleTimeline(state, engine);

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkNavy,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      builder: (ctx) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'This Cycle',
              style: Theme.of(ctx).textTheme.displaySmall?.copyWith(
                    color: AppColors.mutedGold,
                  ),
            ),
            const SizedBox(height: 20),
            CycleTimelineWidget(entries: entries),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const LunarCycleScreen()),
                  );
                },
                child: Text(
                  'See full cycle details',
                  style: TextStyle(
                    color: AppColors.mutedGold.withValues(alpha: 0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        AppColors.mutedGold.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
