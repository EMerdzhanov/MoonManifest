import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/data/models/cycle.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(historyProvider);

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: AppColors.darkNavy,
        foregroundColor: AppColors.textPrimary,
        title: Text(
          'History',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textPrimary,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.darkNavy, AppColors.deepIndigo],
          ),
        ),
        child: historyAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mutedGold),
          ),
          error: (err, _) => Center(
            child: Text(
              'Something went wrong.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          data: (cycles) {
            if (cycles.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'No completed cycles yet',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: cycles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                // Show newest cycles first
                final cycle = cycles[cycles.length - 1 - index];
                return _CycleCard(cycle: cycle);
              },
            );
          },
        ),
      ),
    );
  }
}

class _CycleCard extends StatefulWidget {
  final Cycle cycle;

  const _CycleCard({required this.cycle});

  @override
  State<_CycleCard> createState() => _CycleCardState();
}

class _CycleCardState extends State<_CycleCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cycle = widget.cycle;
    final dateFormat = DateFormat('MMM d, y');
    final startDate = dateFormat.format(cycle.newMoonDate);
    final endDate = cycle.cycleEndDate != null
        ? dateFormat.format(cycle.cycleEndDate!)
        : 'Ongoing';

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _expanded ? AppColors.dimGold : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$startDate \u2013 $endDate',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${cycle.intentions.length} ${cycle.intentions.length == 1 ? 'intention' : 'intentions'}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textMuted,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                ],
              ),
              // Expanded content
              if (_expanded) ...[
                const SizedBox(height: 16),
                const Divider(color: AppColors.midNavy, height: 1),
                const SizedBox(height: 16),
                // Intentions section
                if (cycle.intentions.isNotEmpty) ...[
                  Text(
                    'Intentions',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.mutedGold,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...cycle.intentions.map((intention) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '\u2022 ',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                            Expanded(
                              child: Text(
                                intention.text,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textSecondary,
                                      height: 1.4,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
                // Gratitudes section
                if (cycle.gratitudes.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    'Gratitudes',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.mutedGold,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...cycle.gratitudes.map((gratitude) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '\u2022 ',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                            Expanded(
                              child: Text(
                                gratitude.text,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textSecondary,
                                      height: 1.4,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
