import 'package:flutter/material.dart';
import 'package:moon_manifest/l10n/app_localizations.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class ManifestationGuideScreen extends StatelessWidget {
  const ManifestationGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textSecondary),
        title: Text(
          l10n.guideTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.darkNavy, AppColors.deepIndigo],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              _body(context, l10n.guideIntro),

              const SizedBox(height: 40),

              // -- RULE 1 --
              _ruleNumber(context, l10n.guideRule01),
              const SizedBox(height: 8),
              _heading(context, l10n.guideRule01Title),
              const SizedBox(height: 16),
              _body(context, l10n.guideRule01Body1),
              const SizedBox(height: 12),
              _body(context, l10n.guideRule01Body2),
              const SizedBox(height: 20),

              _exampleWrong(context, l10n.guideRule01Wrong1),
              _exampleRight(context, l10n.guideRule01Right1),
              const SizedBox(height: 8),
              _exampleWrong(context, l10n.guideRule01Wrong2),
              _exampleRight(context, l10n.guideRule01Right2),
              const SizedBox(height: 8),
              _exampleWrong(context, l10n.guideRule01Wrong3),
              _exampleRight(context, l10n.guideRule01Right3),

              const SizedBox(height: 48),

              // -- RULE 2 --
              _ruleNumber(context, l10n.guideRule02),
              const SizedBox(height: 8),
              _heading(context, l10n.guideRule02Title),
              const SizedBox(height: 16),
              _body(context, l10n.guideRule02Body1),
              const SizedBox(height: 12),
              _body(context, l10n.guideRule02Body2),
              const SizedBox(height: 20),

              _ruleCard(context, [
                l10n.guideRule02Tip1,
                l10n.guideRule02Tip2,
                l10n.guideRule02Tip3,
              ]),

              const SizedBox(height: 20),
              _exampleRight(context, l10n.guideRule02Right1),
              const SizedBox(height: 8),
              _exampleRight(context, l10n.guideRule02Right2),
              const SizedBox(height: 8),
              _exampleRight(context, l10n.guideRule02Right3),

              const SizedBox(height: 48),

              // -- RULE 3 --
              _ruleNumber(context, l10n.guideRule03),
              const SizedBox(height: 8),
              _heading(context, l10n.guideRule03Title),
              const SizedBox(height: 16),
              _body(context, l10n.guideRule03Body1),
              const SizedBox(height: 12),
              _body(context, l10n.guideRule03Body2),
              const SizedBox(height: 20),

              _exampleWrong(context, l10n.guideRule03Wrong1),
              _exampleRight(context, l10n.guideRule03Right1),
              const SizedBox(height: 8),
              _exampleWrong(context, l10n.guideRule03Wrong2),
              _exampleRight(context, l10n.guideRule03Right2),

              const SizedBox(height: 48),

              // -- RULE 4 --
              _ruleNumber(context, l10n.guideRule04),
              const SizedBox(height: 8),
              _heading(context, l10n.guideRule04Title),
              const SizedBox(height: 16),
              _body(context, l10n.guideRule04Body1),
              const SizedBox(height: 12),
              _body(context, l10n.guideRule04Body2),
              const SizedBox(height: 20),

              _exampleRight(context, l10n.guideRule04Right1),
              const SizedBox(height: 8),
              _exampleRight(context, l10n.guideRule04Right2),
              const SizedBox(height: 8),
              _exampleRight(context, l10n.guideRule04Right3),

              const SizedBox(height: 48),

              // -- CLOSING --
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.mutedGold.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    l10n.guideClosing,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.mutedGold,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ruleNumber(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.mutedGold.withValues(alpha: 0.5),
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 3.0,
      ),
    );
  }

  Widget _heading(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppColors.textPrimary,
            height: 1.3,
          ),
    );
  }

  Widget _body(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.8,
          ),
    );
  }

  Widget _exampleWrong(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(Icons.close, size: 14,
                color: AppColors.textMuted.withValues(alpha: 0.5)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '"$text"',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textMuted,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.textMuted.withValues(alpha: 0.5),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleRight(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(Icons.auto_awesome, size: 14, color: AppColors.mutedGold),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '"$text"',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.softGold,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ruleCard(BuildContext context, List<String> rules) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rules
            .map((rule) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Icon(Icons.circle, size: 5, color: AppColors.mutedGold),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          rule,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textPrimary,
                                height: 1.5,
                              ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
