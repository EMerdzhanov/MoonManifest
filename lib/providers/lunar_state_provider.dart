import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase_engine.dart';
import 'package:moon_manifest/data/models/lunar_state.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';

final moonPhaseEngineProvider = Provider<MoonPhaseEngine>((ref) {
  return MoonPhaseEngine();
});

final lunarStateProvider = AsyncNotifierProvider<LunarStateNotifier, LunarState>(LunarStateNotifier.new);

class LunarStateNotifier extends AsyncNotifier<LunarState> {
  Timer? _refreshTimer;

  @override
  Future<LunarState> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    _refreshTimer = Timer.periodic(const Duration(seconds: 60), (_) => _refresh());
    return _computeState();
  }

  Future<LunarState> _computeState() async {
    final engine = ref.read(moonPhaseEngineProvider);
    final cycle = await ref.read(activeCycleProvider.future);
    final now = engine.now;
    final phaseInfo = engine.currentPhase(now);

    return LunarState(
      phase: phaseInfo.phase,
      dayInPhase: phaseInfo.dayInPhase,
      totalDaysInPhase: phaseInfo.totalDaysInPhase,
      isGracePeriod: phaseInfo.isGracePeriod,
      graceDeadline: phaseInfo.graceDeadline,
      activeCycle: cycle,
      nextNewMoon: phaseInfo.nextNewMoon,
      nextFullMoon: phaseInfo.nextFullMoon,
      illumination: phaseInfo.illumination,
    );
  }

  Future<void> _refresh() async {
    state = AsyncData(await _computeState());
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _computeState());
  }
}
