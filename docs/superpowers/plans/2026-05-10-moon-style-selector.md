# Moon Style Selector Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let users choose between 4 moon rendering styles (Classic, Starfield, Aura, Halo) via a setting persisted in SharedPreferences, with the current static renderer as default.

**Architecture:** Add a `moonStyle` string field to the existing settings pipeline (model -> repository -> provider). Create 3 new animated painter files. Convert `MoonPhaseIndicator` from `StatelessWidget` to `ConsumerStatefulWidget` that reads the setting and delegates to the correct painter. Add a visual picker to Settings.

**Tech Stack:** Flutter, Riverpod, SharedPreferences, CustomPainter, AnimationController

---

## File Structure

| Action | File | Responsibility |
|--------|------|----------------|
| Modify | `lib/data/models/app_settings.dart` | Add `moonStyle` field |
| Modify | `lib/data/repositories/settings_repository.dart` | Persist `moonStyle` |
| Modify | `lib/providers/settings_provider.dart` | Add `setMoonStyle()` |
| Create | `lib/ui/shared/moon_painter_starfield.dart` | Breathing moon + stars painter |
| Create | `lib/ui/shared/moon_painter_aura.dart` | Particle aura painter |
| Create | `lib/ui/shared/moon_painter_halo.dart` | Layered halo painter |
| Modify | `lib/ui/shared/moon_phase_indicator.dart` | Read setting, delegate to painter |
| Modify | `lib/ui/settings/settings_screen.dart` | Add style picker UI, remove preview link |
| Modify | `lib/app.dart` | Remove `/moon-preview` route |
| Delete | `lib/ui/shared/moon_preview_screen.dart` | Temporary preview (no longer needed) |

---

### Task 1: Add `moonStyle` to the Settings Pipeline

**Files:**
- Modify: `lib/data/models/app_settings.dart`
- Modify: `lib/data/repositories/settings_repository.dart`
- Modify: `lib/providers/settings_provider.dart`

- [ ] **Step 1: Add `moonStyle` field to `AppSettings`**

In `lib/data/models/app_settings.dart`, add the field, constructor param, and copyWith param:

```dart
class AppSettings {
  final int notificationFrequency;
  final String wakeWindowStart;
  final String wakeWindowEnd;
  final bool onboardingComplete;
  final String themeMode;
  final String moonStyle;

  const AppSettings({
    this.notificationFrequency = 3,
    this.wakeWindowStart = '07:00',
    this.wakeWindowEnd = '22:00',
    this.onboardingComplete = false,
    this.themeMode = 'dark',
    this.moonStyle = 'classic',
  });

  AppSettings copyWith({
    int? notificationFrequency, String? wakeWindowStart,
    String? wakeWindowEnd, bool? onboardingComplete, String? themeMode,
    String? moonStyle,
  }) => AppSettings(
    notificationFrequency: notificationFrequency ?? this.notificationFrequency,
    wakeWindowStart: wakeWindowStart ?? this.wakeWindowStart,
    wakeWindowEnd: wakeWindowEnd ?? this.wakeWindowEnd,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    themeMode: themeMode ?? this.themeMode,
    moonStyle: moonStyle ?? this.moonStyle,
  );

  // ... wakeStart and wakeEnd getters unchanged
}
```

- [ ] **Step 2: Add persistence to `SettingsRepository`**

In `lib/data/repositories/settings_repository.dart`:

Add key constant after the existing keys:
```dart
static const _keyMoonStyle = 'moon_style';
```

Add to `load()` method:
```dart
moonStyle: _prefs.getString(_keyMoonStyle) ?? 'classic',
```

Add to `save()` method's `Future.wait` list:
```dart
_prefs.setString(_keyMoonStyle, settings.moonStyle),
```

Add setter method:
```dart
Future<void> setMoonStyle(String style) async => _prefs.setString(_keyMoonStyle, style);
```

- [ ] **Step 3: Add `setMoonStyle` to `SettingsNotifier`**

