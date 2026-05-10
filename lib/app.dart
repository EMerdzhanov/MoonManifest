import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/data/models/lunar_state.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/ui/onboarding/onboarding_screen.dart';
import 'package:moon_manifest/ui/waiting/waiting_screen.dart';
import 'package:moon_manifest/ui/phases/new_moon/new_moon_screen.dart';
import 'package:moon_manifest/ui/phases/waxing/waxing_screen.dart';
import 'package:moon_manifest/ui/phases/full_moon/full_moon_screen.dart';
import 'package:moon_manifest/ui/phases/waning/waning_screen.dart';
import 'package:moon_manifest/ui/history/history_screen.dart';
import 'package:moon_manifest/ui/settings/settings_screen.dart';
import 'package:moon_manifest/ui/phases/waning/manifestation_philosophy_screen.dart';


final routerProvider = Provider<GoRouter>((ref) {
  final settings = ref.watch(settingsProvider);
  final lunarState = ref.watch(lunarStateProvider);

  return GoRouter(
    initialLocation: '/loading',
    redirect: (context, state) {
      final path = state.matchedLocation;

      // Don't redirect away from push-routed screens
      if (path == '/history' || path == '/settings' || path == '/philosophy') return null;

      // Show onboarding if not complete
      if (!settings.onboardingComplete) {
        return path == '/onboarding' ? null : '/onboarding';
      }

      // Wait for lunar state to load
      final lunar = lunarState.valueOrNull;
      if (lunar == null) return '/loading';

      // Determine target route based on phase
      final targetRoute = _routeForState(lunar);

      // Only redirect if we're on a phase/loading route and it doesn't match
      if (path == '/loading' || _isPhaseRoute(path)) {
        return path == targetRoute ? null : targetRoute;
      }

      return null;
    },
    routes: [
      GoRoute(path: '/loading', builder: (context, state) => const Scaffold(
        backgroundColor: Color(0xFF0A0E1A),
        body: Center(child: CircularProgressIndicator(color: Color(0xFFD4A574))),
      )),
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: '/waiting', builder: (context, state) => const WaitingScreen()),
      GoRoute(path: '/new-moon', builder: (context, state) => const NewMoonScreen()),
      GoRoute(path: '/waxing', builder: (context, state) => const WaxingScreen()),
      GoRoute(path: '/full-moon', builder: (context, state) => const FullMoonScreen()),
      GoRoute(path: '/waning', builder: (context, state) => const WaningScreen()),
      GoRoute(path: '/history', builder: (context, state) => const HistoryScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      GoRoute(path: '/philosophy', builder: (context, state) => const ManifestationPhilosophyScreen()),
    ],
  );
});

String _routeForState(LunarState lunar) {
  if (lunar.shouldShowWaiting) return '/waiting';
  switch (lunar.phase) {
    case MoonPhase.newMoon: return '/new-moon';
    case MoonPhase.waxing: return '/waxing';
    case MoonPhase.fullMoon: return '/full-moon';
    case MoonPhase.waning: return '/waning';
  }
}

bool _isPhaseRoute(String path) {
  return const ['/waiting', '/new-moon', '/waxing', '/full-moon', '/waning', '/loading'].contains(path);
}
