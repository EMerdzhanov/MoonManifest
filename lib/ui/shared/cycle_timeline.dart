import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/moon/moon_phase_engine.dart';
import 'package:moon_manifest/data/models/lunar_state.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class TimelineEntry {
  final String date;
  final String title;
  final String subtitle;
  final MoonPhase phase;
  final bool isCurrent;
  final bool isActive;
  final bool isFutureCycle;

  const TimelineEntry({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.phase,
    required this.isCurrent,
    required this.isActive,
    this.isFutureCycle = false,
  });
}

/// Computes the timeline entries for the current lunar cycle.
List<TimelineEntry> buildCycleTimeline(LunarState lunarState, MoonPhaseEngine engine) {
  final now = engine.now;
  final phaseInfo = engine.currentPhase(now);
  final nextNewMoon = phaseInfo.nextNewMoon;
  final nextFullMoon = phaseInfo.nextFullMoon;

  DateTime cycleNewMoon;
  DateTime cycleFullMoon;
  DateTime cycleEnd;

  if (lunarState.phase == MoonPhase.newMoon ||
      lunarState.phase == MoonPhase.waxing) {
    cycleNewMoon = phaseInfo.phaseStart;
    if (lunarState.phase == MoonPhase.waxing) {
      cycleNewMoon = phaseInfo.phaseStart.subtract(const Duration(days: 3));
      cycleNewMoon = engine.currentPhase(cycleNewMoon).phaseStart;
    }
    cycleFullMoon = nextFullMoon;
    cycleEnd = engine.nextNewMoon(cycleFullMoon);
  } else if (lunarState.phase == MoonPhase.fullMoon) {
    cycleFullMoon = phaseInfo.phaseStart;
    final beforeFull = cycleFullMoon.subtract(const Duration(days: 12));
    cycleNewMoon = engine.currentPhase(beforeFull).phaseStart;
    if (engine.currentPhase(beforeFull).phase != MoonPhase.newMoon) {
      cycleNewMoon = beforeFull;
    }
    cycleEnd = nextNewMoon;
  } else {
    cycleFullMoon = phaseInfo.phaseStart.subtract(const Duration(days: 3));
    final fullInfo = engine.currentPhase(cycleFullMoon);
    cycleFullMoon = fullInfo.phaseStart;
    final beforeFull = cycleFullMoon.subtract(const Duration(days: 12));
    cycleNewMoon = engine.currentPhase(beforeFull).phaseStart;
    cycleEnd = nextNewMoon;
  }

  final waxingStart = cycleNewMoon.add(const Duration(days: 1));
  final waningStart = cycleFullMoon.add(const Duration(days: 1));
  final waxingDays = cycleFullMoon.difference(waxingStart).inDays;
  final waningDays = cycleEnd.difference(waningStart).inDays;

  final fmt = DateFormat('MMM d');

  return [
    TimelineEntry(
      date: fmt.format(cycleNewMoon.toLocal()),
      title: 'Set intentions',
      subtitle: 'New Moon — plant your seeds',
      phase: MoonPhase.newMoon,
      isCurrent: lunarState.phase == MoonPhase.newMoon,
      isActive: true,
    ),
    TimelineEntry(
      date: '${fmt.format(waxingStart.toLocal())} – ${fmt.format(cycleFullMoon.toLocal().subtract(const Duration(days: 1)))}',
      title: 'Repeat daily',
      subtitle: '$waxingDays days — daily intention reminders',
      phase: MoonPhase.waxing,
      isCurrent: lunarState.phase == MoonPhase.waxing,
      isActive: true,
    ),
    TimelineEntry(
      date: fmt.format(cycleFullMoon.toLocal()),
      title: 'Gratitude ceremony',
      subtitle: 'Full Moon — give thanks as if you already have it',
      phase: MoonPhase.fullMoon,
      isCurrent: lunarState.phase == MoonPhase.fullMoon,
      isActive: true,
    ),
    TimelineEntry(
      date: '${fmt.format(waningStart.toLocal())} – ${fmt.format(cycleEnd.toLocal().subtract(const Duration(days: 1)))}',
      title: 'Release & trust',
      subtitle: '$waningDays days — window closed, silence',
      phase: MoonPhase.waning,
      isCurrent: lunarState.phase == MoonPhase.waning,
      isActive: false,
    ),
    TimelineEntry(
      date: fmt.format(cycleEnd.toLocal()),
      title: 'New cycle begins',
      subtitle: 'Next New Moon — set fresh intentions',
      phase: MoonPhase.newMoon,
      isCurrent: false,
      isActive: true,
      isFutureCycle: true,
    ),
  ];
}

/// Renders a vertical timeline from a list of entries.
class CycleTimelineWidget extends StatelessWidget {
  final List<TimelineEntry> entries;

  const CycleTimelineWidget({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entries.asMap().entries.map((e) {
        final index = e.key;
        final entry = e.value;
        final isLast = index == entries.length - 1;
        return _buildRow(context, entry, isLast);
      }).toList(),
    );
  }

  Widget _buildRow(BuildContext context, TimelineEntry entry, bool isLast) {
    final color = entry.isCurrent
        ? AppColors.mutedGold
        : entry.isActive
            ? const Color(0xFF4A9E6B)
            : const Color(0xFF7B8CBA);

    final dotColor = entry.isCurrent ? AppColors.mutedGold : color;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: entry.isCurrent ? 14 : 10,
                  height: entry.isCurrent ? 14 : 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: entry.isCurrent ? dotColor : Colors.transparent,
                    border: Border.all(color: dotColor, width: 2),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.5,
                      color: AppColors.textMuted.withValues(alpha: 0.2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.date,
                    style: TextStyle(
                      color: entry.isCurrent
                          ? AppColors.mutedGold
                          : AppColors.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          entry.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: entry.isCurrent
                                    ? AppColors.textPrimary
                                    : AppColors.textSecondary,
                                fontWeight: entry.isCurrent
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                        ),
                      ),
                      if (entry.isCurrent)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.mutedGold.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'NOW',
                            style: TextStyle(
                              color: AppColors.mutedGold,
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    entry.subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          height: 1.4,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