In `lib/providers/settings_provider.dart`, add method to `SettingsNotifier`:

```dart
Future<void> setMoonStyle(String style) async {
  await _repo.setMoonStyle(style);
  state = state.copyWith(moonStyle: style);
}
```

- [ ] **Step 4: Verify the app compiles**

Run: `flutter analyze`
Expected: No errors related to settings changes

- [ ] **Step 5: Commit**

```bash
git add lib/data/models/app_settings.dart lib/data/repositories/settings_repository.dart lib/providers/settings_provider.dart
git commit -m "feat: add moonStyle setting to settings pipeline"
```

---

### Task 2: Create Starfield Moon Painter

**Files:**
- Create: `lib/ui/shared/moon_painter_starfield.dart`

- [ ] **Step 1: Create the starfield painter file**

Create `lib/ui/shared/moon_painter_starfield.dart` with the full painter widget. This is a `StatefulWidget` (not a ConsumerWidget — it receives data via constructor). It manages 3 animation controllers:
- `_breathController` (4s, reverse-repeat) — moon scale pulse
- `_starController` (3s, reverse-repeat) — star twinkle
- `_glowController` (6s, reverse-repeat) — atmospheric glow

```dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class StarfieldMoon extends StatefulWidget {
  final double illumination;
  final bool isWaxing;
  final double size;

  const StarfieldMoon({
    super.key,
    required this.illumination,
    required this.isWaxing,
    this.size = 120,
  });

  @override
  State<StarfieldMoon> createState() => _StarfieldMoonState();
}

class _StarfieldMoonState extends State<StarfieldMoon>
    with TickerProviderStateMixin {
  late final AnimationController _breathController;
  late final AnimationController _starController;
  late final AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);
    _starController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breathController.dispose();
    _starController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: Listenable.merge([_breathController, _starController, _glowController]),
        builder: (context, _) => CustomPaint(
          painter: _StarfieldPainter(
            illumination: widget.illumination,
            isWaxing: widget.isWaxing,
            breathValue: CurvedAnimation(parent: _breathController, curve: Curves.easeInOut).value,
            starValue: _starController.value,
            glowValue: CurvedAnimation(parent: _glowController, curve: Curves.easeInOut).value,
          ),
        ),
      ),
    );
  }
}

class _StarfieldPainter extends CustomPainter {
  final double illumination;
  final bool isWaxing;
  final double breathValue;
  final double starValue;
  final double glowValue;

  _StarfieldPainter({
    required this.illumination,
    required this.isWaxing,
    required this.breathValue,
    required this.starValue,
    required this.glowValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final baseRadius = math.min(size.width, size.height) / 2;
    final breathScale = 1.0 + (breathValue * 0.03);
    final radius = (baseRadius - 8) * breathScale;

    // Stars
    final rng = math.Random(42);
    for (var i = 0; i < 20; i++) {
      final sx = rng.nextDouble() * size.width;
      final sy = rng.nextDouble() * size.height;
      if ((Offset(sx, sy) - center).distance < baseRadius * 0.7) continue;
      final phase = (starValue + i * 0.17) % 1.0;
      final twinkle = (math.sin(phase * math.pi * 2) + 1) / 2;
      canvas.drawCircle(
        Offset(sx, sy),
        0.5 + twinkle * 1.0,
        Paint()..color = Colors.white.withValues(alpha: 0.15 + twinkle * 0.6),
      );
    }

    // Glow layers
    canvas.drawCircle(
      center, radius * 1.6,
      Paint()
        ..color = const Color(0xFFA0A8D0).withValues(alpha: 0.04 + glowValue * 0.04)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30),
    );
    canvas.drawCircle(
      center, radius * 1.3,
      Paint()
        ..color = const Color(0xFFC0C4E0).withValues(alpha: 0.06 + glowValue * 0.06)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18),
    );
    canvas.drawCircle(
      center, radius * 1.08,
      Paint()
        ..color = AppColors.moonSilver.withValues(alpha: illumination * 0.12 + breathValue * 0.04)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    // Moon body
    _drawMoon(canvas, center, radius);

    // Craters
    if (illumination > 0.05) {
      final crng = math.Random(77);
      final craterPaint = Paint()..color = const Color(0xFFCDCDD8).withValues(alpha: 0.25);
      for (var i = 0; i < 6; i++) {
        final a = crng.nextDouble() * 2 * math.pi;
        final d = crng.nextDouble() * radius * 0.65;
        final cr = 1.5 + crng.nextDouble() * 3.5;
        canvas.drawCircle(
          Offset(center.dx + d * math.cos(a), center.dy + d * math.sin(a)),
          cr, craterPaint,
        );
      }
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = const Color(0xFF1E2540));
    canvas.drawCircle(center, radius, Paint()
      ..color = const Color(0xFF3A4260).withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8);

    if (illumination <= 0.01) return;

    final litPaint = Paint()
      ..shader = RadialGradient(
        colors: [AppColors.moonWhite, AppColors.moonSilver, const Color(0xFFD0D0DC)],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.15, Paint()
        ..color = AppColors.moonGlow.withValues(alpha: 0.25 + breathValue * 0.1)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
      return;
    }

    canvas.drawPath(_buildTerminatorPath(center, radius), litPaint);
  }

  Path _buildTerminatorPath(Offset center, double radius) {
    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;
    final path = Path();

    if (isWaxing) {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? math.pi : -math.pi, false,
      );
    } else {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, -math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? -math.pi : math.pi, false,
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(_StarfieldPainter old) => true;
}
```

