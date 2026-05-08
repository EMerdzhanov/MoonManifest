import 'package:flutter/material.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String body;
  final Widget? illustration;

  const OnboardingPage({super.key, required this.title, required this.body, this.illustration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (illustration != null) ...[illustration!, const SizedBox(height: 48)],
          Text(title, style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Text(body, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
