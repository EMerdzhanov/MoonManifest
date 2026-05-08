import 'package:flutter/material.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class ManifestationGuideScreen extends StatelessWidget {
  const ManifestationGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textSecondary),
        title: Text(
          'How to Manifest',
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

              _body(context,
                  'Four rules. That\'s all. Master these and the moon will do the rest.'),

              const SizedBox(height: 40),

              // ── RULE 1 ──
              _ruleNumber(context, '01'),
              const SizedBox(height: 8),
              _heading(context, 'Name the Need,\nNot the Want'),
              const SizedBox(height: 16),
              _body(context,
                  'The surface desire masks the real intention. You don\'t actually want a million dollars — you want the feeling of safety, of freedom, of not worrying. Manifestation works on the level of feeling, not material objects.'),
              const SizedBox(height: 12),
              _body(context,
                  'Ask yourself: why do I want this? The answer is your real intention.'),
              const SizedBox(height: 20),

              _exampleWrong(context, 'I want a million dollars'),
              _exampleRight(context, 'I am experiencing financial freedom'),
              const SizedBox(height: 8),
              _exampleWrong(context, 'I want a partner'),
              _exampleRight(context, 'I am surrounded by deep, loving connection'),
              const SizedBox(height: 8),
              _exampleWrong(context, 'I want a promotion'),
              _exampleRight(context, 'I am recognized and valued for my work'),

              const SizedBox(height: 48),

              // ── RULE 2 ──
              _ruleNumber(context, '02'),
              const SizedBox(height: 8),
              _heading(context, 'I AM — The Most Powerful\nWords You\'ll Ever Speak'),
              const SizedBox(height: 16),
              _body(context,
                  'In the Bible, when Moses asked God\'s name, the answer was "I AM THAT I AM." Every tradition that has touched manifestation — from Hermetic philosophy to Neville Goddard to modern practice — treats "I AM" as the declaration that shapes reality.'),
              const SizedBox(height: 12),
              _body(context,
                  'Whatever follows "I AM" becomes your command to the universe. Choose carefully.'),
              const SizedBox(height: 20),

              _ruleCard(context, [
                'Always positive — "I am healthy" not "I am not sick"',
                'Always present tense — "I am" not "I will be"',
                'Always with conviction — speak it as truth, not hope',
              ]),

              const SizedBox(height: 20),
              _exampleRight(context, 'I am abundant and money flows to me easily'),
              const SizedBox(height: 8),
              _exampleRight(context, 'I am at peace with who I am becoming'),
              const SizedBox(height: 8),
              _exampleRight(context, 'I am worthy of the life I am creating'),

              const SizedBox(height: 48),

              // ── RULE 3 ──
              _ruleNumber(context, '03'),
              const SizedBox(height: 8),
              _heading(context, 'Speak As If\nIt\'s Already Done'),
              const SizedBox(height: 16),
              _body(context,
                  'You don\'t need to know how it will happen. Your only job is to hold the vibration — the feeling — of already having what you declared.'),
              const SizedBox(height: 12),
              _body(context,
                  'The universe doesn\'t respond to what you want. It responds to what you are. Don\'t chase. Don\'t check for signs. Just be it.'),
              const SizedBox(height: 20),

              _exampleWrong(context, 'I hope I\'ll find peace someday'),
              _exampleRight(context, 'I am grateful for the peace that fills my life'),
              const SizedBox(height: 8),
              _exampleWrong(context, 'I\'m trying to be more confident'),
              _exampleRight(context, 'I am confident. I trust myself completely.'),

              const SizedBox(height: 48),

              // ── RULE 4 ──
              _ruleNumber(context, '04'),
              const SizedBox(height: 8),
              _heading(context, 'Gratitude Is the Proof'),
              const SizedBox(height: 16),
              _body(context,
                  'Gratitude is not a thank-you note after the fact. It\'s the signal you send before you receive — proof to the universe that you trust the process.'),
              const SizedBox(height: 12),
              _body(context,
                  'When you give thanks for something you haven\'t seen yet, you collapse the gap between wanting and having. This is the ceremony this app guides you through at every full moon.'),
              const SizedBox(height: 20),

              _exampleRight(context, 'I am so grateful that financial freedom is my reality'),
              const SizedBox(height: 8),
              _exampleRight(context, 'Thank you for the love that surrounds me every day'),
              const SizedBox(height: 8),
              _exampleRight(context, 'I give thanks for my health, my strength, my clarity'),

              const SizedBox(height: 48),

              // ── CLOSING ──
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
                    'This is your practice.\nThe moon provides the timing.\nYou provide the truth.',
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

  Widget _ruleNumber(BuildContext context, String number) {
    return Text(
      'RULE $number',
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