- [ ] **Step 2: Verify it compiles**

Run: `flutter analyze lib/ui/shared/moon_painter_starfield.dart`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/ui/shared/moon_painter_starfield.dart
git commit -m "feat: add starfield moon painter"
```

---

### Task 3: Create Aura Moon Painter

**Files:**
- Create: `lib/ui/shared/moon_painter_aura.dart`

- [ ] **Step 1: Create the aura painter file**

Create `lib/ui/shared/moon_painter_aura.dart`. This widget manages 1 animation controller:
- `_controller` (8s, repeat) — drives particle orbits and shimmer

The painter renders 30 particles that orbit the moon, split into "behind" and "in front" layers for depth. Particle color adapts to moon phase (gold for manifest phases, blue for release).

```dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class AuraMoon extends StatefulWidget {
  final double illumination;
  final bool isWaxing;
  final MoonPhase phase;
  final double size;

  const AuraMoon({
    super.key,
    required this.illumination,
    required this.isWaxing,
    required this.phase,
    this.size = 120,
  });

  @override
  State<AuraMoon> createState() => _AuraMoonState();
}

class _AuraMoonState extends State<AuraMoon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 8000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => CustomPaint(
          painter: _AuraPainter(
            illumination: widget.illumination,
            phase: widget.phase,
            isWaxing: widget.isWaxing,
            time: _controller.value,
          ),
        ),
      ),
    );
  }
}

class _AuraPainter extends CustomPainter {
  final double illumination;
  final MoonPhase phase;
  final bool isWaxing;
  final double time;

  _AuraPainter({
    required this.illumination,
    required this.phase,
    required this.isWaxing,
    required this.time,
  });

  bool get _isManifest =>
      phase == MoonPhase.newMoon ||
      phase == MoonPhase.waxing ||
      phase == MoonPhase.fullMoon;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 12;
    final auraColor = _isManifest ? AppColors.mutedGold : const Color(0xFF9AA8D0);

