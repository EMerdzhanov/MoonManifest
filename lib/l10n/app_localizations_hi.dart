// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'मून मैनिफेस्ट में\nआपका स्वागत है';

  @override
  String get onboardingWelcomeBody =>
      'यह ऐप चंद्रमा से जुड़ी प्रकटीकरण साधना में आपका मार्गदर्शन करता है।';

  @override
  String get onboardingCycleTitle => 'चक्र';

  @override
  String get onboardingCycleBody =>
      'प्रत्येक चंद्र मास चार विशिष्ट चरणों से गुज़रता है, हर एक की अपनी ऊर्जा होती है।';

  @override
  String get onboardingWhatYouDoTitle => 'आप क्या करेंगे';

  @override
  String get onboardingNewMoonDesc =>
      'संकल्प स्थापित करें और नई शुरुआत के बीज बोएँ।';

  @override
  String get onboardingWaxingDesc =>
      'अपने लक्ष्यों की ओर कदम उठाएँ और गति बनाएँ।';

  @override
  String get onboardingFullMoonDesc =>
      'सफलताओं का उत्सव मनाएँ और जो अब काम नहीं आता उसे छोड़ दें।';

  @override
  String get onboardingWaningDesc =>
      'चिंतन करें, विश्राम करें और सीखे हुए पाठों को आत्मसात करें।';

  @override
  String get onboardingPreferencesTitle => 'आपकी प्राथमिकताएँ';

  @override
  String get onboardingPreferencesSubtitle =>
      'मार्गदर्शन कैसे और कब प्राप्त करना है, यह अनुकूलित करें।';

  @override
  String get onboardingNotificationFrequency => 'सूचना आवृत्ति';

  @override
  String get onboardingNotificationFrequencyHint =>
      'आप दिन में कितनी बार अनुस्मारक चाहते हैं?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / दिन';
  }

  @override
  String get onboardingWakeWindow => 'जागने का समय';

  @override
  String get onboardingWakeWindowHint => 'इन घंटों के बाहर कोई सूचना नहीं।';

  @override
  String get onboardingWakeUp => 'जागना';

  @override
  String get onboardingWindDown => 'विश्राम';

  @override
  String get onboardingButtonContinue => 'जारी रखें';

  @override
  String get onboardingButtonBegin => 'शुरू करें';

  @override
  String get waitingWindowNotOpen => 'प्रकटीकरण की खिड़की अभी खुली नहीं है';

  @override
  String waitingFirstCycle(String date) {
    return 'आपका पहला चक्र $date को अमावस्या पर शुरू होगा।';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन बाकी',
      one: 'एक दिन बाकी',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'प्रतीक्षा करते हुए तैयारी करें';

  @override
  String get waitingLearnManifest => 'प्रकटीकरण कैसे करें, जानें';

  @override
  String get waitingLearnManifestSubtitle =>
      'वे 4 नियम जो इस साधना को प्रभावी बनाते हैं';

  @override
  String get waitingUnderstandCycle => 'चंद्र चक्र को समझें';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'देखें कि आप कहाँ हैं और हर चरण का क्या अर्थ है';

  @override
  String get waitingDraftIntentionsTitle => 'अपने संकल्पों का मसौदा तैयार करें';

  @override
  String get waitingDraftIntentionsBody =>
      'चिंतन और तैयारी के लिए इस स्थान का उपयोग करें। आप क्या आमंत्रित करना चाहते हैं?';

  @override
  String waitingIntentionHint(int number) {
    return 'संकल्प $number…';
  }

  @override
  String get waitingAddIntention => 'संकल्प जोड़ें';

  @override
  String get waitingMaxIntentionsMessage =>
      'सात संकल्प एक सार्थक संख्या है। जो सबसे महत्वपूर्ण है, उसे सोच-समझकर चुनें।';

  @override
  String get waitingDraftSaved => 'मसौदा सहेजा गया';

  @override
  String get commonSomethingWentWrong => 'कुछ गलत हो गया।';

  @override
  String get newMoonSetIntentions => 'अमावस्या।\nअपने संकल्प स्थापित करें।';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'अनुग्रह अवधि $deadline को समाप्त होगी';
  }

  @override
  String get newMoonGuidancePrompt =>
      'स्वयं से पूछें: मेरी इच्छाओं के पीछे मुझे वास्तव में क्या चाहिए? ऐसे संकल्प स्थापित करें जो आपकी मूल आवश्यकताओं से बात करें — विकास, जुड़ाव, शांति, प्रचुरता।';

  @override
  String get newMoonHowToWrite => 'प्रभावशाली संकल्प कैसे लिखें';

  @override
  String get newMoonYourIntentions => 'आपके संकल्प';

  @override
  String newMoonIntentionHint(int number) {
    return 'संकल्प $number…';
  }

  @override
  String get newMoonAddIntention => 'संकल्प जोड़ें';

  @override
  String get newMoonMaxIntentionsMessage =>
      'सात संकल्प एक सार्थक संख्या है। जो सबसे महत्वपूर्ण है, उसे सोच-समझकर चुनें।';

  @override
  String get newMoonPlantIntentions => 'ये संकल्प बोएँ';

  @override
  String get newMoonLockedTitle => 'ये इस चक्र के लिए आपके संकल्प हैं।';

  @override
  String get newMoonLockedSubtitleEditing => 'नीचे अपने संकल्प संपादित करें।';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'ये बो दिए गए हैं। प्रक्रिया पर भरोसा रखें।';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'संकल्प $number...';
  }

  @override
  String get newMoonEditIntentions => 'संकल्प संपादित करें';

  @override
  String get newMoonEditUntilWaxing =>
      'शुक्ल पक्ष शुरू होने तक आप संपादन कर सकते हैं।';

  @override
  String get newMoonSaveChanges => 'परिवर्तन सहेजें';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonOk => 'ठीक है';

  @override
  String waxingDayOfWaxing(int day) {
    return 'शुक्ल पक्ष का दिन $day।';
  }

  @override
  String get waxingFullMoonTomorrow => 'कल पूर्णिमा है।';

  @override
  String waxingFullMoonInDays(int count) {
    return 'पूर्णिमा $count दिनों में।';
  }

  @override
  String get waxingYourIntentions => 'आपके संकल्प';

  @override
  String get waxingUnableToLoad => 'संकल्प लोड करने में असमर्थ।';

  @override
  String get waxingNoIntentionsFound => 'इस चक्र के लिए कोई संकल्प नहीं मिले।';

  @override
  String get fullMoonNoIntentionsSet =>
      'इस चक्र में कोई संकल्प स्थापित नहीं किए गए';

  @override
  String get fullMoonWorkDone => 'कार्य पूर्ण हो गया है।';

  @override
  String get fullMoonNowRelease => 'अब मुक्त करें।';

  @override
  String fullMoonWaningNext(String date) {
    return 'कृष्ण पक्ष शीघ्र ही शुरू होगा।\nआपका अगला चक्र $date को अमावस्या पर शुरू होगा।';
  }

  @override
  String get fullMoonGiveThanks => 'पूर्णिमा। आभार व्यक्त करें।';

  @override
  String get fullMoonGracePeriodActive => 'अनुग्रह अवधि सक्रिय है';

  @override
  String get fullMoonThankUniverse =>
      'ब्रह्मांड को ऐसे धन्यवाद दें जैसे आपको वह पहले से मिल चुका है जो आपने माँगा था';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get fullMoonGratitudeHint => 'मैं बहुत आभारी हूँ कि…';

  @override
  String get fullMoonCompleteCeremony => 'अनुष्ठान पूरा करें';

  @override
  String get fullMoonNextIntention => 'अगला संकल्प';

  @override
  String get waningWindowClosed => 'प्रकटीकरण की खिड़की बंद है';

  @override
  String waningOpensAgain(int count) {
    return 'अमावस्या पर $count दिनों में फिर खुलेगी';
  }

  @override
  String get waningReleaseTrust => 'मुक्त करें। भरोसा रखें।';

  @override
  String get waningWorkDone => 'कार्य पूर्ण हो गया है।';

  @override
  String get waningNextNewMoon => 'अगली अमावस्या';

  @override
  String get waningWhyQuiet => 'शांति क्यों है?';

  @override
  String get philosophyTitle => 'अभी यह खिड़की\nबंद क्यों है?';

  @override
  String get philosophyBody1 =>
      'प्रकटीकरण आपकी समय-सारणी पर नहीं चलता — यह चंद्रमा की गति पर चलता है। चंद्र चक्र में विशेष समय होते हैं जब संकल्प स्थापित करना शक्तिशाली होता है, और ऐसे समय भी होते हैं जब सबसे शक्तिशाली कार्य कुछ न करना होता है।';

  @override
  String get philosophyBody2 =>
      'अभी चंद्रमा कृष्ण पक्ष में है — अंधकार की ओर सिकुड़ रहा है। यह मुक्ति का चरण है। इस चक्र के आपके संकल्प बोए गए, पोषित किए गए और कृतज्ञता में अर्पित किए गए। अब उन्हें जड़ पकड़ने के लिए स्थान चाहिए। इस चरण में अधिक दबाव डालना सहायक नहीं है। यह बाधा उत्पन्न करता है।';

  @override
  String get philosophyBody3 =>
      'जब अमावस्या आएगी, खिड़की फिर खुलेगी। तब आप नए संकल्प स्थापित करेंगे और एक नया चक्र शुरू करेंगे। प्रतीक्षा व्यर्थ नहीं है — यह साधना का हिस्सा है। मुक्ति का अनुशासन ही प्रकटीकरण को मात्र कामना से अलग करता है।';

  @override
  String get philosophyDaysUntilOpen => 'दिन बाकी हैं खिड़की खुलने में';

  @override
  String philosophyReminderSetFor(String date) {
    return '$date के लिए अनुस्मारक सेट किया गया';
  }

  @override
  String get philosophyRemindMe => 'खुलने पर मुझे याद दिलाएँ';

  @override
  String get philosophyCouldNotSchedule => 'अनुस्मारक शेड्यूल नहीं हो सका';

  @override
  String get philosophyNotificationTitle => 'प्रकटीकरण की खिड़की खुल गई है।';

  @override
  String get philosophyNotificationBody => 'अभी अपने संकल्प स्थापित करें।';

  @override
  String get philosophyHookTitle => 'वे क्या जानते हैं\nजो आप नहीं जानते';

  @override
  String get philosophyHookBody1 =>
      'दुनिया के सबसे सफल लोग केवल लक्ष्य निर्धारित नहीं करते। वे समय के साथ काम करते हैं। वे कुछ ऐसा समझते हैं जो अधिकांश लोग कभी नहीं समझेंगे: कि ब्रह्मांड की एक लय है, और जो इसके साथ तालमेल बिठाते हैं, वे परिणामों का पीछा नहीं करते — परिणाम उनका पीछा करते हैं।';

  @override
  String get philosophyHookBody2 =>
      'यह कोई रहस्य नहीं है। यह प्राचीन ज्ञान है — हज़ारों वर्षों से उन लोगों द्वारा अभ्यास किया गया जिन्होंने साम्राज्य बनाए, वंश स्थापित किए और चुपचाप संसार को बदला। चंद्रमा उनकी घड़ी थी। \"मैं हूँ\" उनकी भाषा थी। और प्रतिबद्धता उनकी कीमत थी।';

  @override
  String get philosophyHookBody3 =>
      'वे यह समझते थे: प्रकटीकरण सरल है। आसान नहीं — सरल। आप घोषणा करते हैं कि आप क्या बन रहे हैं। आप इसे तब तक दोहराते हैं जब तक आपका मन इसे मान न ले। आप प्रमाण देखने से पहले धन्यवाद देते हैं। और फिर आप पूरी तरह छोड़ देते हैं।';

  @override
  String get philosophyHookBody4 =>
      'अधिकांश लोग असफल होते हैं क्योंकि वे प्रक्रिया के प्रति समर्पित नहीं होते। वे अनुशासन के बिना परिणाम चाहते हैं। वे एक दिन प्रकटीकरण करते हैं, संकेत खोजते हैं, और जब मंगलवार तक कुछ नहीं होता तो छोड़ देते हैं। यह प्रकटीकरण नहीं है। यह कामना है।';

  @override
  String get philosophyMoonHeading => 'चंद्रमा वह कड़ी है जो गायब थी';

  @override
  String get philosophyMoonBody1 =>
      'आपने शायद पहले भी अभिपुष्टि (affirmations) आज़माई होंगी। शायद आईने में \"मैं समृद्ध हूँ\" कहा होगा और कुछ भी बदलता महसूस नहीं किया। ऐसा इसलिए कि आप शून्य में बोल रहे थे — न कोई समय, न कोई संरचना, न आपके शब्दों के पीछे कोई ब्रह्मांडीय तालमेल।';

  @override
  String get philosophyMoonBody2 =>
      'चंद्रमा सब कुछ बदल देता है। यह आपकी साधना को एक चक्र देता है — एक आरंभ, एक मध्य, एक शिखर और एक मुक्ति। जब आप अमावस्या पर संकल्प स्थापित करते हैं, तो आप केवल इच्छाएँ नहीं लिख रहे। आप उस एकमात्र मिट्टी में बीज बो रहे हैं जो मनुष्यों के अस्तित्व से पहले से महासागरों को हिला रही है।';

  @override
  String get philosophyMoonBody3 =>
      'कृष्ण पक्ष विराम नहीं है। यह सबसे कठिन चरण है। कोई भी माँग सकता है। कोई भी दोहरा सकता है। लेकिन मुक्त करना — सच में छोड़ देना और भरोसा रखना कि जो आपने बोया वह अंधकार में बढ़ रहा है — इसके लिए उस अनुशासन की आवश्यकता है जिस पर यह साधना बनी है।';

  @override
  String get philosophyFourPhasesHeading => 'चार पवित्र चरण';

  @override
  String get philosophyPhasePlanting => 'बीज रोपण';

  @override
  String get philosophyPhasePlantingDesc =>
      'अंधकार में, आप वह नाम देते हैं जो आपको चाहिए — वह नहीं जो आप चाहते हैं, बल्कि वह जो आपकी आत्मा को आवश्यक है। अमावस्या कच्चे सत्य के लिए स्थान धारण करती है।';

  @override
  String get philosophyPhaseTending => 'पोषण';

  @override
  String get philosophyPhaseTendingDesc =>
      'जैसे-जैसे प्रकाश लौटता है, आप प्रतिदिन अपने संकल्प दोहराते हैं। आशा के रूप में नहीं, बल्कि निश्चितता के रूप में। आप माँग नहीं रहे — आप याद कर रहे हैं जो पहले से आपकी ओर आ रहा है।';

  @override
  String get philosophyPhaseGratitude => 'कृतज्ञता';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'पूर्ण प्रकाश में, आप ऐसे धन्यवाद देते हैं जैसे आपको वह पहले से प्राप्त हो चुका है जो आपने माँगा था। यह दिखावा नहीं है। यह वह कर्म है जो आप जहाँ हैं और जहाँ जा रहे हैं, उसके बीच की दूरी को मिटा देता है।';

  @override
  String get philosophyPhaseRelease => 'मुक्ति';

  @override
  String get philosophyPhaseReleaseDesc =>
      'और फिर — मौन। आप छोड़ देते हैं। दबाव डालना बंद, जाँचना बंद, माँगना बंद। कृष्ण पक्ष सबसे कठिन पाठ सिखाता है: कि आपका कार्य पूर्ण हो चुका है, और अब यह आपसे बड़ी किसी शक्ति का है।';

  @override
  String get philosophyClosing =>
      'जब चंद्रमा अंधकार में लौटता है,\nआप शुरू करते हैं।';

  @override
  String get guideTitle => 'प्रकटीकरण कैसे करें';

  @override
  String get guideIntro =>
      'चार नियम। बस इतना। इन्हें साध लें और चंद्रमा बाकी सँभाल लेगा।';

  @override
  String get guideRule01 => 'नियम 01';

  @override
  String get guideRule01Title => 'आवश्यकता पहचानें,\nइच्छा नहीं';

  @override
  String get guideRule01Body1 =>
      'सतही इच्छा असली संकल्प को छुपाती है। आप वास्तव में दस लाख रुपये नहीं चाहते — आप सुरक्षा, स्वतंत्रता, चिंतामुक्ति का अनुभव चाहते हैं। प्रकटीकरण भावना के स्तर पर काम करता है, भौतिक वस्तुओं के स्तर पर नहीं।';

  @override
  String get guideRule01Body2 =>
      'अपने आप से पूछें: मैं यह क्यों चाहता/चाहती हूँ? इसका उत्तर ही आपका असली संकल्प है।';

  @override
  String get guideRule01Wrong1 => 'मुझे दस लाख रुपये चाहिए';

  @override
  String get guideRule01Right1 =>
      'मैं आर्थिक स्वतंत्रता का अनुभव कर रहा/रही हूँ';

  @override
  String get guideRule01Wrong2 => 'मुझे एक साथी चाहिए';

  @override
  String get guideRule01Right2 =>
      'मैं गहरे, प्रेमपूर्ण जुड़ाव से घिरा/घिरी हूँ';

  @override
  String get guideRule01Wrong3 => 'मुझे पदोन्नति चाहिए';

  @override
  String get guideRule01Right3 => 'मेरे कार्य को पहचाना और सराहा जाता है';

  @override
  String get guideRule02 => 'नियम 02';

  @override
  String get guideRule02Title =>
      '\"मैं हूँ\" — सबसे शक्तिशाली\nशब्द जो आप कभी बोलेंगे';

  @override
  String get guideRule02Body1 =>
      'बाइबल में, जब मूसा ने ईश्वर से उनका नाम पूछा, तो उत्तर था \"मैं हूँ जो मैं हूँ\"। प्रत्येक परंपरा जिसने प्रकटीकरण को छुआ है — हर्मेटिक दर्शन से लेकर नेविल गोडार्ड से लेकर आधुनिक अभ्यास तक — \"मैं हूँ\" को वह घोषणा मानती है जो वास्तविकता को आकार देती है।';

  @override
  String get guideRule02Body2 =>
      '\"मैं हूँ\" के बाद जो भी आता है, वह ब्रह्मांड को आपका आदेश बन जाता है। सावधानी से चुनें।';

  @override
  String get guideRule02Tip1 =>
      'हमेशा सकारात्मक — \"मैं स्वस्थ हूँ\" न कि \"मैं बीमार नहीं हूँ\"';

  @override
  String get guideRule02Tip2 =>
      'हमेशा वर्तमान काल में — \"मैं हूँ\" न कि \"मैं होऊँगा\"';

  @override
  String get guideRule02Tip3 =>
      'हमेशा विश्वास के साथ — इसे सत्य के रूप में बोलें, आशा के रूप में नहीं';

  @override
  String get guideRule02Right1 =>
      'मैं समृद्ध हूँ और धन सहजता से मेरी ओर आता है';

  @override
  String get guideRule02Right2 =>
      'जो मैं बन रहा/रही हूँ, उसके साथ मैं शांत हूँ';

  @override
  String get guideRule02Right3 =>
      'जो जीवन मैं रच रहा/रही हूँ, मैं उसके योग्य हूँ';

  @override
  String get guideRule03 => 'नियम 03';

  @override
  String get guideRule03Title => 'ऐसे बोलें जैसे\nयह पहले से हो चुका है';

  @override
  String get guideRule03Body1 =>
      'आपको यह जानने की आवश्यकता नहीं कि यह कैसे होगा। आपका एकमात्र कार्य है उस कंपन — उस भाव — को बनाए रखना कि जो आपने घोषित किया, वह आपको पहले से प्राप्त है।';

  @override
  String get guideRule03Body2 =>
      'ब्रह्मांड इस पर प्रतिक्रिया नहीं करता कि आप क्या चाहते हैं। वह इस पर प्रतिक्रिया करता है कि आप क्या हैं। पीछा न करें। संकेत न खोजें। बस वही बनें।';

  @override
  String get guideRule03Wrong1 => 'मुझे आशा है कि किसी दिन शांति मिलेगी';

  @override
  String get guideRule03Right1 =>
      'मैं उस शांति के लिए आभारी हूँ जो मेरे जीवन को भर देती है';

  @override
  String get guideRule03Wrong2 =>
      'मैं अधिक आत्मविश्वासी बनने की कोशिश कर रहा/रही हूँ';

  @override
  String get guideRule03Right2 =>
      'मैं आत्मविश्वासी हूँ। मुझे अपने आप पर पूरा भरोसा है।';

  @override
  String get guideRule04 => 'नियम 04';

  @override
  String get guideRule04Title => 'कृतज्ञता ही प्रमाण है';

  @override
  String get guideRule04Body1 =>
      'कृतज्ञता बाद में दिया गया धन्यवाद नहीं है। यह वह संकेत है जो आप प्राप्त करने से पहले भेजते हैं — ब्रह्मांड को प्रमाण कि आप प्रक्रिया पर भरोसा करते हैं।';

  @override
  String get guideRule04Body2 =>
      'जब आप किसी ऐसी चीज़ के लिए धन्यवाद देते हैं जो आपने अभी देखी नहीं, तो आप चाहने और पाने के बीच की खाई को मिटा देते हैं। यही वह अनुष्ठान है जिसमें यह ऐप हर पूर्णिमा पर आपका मार्गदर्शन करता है।';

  @override
  String get guideRule04Right1 =>
      'मैं बहुत आभारी हूँ कि आर्थिक स्वतंत्रता मेरी वास्तविकता है';

  @override
  String get guideRule04Right2 =>
      'उस प्रेम के लिए धन्यवाद जो हर दिन मुझे घेरे रहता है';

  @override
  String get guideRule04Right3 =>
      'मैं अपने स्वास्थ्य, अपनी शक्ति, अपनी स्पष्टता के लिए आभार व्यक्त करता/करती हूँ';

  @override
  String get guideClosing =>
      'यह आपकी साधना है।\nचंद्रमा समय देता है।\nआप सत्य देते हैं।';

  @override
  String get lunarCycleTitle => 'चंद्र चक्र';

  @override
  String lunarYouAreHere(String phase) {
    return 'आप यहाँ हैं: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'दिन $day / $total';
  }

  @override
  String get lunarNewMoonPlant => 'अमावस्या — बीज बोएँ';

  @override
  String get lunarNewMoonPlantDesc =>
      'अपने संकल्प स्थापित करें। पहचानें कि आपको वास्तव में क्या चाहिए। यहीं से चक्र शुरू होता है।';

  @override
  String get lunarNewMoonDuration => '~1 दिन';

  @override
  String get lunarNewMoonStatus => 'संकल्प खुले हैं';

  @override
  String get lunarWaxingTend => 'शुक्ल पक्ष — पोषण';

  @override
  String get lunarWaxingTendDesc =>
      'अपने संकल्प प्रतिदिन दोहराएँ। दोहराव से विश्वास बनाएँ। चंद्रमा बढ़ता है, और आपका विश्वास भी।';

  @override
  String get lunarWaxingDuration => '~14 दिन';

  @override
  String get lunarWaxingStatus => 'दैनिक अनुस्मारक सक्रिय';

  @override
  String get lunarFullMoonGiveThanks => 'पूर्णिमा — आभार व्यक्त करें';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'ऐसे कृतज्ञता व्यक्त करें जैसे आपको वह पहले से प्राप्त हो चुका है जो आपने माँगा था। यह शिखर है — प्राप्ति का क्षण।';

  @override
  String get lunarFullMoonDuration => '~1 दिन';

  @override
  String get lunarFullMoonStatus => 'कृतज्ञता अनुष्ठान';

  @override
  String get lunarWaningRelease => 'कृष्ण पक्ष — मुक्ति';

  @override
  String get lunarWaningReleaseDesc =>
      'पूरी तरह छोड़ दें। दबाव डालना बंद करें, जाँचना बंद करें। भरोसा रखें कि जो आपने बोया वह अंधकार में बढ़ रहा है।';

  @override
  String get lunarWaningDuration => '~14 दिन';

  @override
  String get lunarWaningStatus => 'खिड़की बंद — मौन';

  @override
  String get lunarLegendManifest => 'प्रकटीकरण';

  @override
  String get lunarLegendRelease => 'मुक्ति';

  @override
  String get lunarThisCycle => 'यह चक्र';

  @override
  String get lunarNow => 'अभी';

  @override
  String get cycleDiagramNewMoon => 'अमावस्या';

  @override
  String get cycleDiagramWaxingCrescent => 'शुक्ल\nद्वितीया';

  @override
  String get cycleDiagramFirstQuarter => 'शुक्ल\nअष्टमी';

  @override
  String get cycleDiagramWaxingGibbous => 'शुक्ल\nत्रयोदशी';

  @override
  String get cycleDiagramFullMoon => 'पूर्णिमा';

  @override
  String get cycleDiagramWaningGibbous => 'कृष्ण\nत्रयोदशी';

  @override
  String get cycleDiagramLastQuarter => 'कृष्ण\nअष्टमी';

  @override
  String get cycleDiagramWaningCrescent => 'कृष्ण\nद्वितीया';

  @override
  String get cycleDiagramManifest => 'प्रकटीकरण';

  @override
  String get cycleDiagramRelease => 'मुक्ति';

  @override
  String get cycleThisCycle => 'यह चक्र';

  @override
  String get cycleSeeFullDetails => 'पूरा चक्र विवरण देखें';

  @override
  String debugLabel(String info) {
    return 'डीबग: $info';
  }

  @override
  String get debugLive => 'लाइव';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsNotifications => 'सूचनाएँ';

  @override
  String get settingsReminderFrequency => 'अनुस्मारक आवृत्ति (प्रतिदिन)';

  @override
  String get settingsWakeWindow => 'जागने का समय';

  @override
  String get settingsWakeWindowStart => 'शुरू';

  @override
  String get settingsWakeWindowEnd => 'अंत';

  @override
  String get settingsMoonStyle => 'चंद्रमा शैली';

  @override
  String get settingsMoonStyleDescription => 'ऐप में चंद्रमा कैसा दिखे, चुनें';

  @override
  String get settingsMoonStyleClassic => 'क्लासिक';

  @override
  String get settingsMoonStyleStarfield => 'तारा क्षेत्र';

  @override
  String get settingsMoonStyleAura => 'आभा';

  @override
  String get settingsMoonStyleHalo => 'प्रभामंडल';

  @override
  String get settingsData => 'डेटा';

  @override
  String get settingsExportData => 'डेटा निर्यात करें';

  @override
  String get settingsImportData => 'डेटा आयात करें';

  @override
  String get settingsAbout => 'परिचय';

  @override
  String get settingsAboutDescription =>
      'मून मैनिफेस्ट एक व्यक्तिगत अनुष्ठान साथी है जो आपके संकल्पों को चंद्र चक्र के साथ संरेखित करने में सहायता करता है। हर अमावस्या पर, आप तीन तक संकल्प स्थापित करते हैं और अगले 28 दिन दैनिक कृतज्ञता और चिंतन के माध्यम से उन्हें पोषित करते हैं। आपका डेटा आपके उपकरण पर सुरक्षित रूप से संग्रहीत है और कभी किसी सर्वर पर नहीं भेजा जाता। एन्क्रिप्टेड बैकअप बनाने के लिए निर्यात सुविधा का उपयोग करें, और अपनी साधना को पुनर्स्थापित करने के लिए नए उपकरण पर आयात करें।';

  @override
  String get settingsManifestationGuide => 'प्रकटीकरण मार्गदर्शिका';

  @override
  String get settingsExportPasswordTitle => 'निर्यात पासवर्ड सेट करें';

  @override
  String get settingsImportPasswordTitle => 'आयात पासवर्ड दर्ज करें';

  @override
  String get settingsPasswordHint => 'पासवर्ड';

  @override
  String settingsExportFailed(String error) {
    return 'निर्यात विफल: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'फ़ाइल पढ़ नहीं सकी।';

  @override
  String get settingsDataImported => 'डेटा सफलतापूर्वक आयात किया गया।';

  @override
  String get settingsWrongPassword => 'गलत पासवर्ड या दूषित फ़ाइल।';

  @override
  String settingsImportFailed(String error) {
    return 'आयात विफल: $error';
  }

  @override
  String get settingsExportSubject => 'मून मैनिफेस्ट बैकअप';

  @override
  String get historyTitle => 'इतिहास';

  @override
  String get historyNoCompletedCycles => 'अभी तक कोई पूर्ण चक्र नहीं';

  @override
  String get historyOngoing => 'जारी';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count संकल्प',
      one: '1 संकल्प',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'संकल्प';

  @override
  String get historyGratitudesLabel => 'कृतज्ञताएँ';

  @override
  String get phaseNewMoon => 'अमावस्या';

  @override
  String get phaseWaxing => 'शुक्ल पक्ष';

  @override
  String get phaseFullMoon => 'पूर्णिमा';

  @override
  String get phaseWaning => 'कृष्ण पक्ष';

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
  String get wisdom1 => 'जो तुम खोज रहे हो, वह भी तुम्हें खोज रहा है।';

  @override
  String get wisdom1Author => 'रूमी';

  @override
  String get wisdom2 =>
      'ब्रह्मांड तुम्हारे बाहर नहीं है। अपने भीतर देखो; जो कुछ तुम चाहते हो, वह तुम पहले से हो।';

  @override
  String get wisdom2Author => 'रूमी';

  @override
  String get wisdom3 => 'प्रतीक्षा पर भरोसा रखो। अनिश्चितता को अपनाओ।';

  @override
  String get wisdom4 =>
      'तुम वह नहीं आकर्षित करते जो तुम चाहते हो। तुम वह आकर्षित करते हो जो तुम हो।';

  @override
  String get wisdom5 =>
      'जब मैं वह छोड़ देता हूँ जो मैं हूँ, तो मैं वह बन जाता हूँ जो मैं हो सकता हूँ।';

  @override
  String get wisdom5Author => 'लाओ त्ज़ू';

  @override
  String get wisdom6 =>
      'प्रकृति कभी जल्दी नहीं करती, फिर भी सब कुछ पूर्ण हो जाता है।';

  @override
  String get wisdom6Author => 'लाओ त्ज़ू';

  @override
  String get wisdom7 =>
      'अपनी इच्छा पूर्ण होने का भाव धारण करो और देखो कि तुम्हारा ध्यान किस मार्ग पर चलता है।';

  @override
  String get wisdom7Author => 'नेविल गोडार्ड';

  @override
  String get wisdom8 =>
      'मनुष्य का सबसे बड़ा भ्रम यह विश्वास है कि उसकी अपनी चेतना की अवस्था के अलावा भी कोई कारण है।';

  @override
  String get wisdom8Author => 'नेविल गोडार्ड';

  @override
  String get wisdom9 =>
      'तुम सदा एक विद्यार्थी हो, कभी गुरु नहीं। तुम्हें निरंतर आगे बढ़ते रहना है।';

  @override
  String get wisdom9Author => 'कोनराड हॉल';

  @override
  String get wisdom10 =>
      'इतना छोटा बनकर मत रहो। तुम आनंदमय गति में ब्रह्मांड हो।';

  @override
  String get wisdom10Author => 'रूमी';

  @override
  String get wisdom11 => 'वर्तमान क्षण सदा रहा होगा। इसमें विश्राम करो।';

  @override
  String get wisdom12 =>
      'छोड़ देना हमें स्वतंत्रता देता है, और स्वतंत्रता ही सुख की एकमात्र शर्त है।';

  @override
  String get wisdom12Author => 'थिक नात हान';

  @override
  String get wisdom13 =>
      'समर्पण हार मानना नहीं है। यह किसी बड़ी शक्ति को सौंपना है।';

  @override
  String get wisdom14 =>
      'तुम्हारे भीतर अभी इस क्षण वह सब कुछ है जो संसार की किसी भी चुनौती से निपटने के लिए चाहिए।';

  @override
  String get wisdom14Author => 'ब्रायन ट्रेसी';

  @override
  String get wisdom15 => 'तुम जितने शांत होते जाओगे, उतना अधिक सुन पाओगे।';

  @override
  String get wisdom15Author => 'रूमी';

  @override
  String get wisdom16 =>
      'तुम्हारा कार्य प्रेम खोजना नहीं है, बल्कि अपने भीतर उन सब बाधाओं को खोजना और हटाना है जो तुमने प्रेम के विरुद्ध खड़ी की हैं।';

  @override
  String get wisdom16Author => 'रूमी';

  @override
  String get wisdom17 =>
      'विश्वास वह है जब तुम पूरी सीढ़ी न देखकर भी पहला कदम उठाते हो।';

  @override
  String get wisdom17Author => 'मार्टिन लूथर किंग जूनियर';

  @override
  String get wisdom18 => 'बीज मिट्टी से नहीं लड़ता। वह बस बढ़ता है।';

  @override
  String get wisdom19 =>
      'यह जानने की आवश्यकता छोड़ दो कि कैसे होगा। भरोसा रखो कि ब्रह्मांड को रास्ता पता है।';

  @override
  String get wisdom20 =>
      'स्वयं को शरीर वाली आत्मा के रूप में देखना शुरू करो, न कि आत्मा वाले शरीर के रूप में।';

  @override
  String get wisdom20Author => 'वेन डायर';

  @override
  String get wisdom21 =>
      'बाहर क्या होता है, उस पर तुम हमेशा नियंत्रण नहीं रख सकते। लेकिन भीतर क्या होता है, उस पर हमेशा रख सकते हो।';

  @override
  String get wisdom21Author => 'वेन डायर';

  @override
  String get wisdom22 =>
      'धैर्य निष्क्रिय प्रतीक्षा नहीं है। यह सक्रिय विश्वास है।';

  @override
  String get wisdom23 =>
      'जो कुछ तुम्हें चाहिए वह पहले से तुम्हारे भीतर है, प्रकट होने की प्रतीक्षा में।';

  @override
  String get wisdom24 =>
      'चंद्रमा लड़ता नहीं। वह देखता है। और देखने में, वह सब कुछ एक साथ थामे रखता है।';

  @override
  String get wisdom25 =>
      'ऐसे कार्य करो जैसे जो तुम जीवन में प्रकट करना चाहते हो, वह पहले से वास्तविकता है।';

  @override
  String get wisdom25Author => 'वेन डायर';

  @override
  String get wisdom26 => 'स्थिर रहो और जानो।';

  @override
  String get wisdom27 => 'शाखाओं को छोड़ दो और नदी पर भरोसा करो।';

  @override
  String get wisdom28 =>
      'घाव ही वह स्थान है जहाँ से प्रकाश तुम्हारे भीतर प्रवेश करता है।';

  @override
  String get wisdom28Author => 'रूमी';

  @override
  String get wisdom29 =>
      'बंदरगाह में खड़ा जहाज़ सुरक्षित है, पर जहाज़ इसके लिए नहीं बने।';

  @override
  String get wisdom29Author => 'जॉन ए. शेड';

  @override
  String get wisdom30 =>
      'ब्रह्मांड सदा हमसे बोल रहा है। छोटे-छोटे संदेश भेज रहा है, संयोग और अनायास घटनाएँ रच रहा है। एकमात्र प्रश्न यह है: क्या हम सुन रहे हैं?';

  @override
  String get wisdom30Author => 'नैन्सी थेयर';
}
