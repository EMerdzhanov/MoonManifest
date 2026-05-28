# i18n Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add 11-language support to Moon Manifest using Flutter's built-in localization system with auto-detection and manual language override.

**Architecture:** Flutter `flutter_localizations` + ARB files with code generation. English ARB as template, 10 translation ARB files. Locale override stored in SharedPreferences via existing settings system. All ~150 hardcoded strings extracted to ARB keys.

**Tech Stack:** `flutter_localizations` SDK, `intl` (already installed), ARB files, code generation via `generate: true`

**Spec:** `docs/superpowers/specs/2026-05-28-i18n-design.md`

---

### Task 1: Infrastructure Setup

**Files:**
- Modify: `pubspec.yaml`
- Create: `l10n.yaml`

- [ ] **Step 1: Add flutter_localizations dependency to pubspec.yaml**

In `pubspec.yaml`, add `flutter_localizations` under `dependencies` and `generate: true` under `flutter:`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  # ... rest of dependencies unchanged
```

And under the `flutter:` section, add:

```yaml
flutter:
  generate: true
  uses-material-design: true
  # ... rest unchanged
```

- [ ] **Step 2: Create l10n.yaml**

Create `l10n.yaml` at the project root:

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

- [ ] **Step 3: Create lib/l10n directory**

```bash
mkdir -p lib/l10n
```

- [ ] **Step 4: Commit**

```bash
git add pubspec.yaml l10n.yaml lib/l10n
git commit -m "chore: add flutter_localizations and l10n config"
```

---

### Task 2: Create English ARB Template

**Files:**
- Create: `lib/l10n/app_en.arb`

This is the largest single file — all ~150 string keys with English values. Keys are grouped by screen prefix.

- [ ] **Step 1: Create app_en.arb with all strings**

Create `lib/l10n/app_en.arb` with the complete English string catalog. The file must be valid JSON. All keys use camelCase with screen prefix. Placeholders and plurals use ICU message syntax.

The ARB file must include these key groups (extract exact strings from each screen file):

**Common strings:**
- `appTitle`: "MoonManifest"
- `common_cancel`: "Cancel"
- `common_ok`: "OK"
- `common_somethingWentWrong`: "Something went wrong."
- Phase names: `phase_newMoon`: "New Moon", `phase_waxing`: "Waxing", `phase_fullMoon`: "Full Moon", `phase_waning`: "Waning"

**Onboarding strings** (from `onboarding_screen.dart`):
- `onboarding_welcomeTitle`: "Welcome to\nMoon Manifest"
- `onboarding_welcomeBody`: "This app guides a manifestation practice tied to the moon."
- `onboarding_cycleTitle`: "The Cycle"
- `onboarding_cycleBody`: "Each lunar month flows through four distinct phases, each with its own energy."
- `onboarding_whatYouDoTitle`: "What You'll Do"
- `onboarding_newMoonDesc`: "Set intentions and plant seeds for new beginnings."
- `onboarding_waxingDesc`: "Take action and build momentum toward your goals."
- `onboarding_fullMoonDesc`: "Celebrate wins and release what no longer serves you."
- `onboarding_waningDesc`: "Reflect, rest, and integrate lessons learned."
- `onboarding_preferencesTitle`: "Your Preferences"
- `onboarding_preferencesSubtitle`: "Customize how and when you receive guidance."
- `onboarding_notificationFrequency`: "Notification Frequency"
- `onboarding_notificationQuestion`: "How many times per day do you want to be reminded?"
- `onboarding_perDay`: "{count} / day" with placeholder
- `onboarding_wakeWindow`: "Wake Window"
- `onboarding_wakeWindowDesc`: "No notifications outside these hours."
- `onboarding_wakeUp`: "Wake Up"
- `onboarding_windDown`: "Wind Down"
- `onboarding_continue`: "Continue"
- `onboarding_begin`: "Begin"

**Waiting screen strings** (from `waiting_screen.dart`):
- `waiting_windowNotOpen`: "The manifestation window is not yet open"
- `waiting_firstCycle`: "Your first cycle begins at the new moon on {date}." with placeholder
- `waiting_daysAway`: "{count, plural, =1{day away} other{days away}}" with plural
- `waiting_prepareTitle`: "Prepare while you wait"
- `waiting_learnTitle`: "Learn how to manifest"
- `waiting_learnSubtitle`: "The 4 rules that make this practice work"
- `waiting_understandTitle`: "Understand the lunar cycle"
- `waiting_understandSubtitle`: "See where you are and what each phase means"
- `waiting_draftTitle`: "Draft your intentions"
- `waiting_draftSubtitle`: "Use this space to reflect and prepare. What do you wish to call in?"
- `waiting_intentionHint`: "Intention {number}..." with placeholder
- `waiting_addIntention`: "Add intention"
- `waiting_maxIntentions`: "Seven intentions is a meaningful number. Take care to choose what matters most."
- `waiting_draftSaved`: "Draft saved"

**New Moon screen strings** (from `new_moon_screen.dart`):
- `newMoon_heading`: "New Moon.\nSet your intentions."
- `newMoon_gracePeriod`: "Grace period ends {date}" with placeholder
- `newMoon_guidance`: "Ask yourself: What do I truly need beneath my desires? Set intentions that speak to your underlying needs \u2014 growth, connection, peace, abundance."
- `newMoon_howToWrite`: "How to write powerful intentions"
- `newMoon_yourIntentions`: "Your Intentions"
- `newMoon_intentionHint`: "Intention {number}..." with placeholder
- `newMoon_addIntention`: "Add intention"
- `newMoon_maxIntentions`: "Seven intentions is a meaningful number. Take care to choose what matters most."
- `newMoon_plantIntentions`: "Plant these intentions"
- `newMoon_lockedHeading`: "These are your intentions for this cycle."
- `newMoon_editMessage`: "Edit your intentions below."
- `newMoon_trustProcess`: "They have been planted. Trust the process."
- `newMoon_editButton`: "Edit intentions"
- `newMoon_editDeadline`: "You can edit until the waxing phase begins."
- `newMoon_saveChanges`: "Save changes"

**Waxing screen strings** (from `waxing_screen.dart`):
- Read the file and extract all user-facing strings including day counter, intention display, focus overlay text

**Full Moon screen strings** (from `full_moon_screen.dart`):
- Read the file and extract all strings including gratitude ceremony instructions, progress indicators, completion messages

**Waning screen strings** (from `waning_screen.dart`):
- Read the file and extract all strings including release messaging, countdown, daily wisdom label

**Philosophy screen strings** (from `manifestation_philosophy_screen.dart`):
- Read the file and extract all paragraph content, section titles, phase descriptions

**Guide screen strings** (from `manifestation_guide_screen.dart`):
- Read the file and extract all 4 rules, examples, opening/closing text

**Settings screen strings** (from `settings_screen.dart`):
- Read the file and extract all section headers, labels, dialog text, moon style names, about text

**History screen strings** (from `history_screen.dart`):
- Read the file and extract all headers, empty state, cycle card labels, plural forms

**Lunar Cycle screen strings** (from `lunar_cycle_screen.dart`):
- Read the file and extract all phase descriptions, status badges, legend labels

**Cycle Progress Bar strings** (from `cycle_progress_bar.dart`):
- Read the file and extract timeline labels, sheet title

**Debug Controls strings** (from `debug_controls.dart`):
- `debug_live`: "DEBUG: live"
- `debug_date`: "DEBUG: {date}" with placeholder

**Daily Wisdom quotes** (from `daily_wisdom.dart`):
- `wisdom_1` through `wisdom_30`: Each quote text
- `wisdom_1_author` through `wisdom_30_author`: Each author (or empty string for unattributed)

**Language names** (for settings picker):
- `language_en`: "English"
- `language_bg`: "Български"
- `language_es`: "Español"
- `language_pt`: "Português"
- `language_de`: "Deutsch"
- `language_fr`: "Français"
- `language_ru`: "Русский"
- `language_zh`: "中文"
- `language_ja`: "日本語"
- `language_hi`: "हिन्दी"
- `language_tr`: "Türkçe"

**Important:** When creating this file, you MUST read every screen file listed above to extract the exact strings. Do not guess or paraphrase — use the exact text from each widget's `Text()` calls.

- [ ] **Step 2: Run flutter gen-l10n to verify generation works**

```bash
flutter gen-l10n
```

Expected: No errors. Generated files appear in `.dart_tool/flutter_gen/gen_l10n/`.

- [ ] **Step 3: Commit**

```bash
git add lib/l10n/app_en.arb
git commit -m "feat: add English ARB template with all string keys"
```

---

### Task 3: Add Locale Setting to Settings System

**Files:**
- Modify: `lib/data/models/app_settings.dart`
- Modify: `lib/data/repositories/settings_repository.dart`
- Modify: `lib/providers/settings_provider.dart`

- [ ] **Step 1: Add locale field to AppSettings**

In `lib/data/models/app_settings.dart`, add a nullable `locale` field:

```dart
class AppSettings {
  final int notificationFrequency;
  final String wakeWindowStart;
  final String wakeWindowEnd;
  final bool onboardingComplete;
  final String themeMode;
  final String moonStyle;
  final String? locale; // null = follow device