    // Background glow
    canvas.drawCircle(center, radius * 1.8, Paint()
      ..color = auraColor.withValues(alpha: 0.06)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 25));

    _drawParticles(canvas, center, radius, auraColor, behind: true);
    _drawMoon(canvas, center, radius);

    // Shimmer
    if (illumination > 0.05) {
      final rng = math.Random(55);
      for (var i = 0; i < 4; i++) {
        final ba = rng.nextDouble() * 2 * math.pi;
        final bd = rng.nextDouble() * radius * 0.6;
        final sp = (time * 2 + i * 0.25) % 1.0;
        final sa = math.sin(sp * math.pi) * 0.15;
        if (sa < 0.02) continue;
        canvas.drawCircle(
          Offset(center.dx + bd * math.cos(ba + time * 0.5),
              center.dy + bd * math.sin(ba + time * 0.3)),
          2 + rng.nextDouble() * 3,
          Paint()
            ..color = Colors.white.withValues(alpha: sa)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
        );
      }
    }

    _drawParticles(canvas, center, radius, auraColor, behind: false);
  }

  void _drawParticles(Canvas canvas, Offset center, double radius,
      Color auraColor, {required bool behind}) {
    final rng = math.Random(123);
    for (var i = 0; i < 30; i++) {
      final pAngle = rng.nextDouble() * 2 * math.pi;
      final pSpeed = 0.3 + rng.nextDouble() * 0.7;
      final pBase = 1.1 + rng.nextDouble() * 0.5;
      final pDrift = rng.nextDouble() * 0.2;
      final pOffset = rng.nextDouble();
      final pSize = 0.8 + rng.nextDouble() * 1.8;

      final t = (time + pOffset) % 1.0;
      final curAngle = pAngle + pSpeed * time * 2 * math.pi;
      final dist = (pBase + pDrift * math.sin(t * math.pi * 2)) * radius;
      final normAngle = curAngle % (2 * math.pi);
      final isBehind = normAngle > math.pi / 2 && normAngle < 3 * math.pi / 2;
      if (isBehind != behind) continue;

      final lifecycle = math.sin(t * math.pi);
      final alpha = lifecycle * 0.7;
      if (alpha < 0.05) continue;

      final px = center.dx + dist * math.cos(curAngle);
      final py = center.dy + dist * math.sin(curAngle);

      canvas.drawCircle(Offset(px, py), pSize * 2.5, Paint()
        ..color = auraColor.withValues(alpha: alpha * 0.2)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4));
      canvas.drawCircle(Offset(px, py), pSize, Paint()
        ..color = auraColor.withValues(alpha: alpha));
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = const Color(0xFF1A2240));
    canvas.drawCircle(center, radius, Paint()
      ..color = const Color(0xFF3A4565)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6);

    if (illumination <= 0.01) return;

    final litPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.2, -0.2),
        colors: [AppColors.moonWhite, AppColors.moonSilver, const Color(0xFFD5D5E2)],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.12, Paint()
        ..color = AppColors.moonGlow.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16));
      return;
    }

    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;
    final path = Path();

    if (isWaxing) {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? math.pi : -math.pi, false,
      );
    } else {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, -math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? -math.pi : math.pi, false,
      );
    }
    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(_AuraPainter old) => true;
}
```

- [ ] **Step 2: Verify it compiles**

Run: `flutter analyze lib/ui/shared/moon_painter_aura.dart`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/ui/shared/moon_painter_aura.dart
git commit -m "feat: add aura moon painter"
```

---

### Task 4: Create Halo Moon Painter

**Files:**
- Create: `lib/ui/shared/moon_painter_halo.dart`

- [ ] **Step 1: Create the halo painter file**

Create `lib/ui/shared/moon_painter_halo.dart`. This widget manages 3 animation controllers:
- `_rotationController` (12s, repeat) — halo ring rotation
- `_glowController` (5s, reverse-repeat) — glow pulse
- `_sweepController` (7s, repeat) — surface light sweep

```dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class HaloMoon extends StatefulWidget {
  final double illumination;
  final bool isWaxing;
  final MoonPhase phase;
  final double size;

  const HaloMoon({
    super.key,
    required this.illumination,
    required this.isWaxing,
    required this.phase,
    this.size = 120,
  });

  @override
  State<HaloMoon> createState() => _HaloMoonState();
}

class _HaloMoonState extends State<HaloMoon>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _glowController;
  late final AnimationController _sweepController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 12000),
    )..repeat();
    _glowController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 5000),
    )..repeat(reverse: true);
    _sweepController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 7000),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _glowController.dispose();
    _sweepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: Listenable.merge([_rotationController, _glowController, _sweepController]),
        builder: (context, _) => CustomPaint(
          painter: _HaloPainter(
            illumination: widget.illumination,
            phase: widget.phase,
            isWaxing: widget.isWaxing,
            rotation: _rotationController.value * 2 * math.pi,
            glowValue: CurvedAnimation(parent: _glowController, curve: Curves.easeInOut).value,
            sweepValue: _sweepController.value,
          ),
        ),
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  final double illumination;
  final MoonPhase phase;
  final bool isWaxing;
  final double rotation;
  final double glowValue;
  final double sweepValue;

  _HaloPainter({
    required this.illumination,
    required this.phase,
    required this.isWaxing,
    required this.rotation,
    required this.glowValue,
    required this.sweepValue,
  });

  bool get _isManifest =>
      phase == MoonPhase.newMoon ||
      phase == MoonPhase.waxing ||
      phase == MoonPhase.fullMoon;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2;
    final scale = 1.0 + glowValue * 0.02;
    final r = (maxRadius - 16) * scale;
    final ringColor = _isManifest ? AppColors.mutedGold : const Color(0xFF8090C0);

    // Glow layers
    canvas.drawCircle(center, r * 1.7, Paint()
      ..color = ringColor.withValues(alpha: 0.03 + glowValue * 0.03)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 35));
    canvas.drawCircle(center, r * 1.35, Paint()
      ..color = const Color(0xFFD0D4E8).withValues(alpha: 0.05 + glowValue * 0.05)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
    canvas.drawCircle(center, r * 1.1, Paint()
      ..color = AppColors.moonSilver.withValues(alpha: 0.08 + glowValue * 0.06)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10));

    // Halo ring
    final ringRadius = r * 1.25;
    for (var i = 0; i < 40; i++) {
      final segAngle = rotation + (i / 40) * 2 * math.pi;
      final segPhase = (i / 40 + glowValue * 0.3) % 1.0;
      final alpha = 0.08 + math.sin(segPhase * math.pi) * 0.25;
      canvas.drawCircle(
        Offset(center.dx + ringRadius * math.cos(segAngle),
            center.dy + ringRadius * math.sin(segAngle)),
        1.2,
        Paint()
          ..color = ringColor.withValues(alpha: alpha)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5),
      );
    }

    // 4 accent dots
    for (var i = 0; i < 4; i++) {
      final aa = rotation + (i / 4) * 2 * math.pi;
      final accentAlpha = 0.3 + glowValue * 0.3;
      final ap = Offset(center.dx + ringRadius * math.cos(aa),
          center.dy + ringRadius * math.sin(aa));
      canvas.drawCircle(ap, 2.0, Paint()
        ..color = ringColor.withValues(alpha: accentAlpha)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3));
      canvas.drawCircle(ap, 1.0, Paint()
        ..color = ringColor.withValues(alpha: accentAlpha));
    }

    // Moon body
    _drawMoon(canvas, center, r);

    // Light sweep
    if (illumination > 0.05 && illumination < 0.99) {
      final sa = sweepValue * 2 * math.pi;
      canvas.save();
      canvas.clipPath(Path()..addOval(Rect.fromCircle(center: center, radius: r)));
      canvas.drawCircle(
        Offset(center.dx + r * 0.3 * math.cos(sa), center.dy + r * 0.3 * math.sin(sa)),
        r * 0.4,
        Paint()
          ..color = Colors.white.withValues(alpha: 0.06 + glowValue * 0.03)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15),
      );
      canvas.restore();
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = const Color(0xFF1C2340));
    canvas.drawCircle(center, radius, Paint()
      ..color = const Color(0xFF3A4565).withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7);

    if (illumination <= 0.01) return;

    final litPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        radius: 1.2,
        colors: [AppColors.moonWhite, AppColors.moonSilver, const Color(0xFFCCCCD8)],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.2, Paint()
        ..color = AppColors.moonGlow.withValues(alpha: 0.25 + glowValue * 0.1)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
      return;
    }

    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;
    final path = Path();

    if (isWaxing) {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? math.pi : -math.pi, false,
      );
    } else {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, -math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? -math.pi : math.pi, false,
      );
    }
    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(_HaloPainter old) => true;
}
```

