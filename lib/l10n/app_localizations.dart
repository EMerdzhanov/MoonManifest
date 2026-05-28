import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bg.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bg'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to\nMoon Manifest'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'This app guides a manifestation practice tied to the moon.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingCycleTitle.
  ///
  /// In en, this message translates to:
  /// **'The Cycle'**
  String get onboardingCycleTitle;

  /// No description provided for @onboardingCycleBody.
  ///
  /// In en, this message translates to:
  /// **'Each lunar month flows through four distinct phases, each with its own energy.'**
  String get onboardingCycleBody;

  /// No description provided for @onboardingWhatYouDoTitle.
  ///
  /// In en, this message translates to:
  /// **'What You\'ll Do'**
  String get onboardingWhatYouDoTitle;

  /// No description provided for @onboardingNewMoonDesc.
  ///
  /// In en, this message translates to:
  /// **'Set intentions and plant seeds for new beginnings.'**
  String get onboardingNewMoonDesc;

  /// No description provided for @onboardingWaxingDesc.
  ///
  /// In en, this message translates to:
  /// **'Take action and build momentum toward your goals.'**
  String get onboardingWaxingDesc;

  /// No description provided for @onboardingFullMoonDesc.
  ///
  /// In en, this message translates to:
  /// **'Celebrate wins and release what no longer serves you.'**
  String get onboardingFullMoonDesc;

  /// No description provided for @onboardingWaningDesc.
  ///
  /// In en, this message translates to:
  /// **'Reflect, rest, and integrate lessons learned.'**
  String get onboardingWaningDesc;

  /// No description provided for @onboardingPreferencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Preferences'**
  String get onboardingPreferencesTitle;

  /// No description provided for @onboardingPreferencesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize how and when you receive guidance.'**
  String get onboardingPreferencesSubtitle;

  /// No description provided for @onboardingNotificationFrequency.
  ///
  /// In en, this message translates to:
  /// **'Notification Frequency'**
  String get onboardingNotificationFrequency;

  /// No description provided for @onboardingNotificationFrequencyHint.
  ///
  /// In en, this message translates to:
  /// **'How many times per day do you want to be reminded?'**
  String get onboardingNotificationFrequencyHint;

  /// No description provided for @onboardingFrequencyPerDay.
  ///
  /// In en, this message translates to:
  /// **'{count} / day'**
  String onboardingFrequencyPerDay(int count);

  /// No description provided for @onboardingWakeWindow.
  ///
  /// In en, this message translates to:
  /// **'Wake Window'**
  String get onboardingWakeWindow;

  /// No description provided for @onboardingWakeWindowHint.
  ///
  /// In en, this message translates to:
  /// **'No notifications outside these hours.'**
  String get onboardingWakeWindowHint;

  /// No description provided for @onboardingWakeUp.
  ///
  /// In en, this message translates to:
  /// **'Wake Up'**
  String get onboardingWakeUp;

  /// No description provided for @onboardingWindDown.
  ///
  /// In en, this message translates to:
  /// **'Wind Down'**
  String get onboardingWindDown;

  /// No description provided for @onboardingButtonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingButtonContinue;

  /// No description provided for @onboardingButtonBegin.
  ///
  /// In en, this message translates to:
  /// **'Begin'**
  String get onboardingButtonBegin;

  /// No description provided for @waitingWindowNotOpen.
  ///
  /// In en, this message translates to:
  /// **'The manifestation window is not yet open'**
  String get waitingWindowNotOpen;

  /// No description provided for @waitingFirstCycle.
  ///
  /// In en, this message translates to:
  /// **'Your first cycle begins at the new moon on {date}.'**
  String waitingFirstCycle(String date);

  /// No description provided for @waitingDaysAway.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{day away} other{days away}}'**
  String waitingDaysAway(int count);

  /// No description provided for @waitingPrepareTitle.
  ///
  /// In en, this message translates to:
  /// **'Prepare while you wait'**
  String get waitingPrepareTitle;

  /// No description provided for @waitingLearnManifest.
  ///
  /// In en, this message translates to:
  /// **'Learn how to manifest'**
  String get waitingLearnManifest;

  /// No description provided for @waitingLearnManifestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The 4 rules that make this practice work'**
  String get waitingLearnManifestSubtitle;

  /// No description provided for @waitingUnderstandCycle.
  ///
  /// In en, this message translates to:
  /// **'Understand the lunar cycle'**
  String get waitingUnderstandCycle;

  /// No description provided for @waitingUnderstandCycleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See where you are and what each phase means'**
  String get waitingUnderstandCycleSubtitle;

  /// No description provided for @waitingDraftIntentionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Draft your intentions'**
  String get waitingDraftIntentionsTitle;

  /// No description provided for @waitingDraftIntentionsBody.
  ///
  /// In en, this message translates to:
  /// **'Use this space to reflect and prepare. What do you wish to call in?'**
  String get waitingDraftIntentionsBody;

  /// No description provided for @waitingIntentionHint.
  ///
  /// In en, this message translates to:
  /// **'Intention {number}…'**
  String waitingIntentionHint(int number);

  /// No description provided for @waitingAddIntention.
  ///
  /// In en, this message translates to:
  /// **'Add intention'**
  String get waitingAddIntention;

  /// No description provided for @waitingMaxIntentionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Seven intentions is a meaningful number. Take care to choose what matters most.'**
  String get waitingMaxIntentionsMessage;

  /// No description provided for @waitingDraftSaved.
  ///
  /// In en, this message translates to:
  /// **'Draft saved'**
  String get waitingDraftSaved;

  /// No description provided for @commonSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get commonSomethingWentWrong;

  /// No description provided for @newMoonSetIntentions.
  ///
  /// In en, this message translates to:
  /// **'New Moon.\nSet your intentions.'**
  String get newMoonSetIntentions;

  /// No description provided for @newMoonGracePeriodEnds.
  ///
  /// In en, this message translates to:
  /// **'Grace period ends {deadline}'**
  String newMoonGracePeriodEnds(String deadline);

  /// No description provided for @newMoonGuidancePrompt.
  ///
  /// In en, this message translates to:
  /// **'Ask yourself: What do I truly need beneath my desires? Set intentions that speak to your underlying needs — growth, connection, peace, abundance.'**
  String get newMoonGuidancePrompt;

  /// No description provided for @newMoonHowToWrite.
  ///
  /// In en, this message translates to:
  /// **'How to write powerful intentions'**
  String get newMoonHowToWrite;

  /// No description provided for @newMoonYourIntentions.
  ///
  /// In en, this message translates to:
  /// **'Your Intentions'**
  String get newMoonYourIntentions;

  /// No description provided for @newMoonIntentionHint.
  ///
  /// In en, this message translates to:
  /// **'Intention {number}…'**
  String newMoonIntentionHint(int number);

  /// No description provided for @newMoonAddIntention.
  ///
  /// In en, this message translates to:
  /// **'Add intention'**
  String get newMoonAddIntention;

  /// No description provided for @newMoonMaxIntentionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Seven intentions is a meaningful number. Take care to choose what matters most.'**
  String get newMoonMaxIntentionsMessage;

  /// No description provided for @newMoonPlantIntentions.
  ///
  /// In en, this message translates to:
  /// **'Plant these intentions'**
  String get newMoonPlantIntentions;

  /// No description provided for @newMoonLockedTitle.
  ///
  /// In en, this message translates to:
  /// **'These are your intentions for this cycle.'**
  String get newMoonLockedTitle;

  /// No description provided for @newMoonLockedSubtitleEditing.
  ///
  /// In en, this message translates to:
  /// **'Edit your intentions below.'**
  String get newMoonLockedSubtitleEditing;

  /// No description provided for @newMoonLockedSubtitlePlanted.
  ///
  /// In en, this message translates to:
  /// **'They have been planted. Trust the process.'**
  String get newMoonLockedSubtitlePlanted;

  /// No description provided for @newMoonEditIntentionHint.
  ///
  /// In en, this message translates to:
  /// **'Intention {number}...'**
  String newMoonEditIntentionHint(int number);

  /// No description provided for @newMoonEditIntentions.
  ///
  /// In en, this message translates to:
  /// **'Edit intentions'**
  String get newMoonEditIntentions;

  /// No description provided for @newMoonEditUntilWaxing.
  ///
  /// In en, this message translates to:
  /// **'You can edit until the waxing phase begins.'**
  String get newMoonEditUntilWaxing;

  /// No description provided for @newMoonSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get newMoonSaveChanges;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @waxingDayOfWaxing.
  ///
  /// In en, this message translates to:
  /// **'Day {day} of waxing.'**
  String waxingDayOfWaxing(int day);

  /// No description provided for @waxingFullMoonTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Full moon tomorrow.'**
  String get waxingFullMoonTomorrow;

  /// No description provided for @waxingFullMoonInDays.
  ///
  /// In en, this message translates to:
  /// **'Full moon in {count} days.'**
  String waxingFullMoonInDays(int count);

  /// No description provided for @waxingYourIntentions.
  ///
  /// In en, this message translates to:
  /// **'Your Intentions'**
  String get waxingYourIntentions;

  /// No description provided for @waxingUnableToLoad.
  ///
  /// In en, this message translates to:
  /// **'Unable to load intentions.'**
  String get waxingUnableToLoad;

  /// No description provided for @waxingNoIntentionsFound.
  ///
  /// In en, this message translates to:
  /// **'No intentions found for this cycle.'**
  String get waxingNoIntentionsFound;

  /// No description provided for @fullMoonNoIntentionsSet.
  ///
  /// In en, this message translates to:
  /// **'No intentions were set this cycle'**
  String get fullMoonNoIntentionsSet;

  /// No description provided for @fullMoonWorkDone.
  ///
  /// In en, this message translates to:
  /// **'The work is done.'**
  String get fullMoonWorkDone;

  /// No description provided for @fullMoonNowRelease.
  ///
  /// In en, this message translates to:
  /// **'Now release.'**
  String get fullMoonNowRelease;

  /// No description provided for @fullMoonWaningNext.
  ///
  /// In en, this message translates to:
  /// **'The waning phase begins soon.\nYour next cycle starts at the new moon on {date}.'**
  String fullMoonWaningNext(String date);

  /// No description provided for @fullMoonGiveThanks.
  ///
  /// In en, this message translates to:
  /// **'Full Moon. Give thanks.'**
  String get fullMoonGiveThanks;

  /// No description provided for @fullMoonGracePeriodActive.
  ///
  /// In en, this message translates to:
  /// **'Grace period active'**
  String get fullMoonGracePeriodActive;

  /// No description provided for @fullMoonThankUniverse.
  ///
  /// In en, this message translates to:
  /// **'Thank the universe as if you already have what you asked for'**
  String get fullMoonThankUniverse;

  /// No description provided for @fullMoonProgressOf.
  ///
  /// In en, this message translates to:
  /// **'{current} of {total}'**
  String fullMoonProgressOf(int current, int total);

  /// No description provided for @fullMoonGratitudeHint.
  ///
  /// In en, this message translates to:
  /// **'I am so grateful that…'**
  String get fullMoonGratitudeHint;

  /// No description provided for @fullMoonCompleteCeremony.
  ///
  /// In en, this message translates to:
  /// **'Complete ceremony'**
  String get fullMoonCompleteCeremony;

  /// No description provided for @fullMoonNextIntention.
  ///
  /// In en, this message translates to:
  /// **'Next intention'**
  String get fullMoonNextIntention;

  /// No description provided for @waningWindowClosed.
  ///
  /// In en, this message translates to:
  /// **'Manifestation window closed'**
  String get waningWindowClosed;

  /// No description provided for @waningOpensAgain.
  ///
  /// In en, this message translates to:
  /// **'Opens again in {count} days at the new moon'**
  String waningOpensAgain(int count);

  /// No description provided for @waningReleaseTrust.
  ///
  /// In en, this message translates to:
  /// **'Release. Trust.'**
  String get waningReleaseTrust;

  /// No description provided for @waningWorkDone.
  ///
  /// In en, this message translates to:
  /// **'The work is done.'**
  String get waningWorkDone;

  /// No description provided for @waningNextNewMoon.
  ///
  /// In en, this message translates to:
  /// **'Next new moon'**
  String get waningNextNewMoon;

  /// No description provided for @waningWhyQuiet.
  ///
  /// In en, this message translates to:
  /// **'Why is it quiet?'**
  String get waningWhyQuiet;

  /// No description provided for @philosophyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Is the Window\nClosed Right Now?'**
  String get philosophyTitle;

  /// No description provided for @philosophyBody1.
  ///
  /// In en, this message translates to:
  /// **'Manifestation doesn\'t work on your schedule — it works on the moon\'s. The lunar cycle has specific windows where setting intentions is powerful, and periods where the most powerful thing you can do is nothing.'**
  String get philosophyBody1;

  /// No description provided for @philosophyBody2.
  ///
  /// In en, this message translates to:
  /// **'Right now, the moon is waning — shrinking toward darkness. This is the release phase. Your intentions from this cycle have been planted, tended, and offered in gratitude. Now they need space to take root. Pushing harder during this phase doesn\'t help. It interferes.'**
  String get philosophyBody2;

  /// No description provided for @philosophyBody3.
  ///
  /// In en, this message translates to:
  /// **'When the new moon arrives, the window opens again. That\'s when you set fresh intentions and begin a new cycle. The wait isn\'t wasted time — it\'s part of the practice. The discipline of release is what separates manifestation from wishing.'**
  String get philosophyBody3;

  /// No description provided for @philosophyDaysUntilOpen.
  ///
  /// In en, this message translates to:
  /// **'days until the window opens'**
  String get philosophyDaysUntilOpen;

  /// No description provided for @philosophyReminderSetFor.
  ///
  /// In en, this message translates to:
  /// **'Reminder set for {date}'**
  String philosophyReminderSetFor(String date);

  /// No description provided for @philosophyRemindMe.
  ///
  /// In en, this message translates to:
  /// **'Remind me when it opens'**
  String get philosophyRemindMe;

  /// No description provided for @philosophyCouldNotSchedule.
  ///
  /// In en, this message translates to:
  /// **'Could not schedule reminder'**
  String get philosophyCouldNotSchedule;

  /// No description provided for @philosophyNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'The manifestation window is open.'**
  String get philosophyNotificationTitle;

  /// No description provided for @philosophyNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Set your intentions now.'**
  String get philosophyNotificationBody;

  /// No description provided for @philosophyHookTitle.
  ///
  /// In en, this message translates to:
  /// **'What They Know\nThat You Don\'t'**
  String get philosophyHookTitle;

  /// No description provided for @philosophyHookBody1.
  ///
  /// In en, this message translates to:
  /// **'The most successful people on earth don\'t just set goals. They work with timing. They understand something most people never will: that the universe has a rhythm, and those who align with it don\'t chase results — results chase them.'**
  String get philosophyHookBody1;

  /// No description provided for @philosophyHookBody2.
  ///
  /// In en, this message translates to:
  /// **'This is not a secret. It is ancient knowledge — practiced for thousands of years by those who shaped empires, built dynasties, and quietly moved the world. The moon was their clock. \"I AM\" was their language. And commitment was their price.'**
  String get philosophyHookBody2;

  /// No description provided for @philosophyHookBody3.
  ///
  /// In en, this message translates to:
  /// **'Here is what they understood: manifestation is simple. Not easy — simple. You declare what you are becoming. You repeat it until your mind believes it. You give thanks before you see proof. And then you let go. Completely.'**
  String get philosophyHookBody3;

  /// No description provided for @philosophyHookBody4.
  ///
  /// In en, this message translates to:
  /// **'Most people fail because they won\'t commit to the process. They want the result without the discipline. They manifest for a day, check for signs, and quit when nothing happens by Tuesday. That is not manifestation. That is wishing.'**
  String get philosophyHookBody4;

  /// No description provided for @philosophyMoonHeading.
  ///
  /// In en, this message translates to:
  /// **'The Moon Is the Missing Piece'**
  String get philosophyMoonHeading;

  /// No description provided for @philosophyMoonBody1.
  ///
  /// In en, this message translates to:
  /// **'You\'ve probably tried affirmations before. You\'ve probably said \"I am abundant\" in the mirror and felt nothing change. That\'s because you were speaking into dead air — no timing, no structure, no cosmic alignment behind your words.'**
  String get philosophyMoonBody1;

  /// No description provided for @philosophyMoonBody2.
  ///
  /// In en, this message translates to:
  /// **'The moon changes everything. It gives your practice a cycle — a beginning, a middle, a peak, and a release. When you set intentions at the new moon, you\'re not just writing wishes. You\'re planting seeds in the only soil that has been moving oceans since before humans existed.'**
  String get philosophyMoonBody2;

  /// No description provided for @philosophyMoonBody3.
  ///
  /// In en, this message translates to:
  /// **'The waning moon is not a pause. It is the most demanding phase of all. Anyone can ask. Anyone can repeat. But to release — to truly let go and trust that what you planted is growing in darkness — that requires the discipline this practice was built on.'**
  String get philosophyMoonBody3;

  /// No description provided for @philosophyFourPhasesHeading.
  ///
  /// In en, this message translates to:
  /// **'The Four Sacred Phases'**
  String get philosophyFourPhasesHeading;

  /// No description provided for @philosophyPhasePlanting.
  ///
  /// In en, this message translates to:
  /// **'The Planting'**
  String get philosophyPhasePlanting;

  /// No description provided for @philosophyPhasePlantingDesc.
  ///
  /// In en, this message translates to:
  /// **'In darkness, you name what you need — not what you want, but what your soul requires. The new moon holds space for raw truth.'**
  String get philosophyPhasePlantingDesc;

  /// No description provided for @philosophyPhaseTending.
  ///
  /// In en, this message translates to:
  /// **'The Tending'**
  String get philosophyPhaseTending;

  /// No description provided for @philosophyPhaseTendingDesc.
  ///
  /// In en, this message translates to:
  /// **'As light returns, you repeat your intentions daily. Not as hope, but as certainty. You are not asking — you are remembering what is already on its way.'**
  String get philosophyPhaseTendingDesc;

  /// No description provided for @philosophyPhaseGratitude.
  ///
  /// In en, this message translates to:
  /// **'The Gratitude'**
  String get philosophyPhaseGratitude;

  /// No description provided for @philosophyPhaseGratitudeDesc.
  ///
  /// In en, this message translates to:
  /// **'At full illumination, you give thanks as though you already hold what you asked for. This is not pretending. This is the act that collapses the distance between where you are and where you are going.'**
  String get philosophyPhaseGratitudeDesc;

  /// No description provided for @philosophyPhaseRelease.
  ///
  /// In en, this message translates to:
  /// **'The Release'**
  String get philosophyPhaseRelease;

  /// No description provided for @philosophyPhaseReleaseDesc.
  ///
  /// In en, this message translates to:
  /// **'And then — silence. You let go. You stop pushing, stop checking, stop asking. The waning moon teaches the hardest lesson: that your work is done, and now it belongs to something larger than you.'**
  String get philosophyPhaseReleaseDesc;

  /// No description provided for @philosophyClosing.
  ///
  /// In en, this message translates to:
  /// **'When the moon returns to darkness,\nyou begin.'**
  String get philosophyClosing;

  /// No description provided for @guideTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Manifest'**
  String get guideTitle;

  /// No description provided for @guideIntro.
  ///
  /// In en, this message translates to:
  /// **'Four rules. That\'s all. Master these and the moon will do the rest.'**
  String get guideIntro;

  /// No description provided for @guideRule01.
  ///
  /// In en, this message translates to:
  /// **'RULE 01'**
  String get guideRule01;

  /// No description provided for @guideRule01Title.
  ///
  /// In en, this message translates to:
  /// **'Name the Need,\nNot the Want'**
  String get guideRule01Title;

  /// No description provided for @guideRule01Body1.
  ///
  /// In en, this message translates to:
  /// **'The surface desire masks the real intention. You don\'t actually want a million dollars — you want the feeling of safety, of freedom, of not worrying. Manifestation works on the level of feeling, not material objects.'**
  String get guideRule01Body1;

  /// No description provided for @guideRule01Body2.
  ///
  /// In en, this message translates to:
  /// **'Ask yourself: why do I want this? The answer is your real intention.'**
  String get guideRule01Body2;

  /// No description provided for @guideRule01Wrong1.
  ///
  /// In en, this message translates to:
  /// **'I want a million dollars'**
  String get guideRule01Wrong1;

  /// No description provided for @guideRule01Right1.
  ///
  /// In en, this message translates to:
  /// **'I am experiencing financial freedom'**
  String get guideRule01Right1;

  /// No description provided for @guideRule01Wrong2.
  ///
  /// In en, this message translates to:
  /// **'I want a partner'**
  String get guideRule01Wrong2;

  /// No description provided for @guideRule01Right2.
  ///
  /// In en, this message translates to:
  /// **'I am surrounded by deep, loving connection'**
  String get guideRule01Right2;

  /// No description provided for @guideRule01Wrong3.
  ///
  /// In en, this message translates to:
  /// **'I want a promotion'**
  String get guideRule01Wrong3;

  /// No description provided for @guideRule01Right3.
  ///
  /// In en, this message translates to:
  /// **'I am recognized and valued for my work'**
  String get guideRule01Right3;

  /// No description provided for @guideRule02.
  ///
  /// In en, this message translates to:
  /// **'RULE 02'**
  String get guideRule02;

  /// No description provided for @guideRule02Title.
  ///
  /// In en, this message translates to:
  /// **'I AM — The Most Powerful\nWords You\'ll Ever Speak'**
  String get guideRule02Title;

  /// No description provided for @guideRule02Body1.
  ///
  /// In en, this message translates to:
  /// **'In the Bible, when Moses asked God\'s name, the answer was \"I AM THAT I AM.\" Every tradition that has touched manifestation — from Hermetic philosophy to Neville Goddard to modern practice — treats \"I AM\" as the declaration that shapes reality.'**
  String get guideRule02Body1;

  /// No description provided for @guideRule02Body2.
  ///
  /// In en, this message translates to:
  /// **'Whatever follows \"I AM\" becomes your command to the universe. Choose carefully.'**
  String get guideRule02Body2;

  /// No description provided for @guideRule02Tip1.
  ///
  /// In en, this message translates to:
  /// **'Always positive — \"I am healthy\" not \"I am not sick\"'**
  String get guideRule02Tip1;

  /// No description provided for @guideRule02Tip2.
  ///
  /// In en, this message translates to:
  /// **'Always present tense — \"I am\" not \"I will be\"'**
  String get guideRule02Tip2;

  /// No description provided for @guideRule02Tip3.
  ///
  /// In en, this message translates to:
  /// **'Always with conviction — speak it as truth, not hope'**
  String get guideRule02Tip3;

  /// No description provided for @guideRule02Right1.
  ///
  /// In en, this message translates to:
  /// **'I am abundant and money flows to me easily'**
  String get guideRule02Right1;

  /// No description provided for @guideRule02Right2.
  ///
  /// In en, this message translates to:
  /// **'I am at peace with who I am becoming'**
  String get guideRule02Right2;

  /// No description provided for @guideRule02Right3.
  ///
  /// In en, this message translates to:
  /// **'I am worthy of the life I am creating'**
  String get guideRule02Right3;

  /// No description provided for @guideRule03.
  ///
  /// In en, this message translates to:
  /// **'RULE 03'**
  String get guideRule03;

  /// No description provided for @guideRule03Title.
  ///
  /// In en, this message translates to:
  /// **'Speak As If\nIt\'s Already Done'**
  String get guideRule03Title;

  /// No description provided for @guideRule03Body1.
  ///
  /// In en, this message translates to:
  /// **'You don\'t need to know how it will happen. Your only job is to hold the vibration — the feeling — of already having what you declared.'**
  String get guideRule03Body1;

  /// No description provided for @guideRule03Body2.
  ///
  /// In en, this message translates to:
  /// **'The universe doesn\'t respond to what you want. It responds to what you are. Don\'t chase. Don\'t check for signs. Just be it.'**
  String get guideRule03Body2;

  /// No description provided for @guideRule03Wrong1.
  ///
  /// In en, this message translates to:
  /// **'I hope I\'ll find peace someday'**
  String get guideRule03Wrong1;

  /// No description provided for @guideRule03Right1.
  ///
  /// In en, this message translates to:
  /// **'I am grateful for the peace that fills my life'**
  String get guideRule03Right1;

  /// No description provided for @guideRule03Wrong2.
  ///
  /// In en, this message translates to:
  /// **'I\'m trying to be more confident'**
  String get guideRule03Wrong2;

  /// No description provided for @guideRule03Right2.
  ///
  /// In en, this message translates to:
  /// **'I am confident. I trust myself completely.'**
  String get guideRule03Right2;

  /// No description provided for @guideRule04.
  ///
  /// In en, this message translates to:
  /// **'RULE 04'**
  String get guideRule04;

  /// No description provided for @guideRule04Title.
  ///
  /// In en, this message translates to:
  /// **'Gratitude Is the Proof'**
  String get guideRule04Title;

  /// No description provided for @guideRule04Body1.
  ///
  /// In en, this message translates to:
  /// **'Gratitude is not a thank-you note after the fact. It\'s the signal you send before you receive — proof to the universe that you trust the process.'**
  String get guideRule04Body1;

  /// No description provided for @guideRule04Body2.
  ///
  /// In en, this message translates to:
  /// **'When you give thanks for something you haven\'t seen yet, you collapse the gap between wanting and having. This is the ceremony this app guides you through at every full moon.'**
  String get guideRule04Body2;

  /// No description provided for @guideRule04Right1.
  ///
  /// In en, this message translates to:
  /// **'I am so grateful that financial freedom is my reality'**
  String get guideRule04Right1;

  /// No description provided for @guideRule04Right2.
  ///
  /// In en, this message translates to:
  /// **'Thank you for the love that surrounds me every day'**
  String get guideRule04Right2;

  /// No description provided for @guideRule04Right3.
  ///
  /// In en, this message translates to:
  /// **'I give thanks for my health, my strength, my clarity'**
  String get guideRule04Right3;

  /// No description provided for @guideClosing.
  ///
  /// In en, this message translates to:
  /// **'This is your practice.\nThe moon provides the timing.\nYou provide the truth.'**
  String get guideClosing;

  /// No description provided for @lunarCycleTitle.
  ///
  /// In en, this message translates to:
  /// **'The Lunar Cycle'**
  String get lunarCycleTitle;

  /// No description provided for @lunarYouAreHere.
  ///
  /// In en, this message translates to:
  /// **'You are here: {phase}'**
  String lunarYouAreHere(String phase);

  /// No description provided for @lunarDayOfTotal.
  ///
  /// In en, this message translates to:
  /// **'Day {day} of {total}'**
  String lunarDayOfTotal(int day, int total);

  /// No description provided for @lunarNewMoonPlant.
  ///
  /// In en, this message translates to:
  /// **'New Moon — Plant'**
  String get lunarNewMoonPlant;

  /// No description provided for @lunarNewMoonPlantDesc.
  ///
  /// In en, this message translates to:
  /// **'Set your intentions. Name what you truly need. This is where the cycle begins.'**
  String get lunarNewMoonPlantDesc;

  /// No description provided for @lunarNewMoonDuration.
  ///
  /// In en, this message translates to:
  /// **'~1 day'**
  String get lunarNewMoonDuration;

  /// No description provided for @lunarNewMoonStatus.
  ///
  /// In en, this message translates to:
  /// **'Intentions open'**
  String get lunarNewMoonStatus;

  /// No description provided for @lunarWaxingTend.
  ///
  /// In en, this message translates to:
  /// **'Waxing — Tend'**
  String get lunarWaxingTend;

  /// No description provided for @lunarWaxingTendDesc.
  ///
  /// In en, this message translates to:
  /// **'Repeat your intentions daily. Build belief through repetition. The moon grows, and so does your conviction.'**
  String get lunarWaxingTendDesc;

  /// No description provided for @lunarWaxingDuration.
  ///
  /// In en, this message translates to:
  /// **'~14 days'**
  String get lunarWaxingDuration;

  /// No description provided for @lunarWaxingStatus.
  ///
  /// In en, this message translates to:
  /// **'Daily reminders active'**
  String get lunarWaxingStatus;

  /// No description provided for @lunarFullMoonGiveThanks.
  ///
  /// In en, this message translates to:
  /// **'Full Moon — Give Thanks'**
  String get lunarFullMoonGiveThanks;

  /// No description provided for @lunarFullMoonGiveThanksDesc.
  ///
  /// In en, this message translates to:
  /// **'Express gratitude as if you already have what you asked for. This is the peak — the moment of receiving.'**
  String get lunarFullMoonGiveThanksDesc;

  /// No description provided for @lunarFullMoonDuration.
  ///
  /// In en, this message translates to:
  /// **'~1 day'**
  String get lunarFullMoonDuration;

  /// No description provided for @lunarFullMoonStatus.
  ///
  /// In en, this message translates to:
  /// **'Gratitude ceremony'**
  String get lunarFullMoonStatus;

  /// No description provided for @lunarWaningRelease.
  ///
  /// In en, this message translates to:
  /// **'Waning — Release'**
  String get lunarWaningRelease;

  /// No description provided for @lunarWaningReleaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Let go completely. Stop pushing, stop checking. Trust that what you planted is growing in the dark.'**
  String get lunarWaningReleaseDesc;

  /// No description provided for @lunarWaningDuration.
  ///
  /// In en, this message translates to:
  /// **'~14 days'**
  String get lunarWaningDuration;

  /// No description provided for @lunarWaningStatus.
  ///
  /// In en, this message translates to:
  /// **'Window closed — silence'**
  String get lunarWaningStatus;

  /// No description provided for @lunarLegendManifest.
  ///
  /// In en, this message translates to:
  /// **'Manifest'**
  String get lunarLegendManifest;

  /// No description provided for @lunarLegendRelease.
  ///
  /// In en, this message translates to:
  /// **'Release'**
  String get lunarLegendRelease;

  /// No description provided for @lunarThisCycle.
  ///
  /// In en, this message translates to:
  /// **'This Cycle'**
  String get lunarThisCycle;

  /// No description provided for @lunarNow.
  ///
  /// In en, this message translates to:
  /// **'NOW'**
  String get lunarNow;

  /// No description provided for @cycleDiagramNewMoon.
  ///
  /// In en, this message translates to:
  /// **'New Moon'**
  String get cycleDiagramNewMoon;

  /// No description provided for @cycleDiagramWaxingCrescent.
  ///
  /// In en, this message translates to:
  /// **'Waxing\nCrescent'**
  String get cycleDiagramWaxingCrescent;

  /// No description provided for @cycleDiagramFirstQuarter.
  ///
  /// In en, this message translates to:
  /// **'First\nQuarter'**
  String get cycleDiagramFirstQuarter;

  /// No description provided for @cycleDiagramWaxingGibbous.
  ///
  /// In en, this message translates to:
  /// **'Waxing\nGibbous'**
  String get cycleDiagramWaxingGibbous;

  /// No description provided for @cycleDiagramFullMoon.
  ///
  /// In en, this message translates to:
  /// **'Full Moon'**
  String get cycleDiagramFullMoon;

  /// No description provided for @cycleDiagramWaningGibbous.
  ///
  /// In en, this message translates to:
  /// **'Waning\nGibbous'**
  String get cycleDiagramWaningGibbous;

  /// No description provided for @cycleDiagramLastQuarter.
  ///
  /// In en, this message translates to:
  /// **'Last\nQuarter'**
  String get cycleDiagramLastQuarter;

  /// No description provided for @cycleDiagramWaningCrescent.
  ///
  /// In en, this message translates to:
  /// **'Waning\nCrescent'**
  String get cycleDiagramWaningCrescent;

  /// No description provided for @cycleDiagramManifest.
  ///
  /// In en, this message translates to:
  /// **'MANIFEST'**
  String get cycleDiagramManifest;

  /// No description provided for @cycleDiagramRelease.
  ///
  /// In en, this message translates to:
  /// **'RELEASE'**
  String get cycleDiagramRelease;

  /// No description provided for @cycleThisCycle.
  ///
  /// In en, this message translates to:
  /// **'This Cycle'**
  String get cycleThisCycle;

  /// No description provided for @cycleSeeFullDetails.
  ///
  /// In en, this message translates to:
  /// **'See full cycle details'**
  String get cycleSeeFullDetails;

  /// No description provided for @debugLabel.
  ///
  /// In en, this message translates to:
  /// **'DEBUG: {info}'**
  String debugLabel(String info);

  /// No description provided for @debugLive.
  ///
  /// In en, this message translates to:
  /// **'live'**
  String get debugLive;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsReminderFrequency.
  ///
  /// In en, this message translates to:
  /// **'Reminder frequency (times per day)'**
  String get settingsReminderFrequency;

  /// No description provided for @settingsWakeWindow.
  ///
  /// In en, this message translates to:
  /// **'Wake window'**
  String get settingsWakeWindow;

  /// No description provided for @settingsWakeWindowStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get settingsWakeWindowStart;

  /// No description provided for @settingsWakeWindowEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get settingsWakeWindowEnd;

  /// No description provided for @settingsMoonStyle.
  ///
  /// In en, this message translates to:
  /// **'Moon Style'**
  String get settingsMoonStyle;

  /// No description provided for @settingsMoonStyleDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose how the moon looks throughout the app'**
  String get settingsMoonStyleDescription;

  /// No description provided for @settingsMoonStyleClassic.
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get settingsMoonStyleClassic;

  /// No description provided for @settingsMoonStyleStarfield.
  ///
  /// In en, this message translates to:
  /// **'Starfield'**
  String get settingsMoonStyleStarfield;

  /// No description provided for @settingsMoonStyleAura.
  ///
  /// In en, this message translates to:
  /// **'Aura'**
  String get settingsMoonStyleAura;

  /// No description provided for @settingsMoonStyleHalo.
  ///
  /// In en, this message translates to:
  /// **'Halo'**
  String get settingsMoonStyleHalo;

  /// No description provided for @settingsData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get settingsData;

  /// No description provided for @settingsExportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get settingsExportData;

  /// No description provided for @settingsImportData.
  ///
  /// In en, this message translates to:
  /// **'Import Data'**
  String get settingsImportData;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsAboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Moon Manifest is a personal ritual companion designed to help you align your intentions with the lunar cycle. Each new moon, you set up to three intentions and spend the following 28 days nurturing them through daily gratitude and reflection. Your data is stored securely on your device and never sent to any server. Use the export feature to create an encrypted backup, and import it on a new device to restore your practice.'**
  String get settingsAboutDescription;

  /// No description provided for @settingsManifestationGuide.
  ///
  /// In en, this message translates to:
  /// **'Manifestation Guide'**
  String get settingsManifestationGuide;

  /// No description provided for @settingsExportPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Export Password'**
  String get settingsExportPasswordTitle;

  /// No description provided for @settingsImportPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Import Password'**
  String get settingsImportPasswordTitle;

  /// No description provided for @settingsPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingsPasswordHint;

  /// No description provided for @settingsExportFailed.
  ///
  /// In en, this message translates to:
  /// **'Export failed: {error}'**
  String settingsExportFailed(String error);

  /// No description provided for @settingsCouldNotReadFile.
  ///
  /// In en, this message translates to:
  /// **'Could not read file.'**
  String get settingsCouldNotReadFile;

  /// No description provided for @settingsDataImported.
  ///
  /// In en, this message translates to:
  /// **'Data imported successfully.'**
  String get settingsDataImported;

  /// No description provided for @settingsWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password or corrupted file.'**
  String get settingsWrongPassword;

  /// No description provided for @settingsImportFailed.
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String settingsImportFailed(String error);

  /// No description provided for @settingsExportSubject.
  ///
  /// In en, this message translates to:
  /// **'Moon Manifest Backup'**
  String get settingsExportSubject;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// No description provided for @historyNoCompletedCycles.
  ///
  /// In en, this message translates to:
  /// **'No completed cycles yet'**
  String get historyNoCompletedCycles;

  /// No description provided for @historyOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get historyOngoing;

  /// No description provided for @historyIntentionCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 intention} other{{count} intentions}}'**
  String historyIntentionCount(int count);

  /// No description provided for @historyIntentionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Intentions'**
  String get historyIntentionsLabel;

  /// No description provided for @historyGratitudesLabel.
  ///
  /// In en, this message translates to:
  /// **'Gratitudes'**
  String get historyGratitudesLabel;

  /// No description provided for @phaseNewMoon.
  ///
  /// In en, this message translates to:
  /// **'New Moon'**
  String get phaseNewMoon;

  /// No description provided for @phaseWaxing.
  ///
  /// In en, this message translates to:
  /// **'Waxing'**
  String get phaseWaxing;

  /// No description provided for @phaseFullMoon.
  ///
  /// In en, this message translates to:
  /// **'Full Moon'**
  String get phaseFullMoon;

  /// No description provided for @phaseWaning.
  ///
  /// In en, this message translates to:
  /// **'Waning'**
  String get phaseWaning;

  /// No description provided for @languageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEn;

  /// No description provided for @languageBg.
  ///
  /// In en, this message translates to:
  /// **'Български'**
  String get languageBg;

  /// No description provided for @languageEs.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageEs;

  /// No description provided for @languagePt.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get languagePt;

  /// No description provided for @languageDe.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageDe;

  /// No description provided for @languageFr.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFr;

  /// No description provided for @languageRu.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get languageRu;

  /// No description provided for @languageZh.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get languageZh;

  /// No description provided for @languageJa.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get languageJa;

  /// No description provided for @languageHi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get languageHi;

  /// No description provided for @languageTr.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get languageTr;

  /// No description provided for @wisdom1.
  ///
  /// In en, this message translates to:
  /// **'What you seek is seeking you.'**
  String get wisdom1;

  /// No description provided for @wisdom1Author.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get wisdom1Author;

  /// No description provided for @wisdom2.
  ///
  /// In en, this message translates to:
  /// **'The universe is not outside of you. Look inside yourself; everything that you want, you already are.'**
  String get wisdom2;

  /// No description provided for @wisdom2Author.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get wisdom2Author;

  /// No description provided for @wisdom3.
  ///
  /// In en, this message translates to:
  /// **'Trust the wait. Embrace the uncertainty.'**
  String get wisdom3;

  /// No description provided for @wisdom4.
  ///
  /// In en, this message translates to:
  /// **'You don\'t attract what you want. You attract what you are.'**
  String get wisdom4;

  /// No description provided for @wisdom5.
  ///
  /// In en, this message translates to:
  /// **'When I let go of what I am, I become what I might be.'**
  String get wisdom5;

  /// No description provided for @wisdom5Author.
  ///
  /// In en, this message translates to:
  /// **'Lao Tzu'**
  String get wisdom5Author;

  /// No description provided for @wisdom6.
  ///
  /// In en, this message translates to:
  /// **'Nature does not hurry, yet everything is accomplished.'**
  String get wisdom6;

  /// No description provided for @wisdom6Author.
  ///
  /// In en, this message translates to:
  /// **'Lao Tzu'**
  String get wisdom6Author;

  /// No description provided for @wisdom7.
  ///
  /// In en, this message translates to:
  /// **'Assume the feeling of your wish fulfilled and observe the route that your attention follows.'**
  String get wisdom7;

  /// No description provided for @wisdom7Author.
  ///
  /// In en, this message translates to:
  /// **'Neville Goddard'**
  String get wisdom7Author;

  /// No description provided for @wisdom8.
  ///
  /// In en, this message translates to:
  /// **'Man\'s chief delusion is his conviction that there are causes other than his own state of consciousness.'**
  String get wisdom8;

  /// No description provided for @wisdom8Author.
  ///
  /// In en, this message translates to:
  /// **'Neville Goddard'**
  String get wisdom8Author;

  /// No description provided for @wisdom9.
  ///
  /// In en, this message translates to:
  /// **'You are always a student, never a master. You have to keep moving forward.'**
  String get wisdom9;

  /// No description provided for @wisdom9Author.
  ///
  /// In en, this message translates to:
  /// **'Conrad Hall'**
  String get wisdom9Author;

  /// No description provided for @wisdom10.
  ///
  /// In en, this message translates to:
  /// **'Stop acting so small. You are the universe in ecstatic motion.'**
  String get wisdom10;

  /// No description provided for @wisdom10Author.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get wisdom10Author;

  /// No description provided for @wisdom11.
  ///
  /// In en, this message translates to:
  /// **'The present moment always will have been. Rest in that.'**
  String get wisdom11;

  /// No description provided for @wisdom12.
  ///
  /// In en, this message translates to:
  /// **'Letting go gives us freedom, and freedom is the only condition for happiness.'**
  String get wisdom12;

  /// No description provided for @wisdom12Author.
  ///
  /// In en, this message translates to:
  /// **'Thich Nhat Hanh'**
  String get wisdom12Author;

  /// No description provided for @wisdom13.
  ///
  /// In en, this message translates to:
  /// **'Surrender is not giving up. It is giving over to something greater.'**
  String get wisdom13;

  /// No description provided for @wisdom14.
  ///
  /// In en, this message translates to:
  /// **'You have within you right now, everything you need to deal with whatever the world can throw at you.'**
  String get wisdom14;

  /// No description provided for @wisdom14Author.
  ///
  /// In en, this message translates to:
  /// **'Brian Tracy'**
  String get wisdom14Author;

  /// No description provided for @wisdom15.
  ///
  /// In en, this message translates to:
  /// **'The quieter you become, the more you are able to hear.'**
  String get wisdom15;

  /// No description provided for @wisdom15Author.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get wisdom15Author;

  /// No description provided for @wisdom16.
  ///
  /// In en, this message translates to:
  /// **'Your task is not to seek for love, but merely to seek and find all the barriers within yourself that you have built against it.'**
  String get wisdom16;

  /// No description provided for @wisdom16Author.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get wisdom16Author;

  /// No description provided for @wisdom17.
  ///
  /// In en, this message translates to:
  /// **'Faith is taking the first step even when you don\'t see the whole staircase.'**
  String get wisdom17;

  /// No description provided for @wisdom17Author.
  ///
  /// In en, this message translates to:
  /// **'Martin Luther King Jr.'**
  String get wisdom17Author;

  /// No description provided for @wisdom18.
  ///
  /// In en, this message translates to:
  /// **'The seed does not fight the soil. It simply grows.'**
  String get wisdom18;

  /// No description provided for @wisdom19.
  ///
  /// In en, this message translates to:
  /// **'Release the need to know how. Trust that the universe knows the way.'**
  String get wisdom19;

  /// No description provided for @wisdom20.
  ///
  /// In en, this message translates to:
  /// **'Begin to see yourself as a soul with a body rather than a body with a soul.'**
  String get wisdom20;

  /// No description provided for @wisdom20Author.
  ///
  /// In en, this message translates to:
  /// **'Wayne Dyer'**
  String get wisdom20Author;

  /// No description provided for @wisdom21.
  ///
  /// In en, this message translates to:
  /// **'You cannot always control what goes on outside. But you can always control what goes on inside.'**
  String get wisdom21;

  /// No description provided for @wisdom21Author.
  ///
  /// In en, this message translates to:
  /// **'Wayne Dyer'**
  String get wisdom21Author;

  /// No description provided for @wisdom22.
  ///
  /// In en, this message translates to:
  /// **'Patience is not passive waiting. It is active trust.'**
  String get wisdom22;

  /// No description provided for @wisdom23.
  ///
  /// In en, this message translates to:
  /// **'Everything you need is already within you, waiting to unfold.'**
  String get wisdom23;

  /// No description provided for @wisdom24.
  ///
  /// In en, this message translates to:
  /// **'The moon does not fight. It watches. And in watching, it holds everything together.'**
  String get wisdom24;

  /// No description provided for @wisdom25.
  ///
  /// In en, this message translates to:
  /// **'Act as if what you intend to manifest in life is already a reality.'**
  String get wisdom25;

  /// No description provided for @wisdom25Author.
  ///
  /// In en, this message translates to:
  /// **'Wayne Dyer'**
  String get wisdom25Author;

  /// No description provided for @wisdom26.
  ///
  /// In en, this message translates to:
  /// **'Be still and know.'**
  String get wisdom26;

  /// No description provided for @wisdom27.
  ///
  /// In en, this message translates to:
  /// **'Let go of the branches and trust the river.'**
  String get wisdom27;

  /// No description provided for @wisdom28.
  ///
  /// In en, this message translates to:
  /// **'The wound is the place where the light enters you.'**
  String get wisdom28;

  /// No description provided for @wisdom28Author.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get wisdom28Author;

  /// No description provided for @wisdom29.
  ///
  /// In en, this message translates to:
  /// **'A ship in a harbor is safe, but that is not what ships are built for.'**
  String get wisdom29;

  /// No description provided for @wisdom29Author.
  ///
  /// In en, this message translates to:
  /// **'John A. Shedd'**
  String get wisdom29Author;

  /// No description provided for @wisdom30.
  ///
  /// In en, this message translates to:
  /// **'The universe is always speaking to us. Sending us little messages, causing coincidences and serendipities. The only question is: are we listening?'**
  String get wisdom30;

  /// No description provided for @wisdom30Author.
  ///
  /// In en, this message translates to:
  /// **'Nancy Thayer'**
  String get wisdom30Author;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bg',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'ja',
    'pt',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bg':
      return AppLocalizationsBg();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