  const AppSettings({
    this.notificationFrequency = 3,
    this.wakeWindowStart = '07:00',
    this.wakeWindowEnd = '22:00',
    this.onboardingComplete = false,
    this.themeMode = 'dark',
    this.moonStyle = 'classic',
    this.locale,
  });

  AppSettings copyWith({
    int? notificationFrequency, String? wakeWindowStart,
    String? wakeWindowEnd, bool? onboardingComplete, String? themeMode,
    String? moonStyle, String? Function()? locale,
  }) => AppSettings(
    notificationFrequency: notificationFrequency ?? this.notificationFrequency,
    wakeWindowStart: wakeWindowStart ?? this.wakeWindowStart,
    wakeWindowEnd: wakeWindowEnd ?? this.wakeWindowEnd,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    themeMode: themeMode ?? this.themeMode,
    moonStyle: moonStyle ?? this.moonStyle,
    locale: locale != null ? locale() : this.locale,
  );

  // ... existing wakeStart and wakeEnd getters unchanged
}
```

Note: `locale` uses `String? Function()?` in copyWith so it can be explicitly set to null (to reset to device language).

- [ ] **Step 2: Add locale persistence to SettingsRepository**

In `lib/data/repositories/settings_repository.dart`, add:

```dart
static const _keyLocale = 'locale';
```

In `load()`, add:
```dart
locale: _prefs.getString(_keyLocale),
```

Add method:
```dart
Future<void> setLocale(String? locale) async {
  if (locale == null) {
    await _prefs.remove(_keyLocale);
  } else {
    await _prefs.setString(_keyLocale, locale);
  }
}
```

- [ ] **Step 3: Add setLocale to SettingsNotifier**

In `lib/providers/settings_provider.dart`, add:

```dart
Future<void> setLocale(String? locale) async {
  await _repo.setLocale(locale);
  state = state.copyWith(locale: () => locale);
}
```

- [ ] **Step 4: Verify it compiles**

```bash
flutter analyze lib/data/models/app_settings.dart lib/data/repositories/settings_repository.dart lib/providers/settings_provider.dart
```

Expected: No issues found.

- [ ] **Step 5: Commit**

```bash
git add lib/data/models/app_settings.dart lib/data/repositories/settings_repository.dart lib/providers/settings_provider.dart
git commit -m "feat: add locale setting to settings system"
```

---

### Task 4: Wire Up Localizations in MaterialApp

**Files:**
- Modify: `lib/main.dart`

- [ ] **Step 1: Update MaterialApp.router with localization support**

Replace the `MoonManifestApp` class in `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moon_manifest/app.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/theme/app_theme.dart';
import 'package:moon_manifest/core/notifications/notification_service.dart';