- [ ] **Step 2: Verify it compiles**

Run: `flutter analyze lib/ui/shared/moon_painter_halo.dart`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/ui/shared/moon_painter_halo.dart
git commit -m "feat: add halo moon painter"
```

---

### Task 5: Update MoonPhaseIndicator to Delegate by Setting

**Files:**
- Modify: `lib/ui/shared/moon_phase_indicator.dart`

- [ ] **Step 1: Convert MoonPhaseIndicator to ConsumerWidget and delegate**

The widget reads `moonStyle` from the settings provider. For `classic`, it renders the existing `MoonPainter` via `CustomPaint` (no animation controllers needed). For the 3 animated styles, it renders the corresponding widget.

Replace the entire contents of `lib/ui/shared/moon_phase_indicator.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/ui/shared/moon_painter.dart';
import 'package:moon_manifest/ui/shared/moon_painter_starfield.dart';
import 'package:moon_manifest/ui/shared/moon_painter_aura.dart';
import 'package:moon_manifest/ui/shared/moon_painter_halo.dart';

class MoonPhaseIndicator extends ConsumerWidget {
  final double illumination;
  final MoonPhase phase;
  final double size;

  const MoonPhaseIndicator({
    super.key,
    required this.illumination,
    required this.phase,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moonStyle = ref.watch(
      settingsProvider.select((s) => s.moonStyle),
    );
    final isWaxing = phase == MoonPhase.waxing || phase == MoonPhase.newMoon;

    return switch (moonStyle) {
      'starfield' => StarfieldMoon(
          illumination: illumination, isWaxing: isWaxing, size: size),
      'aura' => AuraMoon(
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: size),
      'halo' => HaloMoon(
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: size),
      _ => SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: MoonPainter(illumination: illumination, isWaxing: isWaxing),
          ),
        ),
    };
  }
}
```

- [ ] **Step 2: Verify it compiles**

Run: `flutter analyze lib/ui/shared/moon_phase_indicator.dart`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/ui/shared/moon_phase_indicator.dart
git commit -m "feat: MoonPhaseIndicator delegates to painter based on moonStyle setting"
```

---

### Task 6: Add Moon Style Picker to Settings Screen

**Files:**
- Modify: `lib/ui/settings/settings_screen.dart`

- [ ] **Step 1: Replace the preview link with a moon style picker**

In `lib/ui/settings/settings_screen.dart`:

1. Remove the import for `moon_preview_screen.dart`.
2. Remove the "Moon Style Preview (temp)" `GestureDetector` block (the one with `Icons.auto_awesome`).
3. Add a new `_SectionCard` for "Moon Style" between the Notifications and Data sections. Insert it after the closing `),` of the Notifications `_SectionCard` and before `const SizedBox(height: 16),` that precedes the Data section.

The new section card:

```dart
const SizedBox(height: 16),

// Moon style section
_SectionCard(
  title: 'Moon Style',
  children: [
    const Text(
      'Choose how the moon looks throughout the app',
      style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
    ),
    const SizedBox(height: 16),
    _MoonStylePicker(),
  ],
),
```

4. Add the `_MoonStylePicker` widget class at the bottom of the file (before the closing of the file, after `_ActionButton`):

