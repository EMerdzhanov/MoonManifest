// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Welcome to\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'This app guides a manifestation practice tied to the moon.';

  @override
  String get onboardingCycleTitle => 'The Cycle';

  @override
  String get onboardingCycleBody =>
      'Each lunar month flows through four distinct phases, each with its own energy.';

  @override
  String get onboardingWhatYouDoTitle => 'What You\'ll Do';

  @override
  String get onboardingNewMoonDesc =>
      'Set intentions and plant seeds for new beginnings.';

  @override
  String get onboardingWaxingDesc =>
      'Take action and build momentum toward your goals.';

  @override
  String get onboardingFullMoonDesc =>
      'Celebrate wins and release what no longer serves you.';

  @override
  String get onboardingWaningDesc =>
      'Reflect, rest, and integrate lessons learned.';

  @override
  String get onboardingPreferencesTitle => 'Your Preferences';

  @override
  String get onboardingPreferencesSubtitle =>
      'Customize how and when you receive guidance.';

  @override
  String get onboardingNotificationFrequency => 'Notification Frequency';

  @override
  String get onboardingNotificationFrequencyHint =>
      'How many times per day do you want to be reminded?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / day';
  }

  @override
  String get onboardingWakeWindow => 'Wake Window';

  @override
  String get onboardingWakeWindowHint =>
      'No notifications outside these hours.';

  @override
  String get onboardingWakeUp => 'Wake Up';

  @override
  String get onboardingWindDown => 'Wind Down';

  @override
  String get onboardingButtonContinue => 'Continue';

  @override
  String get onboardingButtonBegin => 'Begin';

  @override
  String get waitingWindowNotOpen => 'The manifestation window is not yet open';

  @override
  String waitingFirstCycle(String date) {
    return 'Your first cycle begins at the new moon on $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'days away',
      one: 'day away',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Prepare while you wait';

  @override
  String get waitingLearnManifest => 'Learn how to manifest';

  @override
  String get waitingLearnManifestSubtitle =>
      'The 4 rules that make this practice work';

  @override
  String get waitingUnderstandCycle => 'Understand the lunar cycle';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'See where you are and what each phase means';

  @override
  String get waitingDraftIntentionsTitle => 'Draft your intentions';

  @override
  String get waitingDraftIntentionsBody =>
      'Use this space to reflect and prepare. What do you wish to call in?';

  @override
  String waitingIntentionHint(int number) {
    return 'Intention $number…';
  }

  @override
  String get waitingAddIntention => 'Add intention';

  @override
  String get waitingMaxIntentionsMessage =>
      'Seven intentions is a meaningful number. Take care to choose what matters most.';

  @override
  String get waitingDraftSaved => 'Draft saved';

  @override
  String get commonSomethingWentWrong => 'Something went wrong.';

  @override
  String get newMoonSetIntentions => 'New Moon.\nSet your intentions.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Grace period ends $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Ask yourself: What do I truly need beneath my desires? Set intentions that speak to your underlying needs — growth, connection, peace, abundance.';

  @override
  String get newMoonHowToWrite => 'How to write powerful intentions';

  @override
  String get newMoonYourIntentions => 'Your Intentions';

  @override
  String newMoonIntentionHint(int number) {
    return 'Intention $number…';
  }

  @override
  String get newMoonAddIntention => 'Add intention';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Seven intentions is a meaningful number. Take care to choose what matters most.';

  @override
  String get newMoonPlantIntentions => 'Plant these intentions';

  @override
  String get newMoonLockedTitle => 'These are your intentions for this cycle.';

  @override
  String get newMoonLockedSubtitleEditing => 'Edit your intentions below.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'They have been planted. Trust the process.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Intention $number...';
  }

  @override
  String get newMoonEditIntentions => 'Edit intentions';

  @override
  String get newMoonEditUntilWaxing =>
      'You can edit until the waxing phase begins.';

  @override
  String get newMoonSaveChanges => 'Save changes';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Day $day of waxing.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Full moon tomorrow.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Full moon in $count days.';
  }

  @override
  String get waxingYourIntentions => 'Your Intentions';

  @override
  String get waxingUnableToLoad => 'Unable to load intentions.';

  @override
  String get waxingNoIntentionsFound => 'No intentions found for this cycle.';

  @override
  String get fullMoonNoIntentionsSet => 'No intentions were set this cycle';

  @override
  String get fullMoonWorkDone => 'The work is done.';

  @override
  String get fullMoonNowRelease => 'Now release.';

  @override
  String fullMoonWaningNext(String date) {
    return 'The waning phase begins soon.\nYour next cycle starts at the new moon on $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Full Moon. Give thanks.';

  @override
  String get fullMoonGracePeriodActive => 'Grace period active';

  @override
  String get fullMoonThankUniverse =>
      'Thank the universe as if you already have what you asked for';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current of $total';
  }

  @override
  String get fullMoonGratitudeHint => 'I am so grateful that…';

  @override
  String get fullMoonCompleteCeremony => 'Complete ceremony';

  @override
  String get fullMoonNextIntention => 'Next intention';

  @override
  String get waningWindowClosed => 'Manifestation window closed';

  @override
  String waningOpensAgain(int count) {
    return 'Opens again in $count days at the new moon';
  }

  @override
  String get waningReleaseTrust => 'Release. Trust.';

  @override
  String get waningWorkDone => 'The work is done.';

  @override
  String get waningNextNewMoon => 'Next new moon';

  @override
  String get waningWhyQuiet => 'Why is it quiet?';

  @override
  String get philosophyTitle => 'Why Is the Window\nClosed Right Now?';

  @override
  String get philosophyBody1 =>
      'Manifestation doesn\'t work on your schedule — it works on the moon\'s. The lunar cycle has specific windows where setting intentions is powerful, and periods where the most powerful thing you can do is nothing.';

  @override
  String get philosophyBody2 =>
      'Right now, the moon is waning — shrinking toward darkness. This is the release phase. Your intentions from this cycle have been planted, tended, and offered in gratitude. Now they need space to take root. Pushing harder during this phase doesn\'t help. It interferes.';

  @override
  String get philosophyBody3 =>
      'When the new moon arrives, the window opens again. That\'s when you set fresh intentions and begin a new cycle. The wait isn\'t wasted time — it\'s part of the practice. The discipline of release is what separates manifestation from wishing.';

  @override
  String get philosophyDaysUntilOpen => 'days until the window opens';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Reminder set for $date';
  }

  @override
  String get philosophyRemindMe => 'Remind me when it opens';

  @override
  String get philosophyCouldNotSchedule => 'Could not schedule reminder';

  @override
  String get philosophyNotificationTitle => 'The manifestation window is open.';

  @override
  String get philosophyNotificationBody => 'Set your intentions now.';

  @override
  String get philosophyHookTitle => 'What They Know\nThat You Don\'t';

  @override
  String get philosophyHookBody1 =>
      'The most successful people on earth don\'t just set goals. They work with timing. They understand something most people never will: that the universe has a rhythm, and those who align with it don\'t chase results — results chase them.';

  @override
  String get philosophyHookBody2 =>
      'This is not a secret. It is ancient knowledge — practiced for thousands of years by those who shaped empires, built dynasties, and quietly moved the world. The moon was their clock. \"I AM\" was their language. And commitment was their price.';

  @override
  String get philosophyHookBody3 =>
      'Here is what they understood: manifestation is simple. Not easy — simple. You declare what you are becoming. You repeat it until your mind believes it. You give thanks before you see proof. And then you let go. Completely.';

  @override
  String get philosophyHookBody4 =>
      'Most people fail because they won\'t commit to the process. They want the result without the discipline. They manifest for a day, check for signs, and quit when nothing happens by Tuesday. That is not manifestation. That is wishing.';

  @override
  String get philosophyMoonHeading => 'The Moon Is the Missing Piece';

  @override
  String get philosophyMoonBody1 =>
      'You\'ve probably tried affirmations before. You\'ve probably said \"I am abundant\" in the mirror and felt nothing change. That\'s because you were speaking into dead air — no timing, no structure, no cosmic alignment behind your words.';

  @override
  String get philosophyMoonBody2 =>
      'The moon changes everything. It gives your practice a cycle — a beginning, a middle, a peak, and a release. When you set intentions at the new moon, you\'re not just writing wishes. You\'re planting seeds in the only soil that has been moving oceans since before humans existed.';

  @override
  String get philosophyMoonBody3 =>
      'The waning moon is not a pause. It is the most demanding phase of all. Anyone can ask. Anyone can repeat. But to release — to truly let go and trust that what you planted is growing in darkness — that requires the discipline this practice was built on.';

  @override
  String get philosophyFourPhasesHeading => 'The Four Sacred Phases';

  @override
  String get philosophyPhasePlanting => 'The Planting';

  @override
  String get philosophyPhasePlantingDesc =>
      'In darkness, you name what you need — not what you want, but what your soul requires. The new moon holds space for raw truth.';

  @override
  String get philosophyPhaseTending => 'The Tending';

  @override
  String get philosophyPhaseTendingDesc =>
      'As light returns, you repeat your intentions daily. Not as hope, but as certainty. You are not asking — you are remembering what is already on its way.';

  @override
  String get philosophyPhaseGratitude => 'The Gratitude';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'At full illumination, you give thanks as though you already hold what you asked for. This is not pretending. This is the act that collapses the distance between where you are and where you are going.';

  @override
  String get philosophyPhaseRelease => 'The Release';

  @override
  String get philosophyPhaseReleaseDesc =>
      'And then — silence. You let go. You stop pushing, stop checking, stop asking. The waning moon teaches the hardest lesson: that your work is done, and now it belongs to something larger than you.';

  @override
  String get philosophyClosing =>
      'When the moon returns to darkness,\nyou begin.';

  @override
  String get guideTitle => 'How to Manifest';

  @override
  String get guideIntro =>
      'Four rules. That\'s all. Master these and the moon will do the rest.';

  @override
  String get guideRule01 => 'RULE 01';

  @override
  String get guideRule01Title => 'Name the Need,\nNot the Want';

  @override
  String get guideRule01Body1 =>
      'The surface desire masks the real intention. You don\'t actually want a million dollars — you want the feeling of safety, of freedom, of not worrying. Manifestation works on the level of feeling, not material objects.';

  @override
  String get guideRule01Body2 =>
      'Ask yourself: why do I want this? The answer is your real intention.';

  @override
  String get guideRule01Wrong1 => 'I want a million dollars';

  @override
  String get guideRule01Right1 => 'I am experiencing financial freedom';

  @override
  String get guideRule01Wrong2 => 'I want a partner';

  @override
  String get guideRule01Right2 => 'I am surrounded by deep, loving connection';

  @override
  String get guideRule01Wrong3 => 'I want a promotion';

  @override
  String get guideRule01Right3 => 'I am recognized and valued for my work';

  @override
  String get guideRule02 => 'RULE 02';

  @override
  String get guideRule02Title =>
      'I AM — The Most Powerful\nWords You\'ll Ever Speak';

  @override
  String get guideRule02Body1 =>
      'In the Bible, when Moses asked God\'s name, the answer was \"I AM THAT I AM.\" Every tradition that has touched manifestation — from Hermetic philosophy to Neville Goddard to modern practice — treats \"I AM\" as the declaration that shapes reality.';

  @override
  String get guideRule02Body2 =>
      'Whatever follows \"I AM\" becomes your command to the universe. Choose carefully.';

  @override
  String get guideRule02Tip1 =>
      'Always positive — \"I am healthy\" not \"I am not sick\"';

  @override
  String get guideRule02Tip2 =>
      'Always present tense — \"I am\" not \"I will be\"';

  @override
  String get guideRule02Tip3 =>
      'Always with conviction — speak it as truth, not hope';

  @override
  String get guideRule02Right1 => 'I am abundant and money flows to me easily';

  @override
  String get guideRule02Right2 => 'I am at peace with who I am becoming';

  @override
  String get guideRule02Right3 => 'I am worthy of the life I am creating';

  @override
  String get guideRule03 => 'RULE 03';

  @override
  String get guideRule03Title => 'Speak As If\nIt\'s Already Done';

  @override
  String get guideRule03Body1 =>
      'You don\'t need to know how it will happen. Your only job is to hold the vibration — the feeling — of already having what you declared.';

  @override
  String get guideRule03Body2 =>
      'The universe doesn\'t respond to what you want. It responds to what you are. Don\'t chase. Don\'t check for signs. Just be it.';

  @override
  String get guideRule03Wrong1 => 'I hope I\'ll find peace someday';

  @override
  String get guideRule03Right1 =>
      'I am grateful for the peace that fills my life';

  @override
  String get guideRule03Wrong2 => 'I\'m trying to be more confident';

  @override
  String get guideRule03Right2 => 'I am confident. I trust myself completely.';

  @override
  String get guideRule04 => 'RULE 04';

  @override
  String get guideRule04Title => 'Gratitude Is the Proof';

  @override
  String get guideRule04Body1 =>
      'Gratitude is not a thank-you note after the fact. It\'s the signal you send before you receive — proof to the universe that you trust the process.';

  @override
  String get guideRule04Body2 =>
      'When you give thanks for something you haven\'t seen yet, you collapse the gap between wanting and having. This is the ceremony this app guides you through at every full moon.';

  @override
  String get guideRule04Right1 =>
      'I am so grateful that financial freedom is my reality';

  @override
  String get guideRule04Right2 =>
      'Thank you for the love that surrounds me every day';

  @override
  String get guideRule04Right3 =>
      'I give thanks for my health, my strength, my clarity';

  @override
  String get guideClosing =>
      'This is your practice.\nThe moon provides the timing.\nYou provide the truth.';

  @override
  String get lunarCycleTitle => 'The Lunar Cycle';

  @override
  String lunarYouAreHere(String phase) {
    return 'You are here: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'Day $day of $total';
  }

  @override
  String get lunarNewMoonPlant => 'New Moon — Plant';

  @override
  String get lunarNewMoonPlantDesc =>
      'Set your intentions. Name what you truly need. This is where the cycle begins.';

  @override
  String get lunarNewMoonDuration => '~1 day';

  @override
  String get lunarNewMoonStatus => 'Intentions open';

  @override
  String get lunarWaxingTend => 'Waxing — Tend';

  @override
  String get lunarWaxingTendDesc =>
      'Repeat your intentions daily. Build belief through repetition. The moon grows, and so does your conviction.';

  @override
  String get lunarWaxingDuration => '~14 days';

  @override
  String get lunarWaxingStatus => 'Daily reminders active';

  @override
  String get lunarFullMoonGiveThanks => 'Full Moon — Give Thanks';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Express gratitude as if you already have what you asked for. This is the peak — the moment of receiving.';

  @override
  String get lunarFullMoonDuration => '~1 day';

  @override
  String get lunarFullMoonStatus => 'Gratitude ceremony';

  @override
  String get lunarWaningRelease => 'Waning — Release';

  @override
  String get lunarWaningReleaseDesc =>
      'Let go completely. Stop pushing, stop checking. Trust that what you planted is growing in the dark.';

  @override
  String get lunarWaningDuration => '~14 days';

  @override
  String get lunarWaningStatus => 'Window closed — silence';

  @override
  String get lunarLegendManifest => 'Manifest';

  @override
  String get lunarLegendRelease => 'Release';

  @override
  String get lunarThisCycle => 'This Cycle';

  @override
  String get lunarNow => 'NOW';

  @override
  String get cycleDiagramNewMoon => 'New Moon';

  @override
  String get cycleDiagramWaxingCrescent => 'Waxing\nCrescent';

  @override
  String get cycleDiagramFirstQuarter => 'First\nQuarter';

  @override
  String get cycleDiagramWaxingGibbous => 'Waxing\nGibbous';

  @override
  String get cycleDiagramFullMoon => 'Full Moon';

  @override
  String get cycleDiagramWaningGibbous => 'Waning\nGibbous';

  @override
  String get cycleDiagramLastQuarter => 'Last\nQuarter';

  @override
  String get cycleDiagramWaningCrescent => 'Waning\nCrescent';

  @override
  String get cycleDiagramManifest => 'MANIFEST';

  @override
  String get cycleDiagramRelease => 'RELEASE';

  @override
  String get cycleThisCycle => 'This Cycle';

  @override
  String get cycleSeeFullDetails => 'See full cycle details';

  @override
  String debugLabel(String info) {
    return 'DEBUG: $info';
  }

  @override
  String get debugLive => 'live';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsReminderFrequency => 'Reminder frequency (times per day)';

  @override
  String get settingsWakeWindow => 'Wake window';

  @override
  String get settingsWakeWindowStart => 'Start';

  @override
  String get settingsWakeWindowEnd => 'End';

  @override
  String get settingsMoonStyle => 'Moon Style';

  @override
  String get settingsMoonStyleDescription =>
      'Choose how the moon looks throughout the app';

  @override
  String get settingsMoonStyleClassic => 'Classic';

  @override
  String get settingsMoonStyleStarfield => 'Starfield';

  @override
  String get settingsMoonStyleAura => 'Aura';

  @override
  String get settingsMoonStyleHalo => 'Halo';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsExportData => 'Export Data';

  @override
  String get settingsImportData => 'Import Data';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest is a personal ritual companion designed to help you align your intentions with the lunar cycle. Each new moon, you set up to three intentions and spend the following 28 days nurturing them through daily gratitude and reflection. Your data is stored securely on your device and never sent to any server. Use the export feature to create an encrypted backup, and import it on a new device to restore your practice.';

  @override
  String get settingsManifestationGuide => 'Manifestation Guide';

  @override
  String get settingsExportPasswordTitle => 'Set Export Password';

  @override
  String get settingsImportPasswordTitle => 'Enter Import Password';

  @override
  String get settingsPasswordHint => 'Password';

  @override
  String settingsExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Could not read file.';

  @override
  String get settingsDataImported => 'Data imported successfully.';

  @override
  String get settingsWrongPassword => 'Wrong password or corrupted file.';

  @override
  String settingsImportFailed(String error) {
    return 'Import failed: $error';
  }

  @override
  String get settingsExportSubject => 'Moon Manifest Backup';

  @override
  String get historyTitle => 'History';

  @override
  String get historyNoCompletedCycles => 'No completed cycles yet';

  @override
  String get historyOngoing => 'Ongoing';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count intentions',
      one: '1 intention',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'Intentions';

  @override
  String get historyGratitudesLabel => 'Gratitudes';

  @override
  String get phaseNewMoon => 'New Moon';

  @override
  String get phaseWaxing => 'Waxing';

  @override
  String get phaseFullMoon => 'Full Moon';

  @override
  String get phaseWaning => 'Waning';

  @override
  String get languageEn => 'English';

  @override
  String get languageBg => 'Български';

  @override
  String get languageEs => 'Español';

  @override
  String get languagePt => 'Português';

  @override
  String get languageDe => 'Deutsch';

  @override
  String get languageFr => 'Français';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageZh => '中文';

  @override
  String get languageJa => '日本語';

  @override
  String get languageHi => 'हिन्दी';

  @override
  String get languageTr => 'Türkçe';

  @override
  String get wisdom1 => 'What you seek is seeking you.';

  @override
  String get wisdom1Author => 'Rumi';

  @override
  String get wisdom2 =>
      'The universe is not outside of you. Look inside yourself; everything that you want, you already are.';

  @override
  String get wisdom2Author => 'Rumi';

  @override
  String get wisdom3 => 'Trust the wait. Embrace the uncertainty.';

  @override
  String get wisdom4 =>
      'You don\'t attract what you want. You attract what you are.';

  @override
  String get wisdom5 => 'When I let go of what I am, I become what I might be.';

  @override
  String get wisdom5Author => 'Lao Tzu';

  @override
  String get wisdom6 =>
      'Nature does not hurry, yet everything is accomplished.';

  @override
  String get wisdom6Author => 'Lao Tzu';

  @override
  String get wisdom7 =>
      'Assume the feeling of your wish fulfilled and observe the route that your attention follows.';

  @override
  String get wisdom7Author => 'Neville Goddard';

  @override
  String get wisdom8 =>
      'Man\'s chief delusion is his conviction that there are causes other than his own state of consciousness.';

  @override
  String get wisdom8Author => 'Neville Goddard';

  @override
  String get wisdom9 =>
      'You are always a student, never a master. You have to keep moving forward.';

  @override
  String get wisdom9Author => 'Conrad Hall';

  @override
  String get wisdom10 =>
      'Stop acting so small. You are the universe in ecstatic motion.';

  @override
  String get wisdom10Author => 'Rumi';

  @override
  String get wisdom11 =>
      'The present moment always will have been. Rest in that.';

  @override
  String get wisdom12 =>
      'Letting go gives us freedom, and freedom is the only condition for happiness.';

  @override
  String get wisdom12Author => 'Thich Nhat Hanh';

  @override
  String get wisdom13 =>
      'Surrender is not giving up. It is giving over to something greater.';

  @override
  String get wisdom14 =>
      'You have within you right now, everything you need to deal with whatever the world can throw at you.';

  @override
  String get wisdom14Author => 'Brian Tracy';

  @override
  String get wisdom15 =>
      'The quieter you become, the more you are able to hear.';

  @override
  String get wisdom15Author => 'Rumi';

  @override
  String get wisdom16 =>
      'Your task is not to seek for love, but merely to seek and find all the barriers within yourself that you have built against it.';

  @override
  String get wisdom16Author => 'Rumi';

  @override
  String get wisdom17 =>
      'Faith is taking the first step even when you don\'t see the whole staircase.';

  @override
  String get wisdom17Author => 'Martin Luther King Jr.';

  @override
  String get wisdom18 => 'The seed does not fight the soil. It simply grows.';

  @override
  String get wisdom19 =>
      'Release the need to know how. Trust that the universe knows the way.';

  @override
  String get wisdom20 =>
      'Begin to see yourself as a soul with a body rather than a body with a soul.';

  @override
  String get wisdom20Author => 'Wayne Dyer';

  @override
  String get wisdom21 =>
      'You cannot always control what goes on outside. But you can always control what goes on inside.';

  @override
  String get wisdom21Author => 'Wayne Dyer';

  @override
  String get wisdom22 => 'Patience is not passive waiting. It is active trust.';

  @override
  String get wisdom23 =>
      'Everything you need is already within you, waiting to unfold.';

  @override
  String get wisdom24 =>
      'The moon does not fight. It watches. And in watching, it holds everything together.';

  @override
  String get wisdom25 =>
      'Act as if what you intend to manifest in life is already a reality.';

  @override
  String get wisdom25Author => 'Wayne Dyer';

  @override
  String get wisdom26 => 'Be still and know.';

  @override
  String get wisdom27 => 'Let go of the branches and trust the river.';

  @override
  String get wisdom28 => 'The wound is the place where the light enters you.';

  @override
  String get wisdom28Author => 'Rumi';

  @override
  String get wisdom29 =>
      'A ship in a harbor is safe, but that is not what ships are built for.';

  @override
  String get wisdom29Author => 'John A. Shedd';

  @override
  String get wisdom30 =>
      'The universe is always speaking to us. Sending us little messages, causing coincidences and serendipities. The only question is: are we listening?';

  @override
  String get wisdom30Author => 'Nancy Thayer';
}
