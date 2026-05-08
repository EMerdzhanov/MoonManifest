import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class DebugControls extends ConsumerWidget {
  const DebugControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!kDebugMode) return const SizedBox.shrink();

    final engine = ref.watch(moonPhaseEngineProvider);
    final override = engine.debugDateOverride;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            override != null ? 'DEBUG: ${DateFormat('MMM d, yyyy HH:mm').format(override)}' : 'DEBUG: live',
            style: const TextStyle(color: AppColors.error, fontSize: 10, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () => _showDatePicker(context, ref),
            child: const Icon(Icons.edit_calendar, size: 14, color: AppColors.error),
          ),
          if (override != null) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                engine.debugDateOverride = null;
                ref.read(lunarStateProvider.notifier).refresh();
              },
              child: const Icon(Icons.close, size: 14, color: AppColors.error),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final engine = ref.read(moonPhaseEngineProvider);
    final initialDate = engine.debugDateOverride ?? DateTime.now();

    final date = await showDatePicker(
      context: context, initialDate: initialDate,
      firstDate: DateTime(2020), lastDate: DateTime(2035),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(colorScheme: const ColorScheme.dark(primary: AppColors.mutedGold, surface: AppColors.darkNavy)),
        child: child!,
      ),
    );
    if (date == null || !context.mounted) return;

    final time = await showTimePicker(
      context: context, initialTime: TimeOfDay.fromDateTime(initialDate),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(colorScheme: const ColorScheme.dark(primary: AppColors.mutedGold, surface: AppColors.darkNavy)),
        child: child!,
      ),
    );
    if (time == null) return;

    engine.debugDateOverride = DateTime.utc(date.year, date.month, date.day, time.hour, time.minute);
    ref.read(lunarStateProvider.notifier).refresh();
  }
}