// ... main() unchanged ...

class MoonManifestApp extends ConsumerWidget {
  const MoonManifestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final settings = ref.watch(settingsProvider);
    final localeOverride = settings.locale != null ? Locale(settings.locale!) : null;

    return MaterialApp.router(
      title: 'MoonManifest',
      theme: AppTheme.dark,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: localeOverride,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
```

- [ ] **Step 2: Verify it compiles**

```bash
flutter gen-l10n && flutter analyze lib/main.dart
```

Expected: No issues found.

- [ ] **Step 3: Commit**

```bash
git add lib/main.dart
git commit -m "feat: wire up localization delegates in MaterialApp"
```

---

### Task 5: Create All Translation ARB Files

**Files:**
- Create: `lib/l10n/app_bg.arb` (Bulgarian)
- Create: `lib/l10n/app_es.arb` (Spanish)
- Create: `lib/l10n/app_pt.arb` (Portuguese)
- Create: `lib/l10n/app_de.arb` (German)
- Create: `lib/l10n/app_fr.arb` (French)
- Create: `lib/l10n/app_ru.arb` (Russian)
- Create: `lib/l10n/app_zh.arb` (Chinese Simplified)
- Create: `lib/l10n/app_ja.arb` (Japanese)
- Create: `lib/l10n/app_hi.arb` (Hindi)
- Create: `lib/l10n/app_tr.arb` (Turkish)

- [ ] **Step 1: Create all 10 translation ARB files**

Each ARB file must contain the same keys as `app_en.arb` but with translated values. The `@@locale` field must be set correctly for each file.

Translation guidelines:
- **UI strings**: Direct translation, natural phrasing per language
- **Spiritual content**: Use culturally appropriate spiritual terminology (e.g., Japanese 引き寄せ for manifestation, Hindi प्रकटीकरण)
- **Wisdom quotes**: Use known published translations for famous authors (Rumi, Lao Tzu, Thich Nhat Hanh). Translate directly for others, preserving poetic tone.
- **Plurals**: Use correct plural forms per language (Russian has 3 forms: one/few/many/other; Chinese/Japanese have no plural distinction — use `other` only)
- **Placeholders**: Keep `{date}`, `{count}`, `{number}` placeholders exactly as-is

Create each file as a complete JSON file with `"@@locale": "<code>"` as the first entry.

- [ ] **Step 2: Verify generation works with all locales**

```bash
flutter gen-l10n
```

Expected: No errors. All locales generated.

- [ ] **Step 3: Verify the app builds**

```bash
flutter analyze
```

Expected: No issues related to localizations.

- [ ] **Step 4: Commit**

```bash
git add lib/l10n/
git commit -m "feat: add translations for bg, es, pt, de, fr, ru, zh, ja, hi, tr"
```

---

### Task 6: Replace Hardcoded Strings in Onboarding & Waiting Screens

**Files:**
- Modify: `lib/ui/onboarding/onboarding_screen.dart`
- Modify: `lib/ui/waiting/waiting_screen.dart`

- [ ] **Step 1: Replace strings in onboarding_screen.dart**

Add import at top:
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
```

In the build method, get the localizations instance:
```dart
final l10n = AppLocalizations.of(context)!;
```

Replace all hardcoded `Text('...')` strings with `Text(l10n.keyName)`. For example:
- `'Welcome to\nMoon Manifest'` → `l10n.onboarding_welcomeTitle`
- `'Continue'` → `l10n.onboarding_continue`
- `'Begin'` → `l10n.onboarding_begin`

Replace every `Text()` widget that contains a hardcoded string. Do not miss any.

- [ ] **Step 2: Replace strings in waiting_screen.dart**

Same pattern: add import, get `l10n`, replace all hardcoded strings. For strings with dynamic values:
- `'Your first cycle begins at the new moon on $formattedDate.'` → `l10n.waiting_firstCycle(formattedDate)`
- `daysUntil == 1 ? 'day away' : 'days away'` → `l10n.daysAway(daysUntil)`
- `'Intention ${index + 1}...'` → `l10n.waiting_intentionHint(index + 1)`

- [ ] **Step 3: Verify both files compile**

```bash
flutter analyze lib/ui/onboarding/onboarding_screen.dart lib/ui/waiting/waiting_screen.dart
```

Expected: No issues found.

- [ ] **Step 4: Commit**

```bash
git add lib/ui/onboarding/onboarding_screen.dart lib/ui/waiting/waiting_screen.dart
git commit -m "feat: localize onboarding and waiting screens"
```

---

### Task 7: Replace Hardcoded Strings in Phase Screens

**Files:**
- Modify: `lib/ui/phases/new_moon/new_moon_screen.dart`
- Modify: `lib/ui/phases/waxing/waxing_screen.dart`
- Modify: `lib/ui/phases/full_moon/full_moon_screen.dart`
- Modify: `lib/ui/phases/waning/waning_screen.dart`

- [ ] **Step 1: Localize new_moon_screen.dart**

Add import, get `l10n`, replace all hardcoded strings. This screen has ~16 strings including grace period badge, guidance text, intention labels, and both input/locked views.

- [ ] **Step 2: Localize waxing_screen.dart**

Read the file first to identify all strings. Replace all hardcoded text with l10n calls.

- [ ] **Step 3: Localize full_moon_screen.dart**

Read the file first. This has gratitude ceremony text, progress indicators, and completion messages. Replace all with l10n calls.

- [ ] **Step 4: Localize waning_screen.dart**

Read the file first. This has release messaging, countdown text, and daily wisdom display. Replace all with l10n calls.

- [ ] **Step 5: Verify all four files compile**

```bash
flutter analyze lib/ui/phases/
```

Expected: No issues found.

- [ ] **Step 6: Commit**

```bash
git add lib/ui/phases/
git commit -m "feat: localize all phase screens (new moon, waxing, full moon, waning)"
```

---

### Task 8: Replace Hardcoded Strings in Shared & Content Screens

**Files:**
- Modify: `lib/ui/shared/manifestation_guide_screen.dart`
- Modify: `lib/ui/shared/lunar_cycle_screen.dart`
- Modify: `lib/ui/shared/cycle_progress_bar.dart`
- Modify: `lib/ui/shared/debug_controls.dart`
- Modify: `lib/ui/phases/waning/manifestation_philosophy_screen.dart`

- [ ] **Step 1: Localize manifestation_guide_screen.dart**

Read the file first. This has extensive content — 4 rules with titles, descriptions, and example pairs. All must be extracted to l10n keys.

- [ ] **Step 2: Localize lunar_cycle_screen.dart**

Read the file first. Has phase descriptions, status badges, legend labels, and timeline section title.

- [ ] **Step 3: Localize cycle_progress_bar.dart**

Replace the phase display name and "This Cycle" sheet title with l10n calls.

- [ ] **Step 4: Localize debug_controls.dart**

Replace "DEBUG: live" and "DEBUG: {date}" with l10n calls.

- [ ] **Step 5: Localize manifestation_philosophy_screen.dart**

Read the file first. This has the most content — multiple paragraphs of philosophy text, section headings, phase metaphors. All must be extracted.

- [ ] **Step 6: Verify all files compile**

```bash
flutter analyze lib/ui/shared/ lib/ui/phases/waning/manifestation_philosophy_screen.dart
```

Expected: No issues found.

- [ ] **Step 7: Commit**

```bash
git add lib/ui/shared/ lib/ui/phases/waning/manifestation_philosophy_screen.dart
git commit -m "feat: localize shared screens and philosophy content"
```

---

### Task 9: Replace Hardcoded Strings in Settings & History

**Files:**
- Modify: `lib/ui/settings/settings_screen.dart`
- Modify: `lib/ui/history/history_screen.dart`

- [ ] **Step 1: Localize settings_screen.dart**

Read the file first. Has section headers, labels, moon style names, dialog text, about section. Replace all with l10n calls.

- [ ] **Step 2: Localize history_screen.dart**

Read the file first. Has title, empty state, cycle card labels, plural forms for intentions. Replace all with l10n calls.

- [ ] **Step 3: Verify both files compile**

```bash
flutter analyze lib/ui/settings/settings_screen.dart lib/ui/history/history_screen.dart
```

Expected: No issues found.

- [ ] **Step 4: Commit**

```bash
git add lib/ui/settings/settings_screen.dart lib/ui/history/history_screen.dart
git commit -m "feat: localize settings and history screens"
```

---

### Task 10: Localize Moon Phase Display Names & Daily Wisdom

**Files:**
- Modify: `lib/core/moon/moon_phase.dart`
- Modify: `lib/core/wisdom/daily_wisdom.dart`

- [ ] **Step 1: Localize MoonPhase displayName**

The `displayName` getter on the enum can't easily access `BuildContext` for l10n. Two options:

Option A: Add a `localizedName(BuildContext context)` method and update all call sites.
Option B: Keep `displayName` for non-UI use and add a helper function.

Use Option A. Add to `MoonPhase`:

```dart
String localizedName(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  switch (this) {
    case MoonPhase.newMoon: return l10n.phase_newMoon;
    case MoonPhase.waxing: return l10n.phase_waxing;
    case MoonPhase.fullMoon: return l10n.phase_fullMoon;
    case MoonPhase.waning: return l10n.phase_waning;
  }
}
```

Keep the existing `displayName` getter as a fallback for non-UI contexts. Update all UI call sites that use `phase.displayName` to use `phase.localizedName(context)` instead. Search the codebase for all `.displayName` usages.

- [ ] **Step 2: Localize daily_wisdom.dart**

Update the wisdom provider/function to accept a `BuildContext` or `AppLocalizations` instance and return the localized quote. Instead of hardcoded strings, reference `l10n.wisdom_1`, `l10n.wisdom_1_author`, etc.

Read the current file to understand the data structure, then modify it to pull strings from l10n.

- [ ] **Step 3: Verify compilation**

```bash
flutter analyze lib/core/moon/moon_phase.dart lib/core/wisdom/daily_wisdom.dart
```

Expected: No issues found.

- [ ] **Step 4: Commit**

```bash
git add lib/core/ lib/ui/
git commit -m "feat: localize moon phase names and daily wisdom quotes"
```

---

### Task 11: Add Language Picker to Settings Screen

**Files:**
- Modify: `lib/ui/settings/settings_screen.dart`

- [ ] **Step 1: Add language section to settings screen**

Read the current settings screen. Add a new "Language" section (after the existing sections, before "About"). It should show:

- Section header: `l10n.settings_language` ("Language")
- Current language displayed in its native name
- On tap, show a modal bottom sheet or dialog with all 11 languages listed in their native names
- Include a "Device default" option at the top that sets locale to null
- When selected, call `ref.read(settingsProvider.notifier).setLocale(code)` (or `null` for device default)

Language list (display in this order):
```
Device default
English
Български (Bulgarian)
Deutsch (German)
Español (Spanish)
Français (French)
Português (Portuguese)
Русский (Russian)
Türkçe (Turkish)
中文 (Chinese)
日本語 (Japanese)
हिन्दी (Hindi)
```

- [ ] **Step 2: Verify the settings screen compiles and language switching works**

```bash
flutter analyze lib/ui/settings/settings_screen.dart
```

Expected: No issues found.

- [ ] **Step 3: Commit**

```bash
git add lib/ui/settings/settings_screen.dart
git commit -m "feat: add language picker to settings screen"
```

---

### Task 12: Final Verification & Version Bump

**Files:**
- Modify: `pubspec.yaml` (version bump)

- [ ] **Step 1: Run full analysis**

```bash
flutter analyze
```

Expected: No issues found (warnings about deprecated APIs are acceptable).

- [ ] **Step 2: Build for simulator to verify**

```bash
flutter run -d chrome
```

Verify:
- App launches in English by default
- All screens display text (no missing translations showing as key names)
- Language picker in settings works
- Switching language updates all screens
- Switching back to "Device default" works

- [ ] **Step 3: Spot-check a non-Latin language**

Switch to Japanese, Chinese, or Hindi in settings. Verify:
- Text renders correctly (no tofu/boxes)
- Layout doesn't overflow (longer text in some languages)
- Spiritual content reads naturally

- [ ] **Step 4: Bump version**

In `pubspec.yaml`, bump version:
```yaml
version: 1.0.0+4
```

- [ ] **Step 5: Final commit**

```bash
git add -A
git commit -m "feat: complete i18n support for 11 languages

Adds multi-language support using Flutter's built-in localization system.
Supported: English, Bulgarian, Spanish, Portuguese, German, French,
Russian, Chinese, Japanese, Hindi, Turkish.

Includes auto-detection from device language with manual override
in Settings."
```