```dart
class _MoonStylePicker extends ConsumerWidget {
  const _MoonStylePicker();

  static const _styles = [
    ('classic', 'Classic'),
    ('starfield', 'Starfield'),
    ('aura', 'Aura'),
    ('halo', 'Halo'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(settingsProvider.select((s) => s.moonStyle));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _styles.map((entry) {
        final (value, label) = entry;
        final selected = current == value;
        return GestureDetector(
          onTap: () => ref.read(settingsProvider.notifier).setMoonStyle(value),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? AppColors.mutedGold.withValues(alpha: 0.15)
                      : AppColors.midNavy,
                  border: Border.all(
                    color: selected
                        ? AppColors.mutedGold
                        : AppColors.textMuted.withValues(alpha: 0.3),
                    width: selected ? 2 : 1,
                  ),
                ),
                child: Center(
                  child: Icon(
                    _iconFor(value),
                    color: selected ? AppColors.mutedGold : AppColors.textSecondary,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: selected ? AppColors.mutedGold : AppColors.textMuted,
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  static IconData _iconFor(String style) {
    return switch (style) {
      'starfield' => Icons.star_outline,
      'aura' => Icons.flare,
      'halo' => Icons.lens_blur,
      _ => Icons.circle_outlined,
    };
  }
}
```

- [ ] **Step 2: Verify it compiles**

Run: `flutter analyze lib/ui/settings/settings_screen.dart`
Expected: No errors

- [ ] **Step 3: Commit**

```bash
git add lib/ui/settings/settings_screen.dart
git commit -m "feat: add moon style picker to settings screen"
```

---

### Task 7: Remove Preview Screen and Route

**Files:**
- Modify: `lib/app.dart`
- Delete: `lib/ui/shared/moon_preview_screen.dart`

- [ ] **Step 1: Remove preview route from `app.dart`**

In `lib/app.dart`:

1. Remove the import line:
```dart
import 'package:moon_manifest/ui/shared/moon_preview_screen.dart';
```

2. In the redirect `if` statement, remove `|| path == '/moon-preview'` so it reads:
```dart
if (path == '/history' || path == '/settings' || path == '/philosophy') return null;
```

3. Remove the route line:
```dart
GoRoute(path: '/moon-preview', builder: (context, state) => const MoonPreviewScreen()),
```

- [ ] **Step 2: Delete the preview screen file**

```bash
rm lib/ui/shared/moon_preview_screen.dart
```

- [ ] **Step 3: Verify the app compiles**

Run: `flutter analyze`
Expected: No errors

- [ ] **Step 4: Commit**

```bash
git add lib/app.dart
git add lib/ui/shared/moon_preview_screen.dart
git commit -m "chore: remove temporary moon preview screen and route"
```

---

### Task 8: Clean Up Desktop Example Files

**Files:**
- Delete: `~/Desktop/moon_example_1_breathing_starfield.dart`
- Delete: `~/Desktop/moon_example_2_particle_aura.dart`
- Delete: `~/Desktop/moon_example_3_layered_halo.dart`

- [ ] **Step 1: Remove the 3 desktop example files**

```bash
rm ~/Desktop/moon_example_1_breathing_starfield.dart
rm ~/Desktop/moon_example_2_particle_aura.dart
rm ~/Desktop/moon_example_3_layered_halo.dart
```

These are not in the git repo so no commit needed.

---

### Task 9: Final Verification

- [ ] **Step 1: Run full analysis**

Run: `flutter analyze`
Expected: No errors

- [ ] **Step 2: Run the app and verify**

Run: `flutter run`

Verify:
1. App launches to the current phase screen — moon renders in Classic style (unchanged from before)
2. Go to Settings — "Moon Style" section is visible with 4 options, Classic is selected
3. Tap "Starfield" — go back, moon now shows breathing animation with twinkling stars
4. Go to Settings, tap "Aura" — go back, moon shows orbiting particles
5. Go to Settings, tap "Halo" — go back, moon shows rotating ring
6. Go to Settings, tap "Classic" — go back, moon is back to the original static style
7. Kill and relaunch the app — the last selected style persists

- [ ] **Step 3: Final commit (if any remaining changes)**

```bash
git status
# If clean, nothing to do. If anything remains:
git add -A && git commit -m "chore: final cleanup for moon style selector"
```
