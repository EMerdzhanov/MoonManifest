// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Добре дошли в\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'Това приложение ви насочва в практика за манифестиране, свързана с лунния цикъл.';

  @override
  String get onboardingCycleTitle => 'Цикълът';

  @override
  String get onboardingCycleBody =>
      'Всеки лунен месец преминава през четири различни фази, всяка със своята енергия.';

  @override
  String get onboardingWhatYouDoTitle => 'Какво ще правите';

  @override
  String get onboardingNewMoonDesc =>
      'Поставете намерения и посейте семената за нови начала.';

  @override
  String get onboardingWaxingDesc =>
      'Действайте и изграждайте инерция към целите си.';

  @override
  String get onboardingFullMoonDesc =>
      'Отпразнувайте постиженията и освободете онова, което вече не ви служи.';

  @override
  String get onboardingWaningDesc =>
      'Размислете, починете и осмислете научените уроци.';

  @override
  String get onboardingPreferencesTitle => 'Вашите предпочитания';

  @override
  String get onboardingPreferencesSubtitle =>
      'Настройте как и кога да получавате напътствия.';

  @override
  String get onboardingNotificationFrequency => 'Честота на известията';

  @override
  String get onboardingNotificationFrequencyHint =>
      'Колко пъти на ден искате да бъдете напомняни?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / ден';
  }

  @override
  String get onboardingWakeWindow => 'Буден прозорец';

  @override
  String get onboardingWakeWindowHint => 'Без известия извън тези часове.';

  @override
  String get onboardingWakeUp => 'Събуждане';

  @override
  String get onboardingWindDown => 'Почивка';

  @override
  String get onboardingButtonContinue => 'Напред';

  @override
  String get onboardingButtonBegin => 'Започни';

  @override
  String get waitingWindowNotOpen =>
      'Прозорецът за манифестиране още не е отворен';

  @override
  String waitingFirstCycle(String date) {
    return 'Първият ви цикъл започва при новолунието на $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'след $count дни',
      one: 'след един ден',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Подгответе се, докато чакате';

  @override
  String get waitingLearnManifest => 'Научете се как да манифестирате';

  @override
  String get waitingLearnManifestSubtitle =>
      '4-те правила, които правят тази практика действена';

  @override
  String get waitingUnderstandCycle => 'Разберете лунния цикъл';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Вижте къде се намирате и какво означава всяка фаза';

  @override
  String get waitingDraftIntentionsTitle =>
      'Напишете чернова на намеренията си';

  @override
  String get waitingDraftIntentionsBody =>
      'Използвайте това пространство за размисъл и подготовка. Какво искате да привлечете?';

  @override
  String waitingIntentionHint(int number) {
    return 'Намерение $number…';
  }

  @override
  String get waitingAddIntention => 'Добави намерение';

  @override
  String get waitingMaxIntentionsMessage =>
      'Седем намерения е значимо число. Изберете внимателно онова, което наистина има значение.';

  @override
  String get waitingDraftSaved => 'Черновата е запазена';

  @override
  String get commonSomethingWentWrong => 'Нещо се обърка.';

  @override
  String get newMoonSetIntentions => 'Новолуние.\nПоставете намеренията си.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Гратисният период изтича $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Запитайте се: Какво наистина ми е нужно отвъд желанията ми? Поставете намерения, които говорят на дълбинните ви нужди — растеж, свързаност, спокойствие, изобилие.';

  @override
  String get newMoonHowToWrite => 'Как да напишете силни намерения';

  @override
  String get newMoonYourIntentions => 'Вашите намерения';

  @override
  String newMoonIntentionHint(int number) {
    return 'Намерение $number…';
  }

  @override
  String get newMoonAddIntention => 'Добави намерение';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Седем намерения е значимо число. Изберете внимателно онова, което наистина има значение.';

  @override
  String get newMoonPlantIntentions => 'Посей тези намерения';

  @override
  String get newMoonLockedTitle => 'Това са намеренията ви за този цикъл.';

  @override
  String get newMoonLockedSubtitleEditing =>
      'Редактирайте намеренията си по-долу.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'Те са посяти. Доверете се на процеса.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Намерение $number...';
  }

  @override
  String get newMoonEditIntentions => 'Редактирай намеренията';

  @override
  String get newMoonEditUntilWaxing =>
      'Можете да редактирате до началото на растящата фаза.';

  @override
  String get newMoonSaveChanges => 'Запази промените';

  @override
  String get commonCancel => 'Отказ';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Ден $day от растящата луна.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Пълнолуние утре.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Пълнолуние след $count дни.';
  }

  @override
  String get waxingYourIntentions => 'Вашите намерения';

  @override
  String get waxingUnableToLoad => 'Не могат да се заредят намеренията.';

  @override
  String get waxingNoIntentionsFound =>
      'Няма намерони намерения за този цикъл.';

  @override
  String get fullMoonNoIntentionsSet =>
      'Няма поставени намерения за този цикъл';

  @override
  String get fullMoonWorkDone => 'Работата е свършена.';

  @override
  String get fullMoonNowRelease => 'Сега освободи.';

  @override
  String fullMoonWaningNext(String date) {
    return 'Намаляващата фаза започва скоро.\nСледващият ви цикъл започва при новолунието на $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Пълнолуние. Благодари.';

  @override
  String get fullMoonGracePeriodActive => 'Гратисният период е активен';

  @override
  String get fullMoonThankUniverse =>
      'Благодарете на вселената, сякаш вече имате това, което поискахте';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current от $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Толкова съм благодарен/благодарна, че…';

  @override
  String get fullMoonCompleteCeremony => 'Завърши церемонията';

  @override
  String get fullMoonNextIntention => 'Следващо намерение';

  @override
  String get waningWindowClosed => 'Прозорецът за манифестиране е затворен';

  @override
  String waningOpensAgain(int count) {
    return 'Отваря отново след $count дни при новолунието';
  }

  @override
  String get waningReleaseTrust => 'Освободи. Довери се.';

  @override
  String get waningWorkDone => 'Работата е свършена.';

  @override
  String get waningNextNewMoon => 'Следващо новолуние';

  @override
  String get waningWhyQuiet => 'Защо е тихо?';

  @override
  String get philosophyTitle => 'Защо прозорецът е\nзатворен сега?';

  @override
  String get philosophyBody1 =>
      'Манифестирането не работи по вашия график — работи по графика на луната. Лунният цикъл има конкретни прозорци, когато поставянето на намерения е силно, и периоди, когато най-силното нещо, което можете да направите, е нищо.';

  @override
  String get philosophyBody2 =>
      'В момента луната намалява — свива се към мрак. Това е фазата на освобождаване. Намеренията ви от този цикъл са посяти, отгледани и отнесени с благодарност. Сега им трябва пространство, за да пуснат корени. Да натискате по-силно през тази фаза не помага. Пречи.';

  @override
  String get philosophyBody3 =>
      'Когато новолунието настъпи, прозорецът се отваря отново. Тогава поставяте нови намерения и започвате нов цикъл. Чакането не е загубено време — то е част от практиката. Дисциплината на освобождаването е това, което различава манифестирането от простото желание.';

  @override
  String get philosophyDaysUntilOpen => 'дни до отварянето на прозореца';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Напомнянето е зададено за $date';
  }

  @override
  String get philosophyRemindMe => 'Напомни ми, когато се отвори';

  @override
  String get philosophyCouldNotSchedule => 'Не можа да се насрочи напомняне';

  @override
  String get philosophyNotificationTitle =>
      'Прозорецът за манифестиране е отворен.';

  @override
  String get philosophyNotificationBody => 'Поставете намеренията си сега.';

  @override
  String get philosophyHookTitle => 'Какво знаят те,\nа вие не знаете';

  @override
  String get philosophyHookBody1 =>
      'Най-успешните хора на земята не само си поставят цели. Те работят с тайминга. Разбират нещо, което повечето хора никога няма да постигнат: че вселената има ритъм, и тези, които се съгласяват с него, не преследват резултатите — резултатите ги преследват тях.';

  @override
  String get philosophyHookBody2 =>
      'Това не е тайна. Това е древно знание — практикувано хиляди години от онези, които са оформяли империи, изградили династии и тихо са движили света. Луната е била техният часовник. „АЗ СЪМ“ е бил техният език. А отдадеността — тяхната цена.';

  @override
  String get philosophyHookBody3 =>
      'Ето какво са разбирали: манифестирането е просто. Не лесно — просто. Декларирате какво ставате. Повтаряте го, докато умът ви повярва. Благодарите, преди да сте видели доказателство. И тогава пускате. Напълно.';

  @override
  String get philosophyHookBody4 =>
      'Повечето хора се провалят, защото не се отдават на процеса. Искат резултата без дисциплината. Манифестират за един ден, търсят знаци и се отказват, когато нищо не се случи до вторник. Това не е манифестиране. Това е просто желание.';

  @override
  String get philosophyMoonHeading => 'Луната е липсващото парче';

  @override
  String get philosophyMoonBody1 =>
      'Вероятно вече сте пробвали афирмации. Вероятно сте казвали „Аз съм в изобилие“ пред огледалото и нищо не се е променило. Това е, защото сте говорили в празнота — без тайминг, без структура, без космическо подравняване зад думите ви.';

  @override
  String get philosophyMoonBody2 =>
      'Луната променя всичко. Тя дава на практиката ви цикъл — начало, среда, връх и освобождаване. Когато поставяте намерения при новолуние, не просто пишете желания. Вие посявате семена в единствената почва, която движи океани, откакто святът съществува.';

  @override
  String get philosophyMoonBody3 =>
      'Намаляващата луна не е пауза. Тя е най-изискващата фаза от всички. Всеки може да поиска. Всеки може да повтори. Но да освободиш — наистина да пуснеш и да се довериш, че посяното расте в тъмнината — това изисква дисциплината, върху която тази практика е изградена.';

  @override
  String get philosophyFourPhasesHeading => 'Четирите свещени фази';

  @override
  String get philosophyPhasePlanting => 'Посяването';

  @override
  String get philosophyPhasePlantingDesc =>
      'В тъмнината назовавате онова, от което имате нужда — не каквото искате, а каквото душата ви изисква. Новолунието пази пространство за суровата истина.';

  @override
  String get philosophyPhaseTending => 'Отглеждането';

  @override
  String get philosophyPhaseTendingDesc =>
      'Когато светлината се връща, повтаряте намеренията си всеки ден. Не като надежда, а като увереност. Не молите — припомняте си онова, което вече е по пътя.';

  @override
  String get philosophyPhaseGratitude => 'Благодарността';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'При пълно озарение благодарите, сякаш вече държите това, което сте поискали. Това не е престоруване. Това е действието, което свива разстоянието между там, където сте, и там, където отивате.';

  @override
  String get philosophyPhaseRelease => 'Освобождаването';

  @override
  String get philosophyPhaseReleaseDesc =>
      'И тогава — тишина. Пускате. Спирате да натискате, спирате да проверявате, спирате да питате. Намаляващата луна преподава най-трудния урок: че работата ви е свършена, и сега тя принадлежи на нещо по-голямо от вас.';

  @override
  String get philosophyClosing =>
      'Когато луната се върне в тъмнината,\nзапочвате.';

  @override
  String get guideTitle => 'Как да манифестирате';

  @override
  String get guideIntro =>
      'Четири правила. Това е всичко. Овладейте ги и луната ще свърши останалото.';

  @override
  String get guideRule01 => 'ПРАВИЛО 01';

  @override
  String get guideRule01Title => 'Назовете нуждата,\nне желанието';

  @override
  String get guideRule01Body1 =>
      'Повърхностното желание скрива истинското намерение. Всъщност не искате милион долара — искате усещането за сигурност, за свобода, за безгрижие. Манифестирането работи на нивото на усещането, не на материалните обекти.';

  @override
  String get guideRule01Body2 =>
      'Запитайте се: защо искам това? Отговорът е истинското ви намерение.';

  @override
  String get guideRule01Wrong1 => 'Искам милион долара';

  @override
  String get guideRule01Right1 => 'Изживявам финансова свобода';

  @override
  String get guideRule01Wrong2 => 'Искам партньор';

  @override
  String get guideRule01Right2 => 'Обграден/а съм от дълбока, любяща връзка';

  @override
  String get guideRule01Wrong3 => 'Искам повишение';

  @override
  String get guideRule01Right3 => 'Признат/а съм и ценен/а за работата си';

  @override
  String get guideRule02 => 'ПРАВИЛО 02';

  @override
  String get guideRule02Title => 'АЗ СЪМ — Най-силните\nдуми, които ще кажете';

  @override
  String get guideRule02Body1 =>
      'В Библията, когато Мойсей попитал за името на Бог, отговорът бил „АЗ СЪМ КОЙТО СЪМ.“ Всяка традиция, докоснала се до манифестирането — от херметичната философия до Невил Годард до съвременната практика — възприема „АЗ СЪМ“ като декларацията, която оформя реалността.';

  @override
  String get guideRule02Body2 =>
      'Каквото следва „АЗ СЪМ“ става вашата команда към вселената. Избирайте внимателно.';

  @override
  String get guideRule02Tip1 =>
      'Винаги положително — „Аз съм здрав/а“, не „Не съм болен/а“';

  @override
  String get guideRule02Tip2 =>
      'Винаги в сегашно време — „Аз съм“, не „Ще бъда“';

  @override
  String get guideRule02Tip3 =>
      'Винаги с убеденост — изговаряйте го като истина, не като надежда';

  @override
  String get guideRule02Right1 =>
      'Аз съм в изобилие и парите текат към мен лесно';

  @override
  String get guideRule02Right2 => 'Аз съм в мир с това, което ставам';

  @override
  String get guideRule02Right3 => 'Аз съм достоен/а за живота, който създавам';

  @override
  String get guideRule03 => 'ПРАВИЛО 03';

  @override
  String get guideRule03Title => 'Говорете така,\nсякаш вече е станало';

  @override
  String get guideRule03Body1 =>
      'Не е нужно да знаете как ще се случи. Единствената ви задача е да задържите вибрацията — усещането — че вече имате това, което сте декларирали.';

  @override
  String get guideRule03Body2 =>
      'Вселената не отговаря на това, което искате. Отговаря на това, което сте. Не преследвайте. Не търсете знаци. Просто бъдете това.';

  @override
  String get guideRule03Wrong1 => 'Надявам се някога да намеря мир';

  @override
  String get guideRule03Right1 =>
      'Благодарен/а съм за мира, който изпълва живота ми';

  @override
  String get guideRule03Wrong2 => 'Опитвам се да съм по-уверен/а';

  @override
  String get guideRule03Right2 =>
      'Аз съм уверен/а. Доверявам се напълно на себе си.';

  @override
  String get guideRule04 => 'ПРАВИЛО 04';

  @override
  String get guideRule04Title => 'Благодарността е доказателството';

  @override
  String get guideRule04Body1 =>
      'Благодарността не е благодарствено писмо след факта. Тя е сигналът, който изпращате преди да получите — доказателство пред вселената, че се доверявате на процеса.';

  @override
  String get guideRule04Body2 =>
      'Когато благодарите за нещо, което още не сте видели, вие свивате пропастта между желанието и притежанието. Това е церемонията, през която това приложение ви превежда при всяко пълнолуние.';

  @override
  String get guideRule04Right1 =>
      'Толкова съм благодарен/а, че финансовата свобода е моята реалност';

  @override
  String get guideRule04Right2 =>
      'Благодаря за любовта, която ме заобикаля всеки ден';

  @override
  String get guideRule04Right3 =>
      'Благодаря за здравето си, силата си, яснотата си';

  @override
  String get guideClosing =>
      'Това е вашата практика.\nЛуната дава тайминга.\nВие давате истината.';

  @override
  String get lunarCycleTitle => 'Лунният цикъл';

  @override
  String lunarYouAreHere(String phase) {
    return 'Вие сте тук: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'Ден $day от $total';
  }

  @override
  String get lunarNewMoonPlant => 'Новолуние — Посяване';

  @override
  String get lunarNewMoonPlantDesc =>
      'Поставете намеренията си. Назовете онова, от което наистина имате нужда. Оттук започва цикълът.';

  @override
  String get lunarNewMoonDuration => '~1 ден';

  @override
  String get lunarNewMoonStatus => 'Намеренията са отворени';

  @override
  String get lunarWaxingTend => 'Растяща — Отглеждане';

  @override
  String get lunarWaxingTendDesc =>
      'Повтаряйте намеренията си всеки ден. Изграждайте вяра чрез повторение. Луната расте, и убедеността ви също.';

  @override
  String get lunarWaxingDuration => '~14 дни';

  @override
  String get lunarWaxingStatus => 'Ежедневни напомняния';

  @override
  String get lunarFullMoonGiveThanks => 'Пълнолуние — Благодарност';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Изразете благодарност, сякаш вече имате това, което сте поискали. Това е връхът — моментът на получаване.';

  @override
  String get lunarFullMoonDuration => '~1 ден';

  @override
  String get lunarFullMoonStatus => 'Церемония на благодарността';

  @override
  String get lunarWaningRelease => 'Намаляваща — Освобождаване';

  @override
  String get lunarWaningReleaseDesc =>
      'Пуснете напълно. Спрете да натискате, спрете да проверявате. Доверете се, че посяното расте в тъмнината.';

  @override
  String get lunarWaningDuration => '~14 дни';

  @override
  String get lunarWaningStatus => 'Прозорецът е затворен — тишина';

  @override
  String get lunarLegendManifest => 'Манифестиране';

  @override
  String get lunarLegendRelease => 'Освобождаване';

  @override
  String get lunarThisCycle => 'Този цикъл';

  @override
  String get lunarNow => 'СЕГА';

  @override
  String get cycleDiagramNewMoon => 'Новолуние';

  @override
  String get cycleDiagramWaxingCrescent => 'Растящ\nсърп';

  @override
  String get cycleDiagramFirstQuarter => 'Първа\nчетвърт';

  @override
  String get cycleDiagramWaxingGibbous => 'Растяща\nгърбава';

  @override
  String get cycleDiagramFullMoon => 'Пълнолуние';

  @override
  String get cycleDiagramWaningGibbous => 'Намаляваща\nгърбава';

  @override
  String get cycleDiagramLastQuarter => 'Последна\nчетвърт';

  @override
  String get cycleDiagramWaningCrescent => 'Намаляващ\nсърп';

  @override
  String get cycleDiagramManifest => 'МАНИФЕСТИРАНЕ';

  @override
  String get cycleDiagramRelease => 'ОСВОБОЖДАВАНЕ';

  @override
  String get cycleThisCycle => 'Този цикъл';

  @override
  String get cycleSeeFullDetails => 'Виж пълните подробности';

  @override
  String debugLabel(String info) {
    return 'DEBUG: $info';
  }

  @override
  String get debugLive => 'live';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsNotifications => 'Известия';

  @override
  String get settingsReminderFrequency =>
      'Честота на напомнянията (пъти на ден)';

  @override
  String get settingsWakeWindow => 'Буден прозорец';

  @override
  String get settingsWakeWindowStart => 'Начало';

  @override
  String get settingsWakeWindowEnd => 'Край';

  @override
  String get settingsMoonStyle => 'Стил на луната';

  @override
  String get settingsMoonStyleDescription =>
      'Изберете как изглежда луната в приложението';

  @override
  String get settingsMoonStyleClassic => 'Класическа';

  @override
  String get settingsMoonStyleStarfield => 'Звездно поле';

  @override
  String get settingsMoonStyleAura => 'Аура';

  @override
  String get settingsMoonStyleHalo => 'Ореол';

  @override
  String get settingsData => 'Данни';

  @override
  String get settingsExportData => 'Изнасяне на данни';

  @override
  String get settingsImportData => 'Внасяне на данни';

  @override
  String get settingsAbout => 'За приложението';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest е личен ритуален спътник, създаден да ви помогне да съгласите намеренията си с лунния цикъл. При всяко новолуние поставяте до три намерения и прекарвате следващите 28 дни в грижа за тях чрез ежедневна благодарност и размисъл. Данните ви се съхраняват сигурно на устройството ви и никога не се изпращат към сървър. Използвайте функцията за изнасяне, за да създадете криптирано резервно копие, и импортирайте го на ново устройство, за да възстановите практиката си.';

  @override
  String get settingsManifestationGuide => 'Ръководство за манифестиране';

  @override
  String get settingsExportPasswordTitle => 'Задайте парола за изнасяне';

  @override
  String get settingsImportPasswordTitle => 'Въведете парола за внасяне';

  @override
  String get settingsPasswordHint => 'Парола';

  @override
  String settingsExportFailed(String error) {
    return 'Изнасянето не успя: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Файлът не може да бъде прочетен.';

  @override
  String get settingsDataImported => 'Данните са внесени успешно.';

  @override
  String get settingsWrongPassword => 'Грешна парола или повреден файл.';

  @override
  String settingsImportFailed(String error) {
    return 'Внасянето не успя: $error';
  }

  @override
  String get settingsExportSubject => 'Резервно копие на Moon Manifest';

  @override
  String get historyTitle => 'История';

  @override
  String get historyNoCompletedCycles => 'Все още няма завършени цикли';

  @override
  String get historyOngoing => 'Текущ';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count намерения',
      one: '1 намерение',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'Намерения';

  @override
  String get historyGratitudesLabel => 'Благодарности';

  @override
  String get phaseNewMoon => 'Новолуние';

  @override
  String get phaseWaxing => 'Растяща';

  @override
  String get phaseFullMoon => 'Пълнолуние';

  @override
  String get phaseWaning => 'Намаляваща';

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
  String get wisdom1 => 'Това, което търсиш, те търси.';

  @override
  String get wisdom1Author => 'Руми';

  @override
  String get wisdom2 =>
      'Вселената не е извън теб. Погледни в себе си; всичко, което искаш, вече си.';

  @override
  String get wisdom2Author => 'Руми';

  @override
  String get wisdom3 => 'Довери се на чакането. Прегърни неизвестността.';

  @override
  String get wisdom4 =>
      'Не привличаш това, което искаш. Привличаш това, което си.';

  @override
  String get wisdom5 =>
      'Когато пусна това, което съм, ставам това, което мога да бъда.';

  @override
  String get wisdom5Author => 'Лао Цзъ';

  @override
  String get wisdom6 => 'Природата не бърза, но всичко е постигнато.';

  @override
  String get wisdom6Author => 'Лао Цзъ';

  @override
  String get wisdom7 =>
      'Приеми усещането на изпълненото си желание и наблюдавай пътя, който вниманието ти следва.';

  @override
  String get wisdom7Author => 'Невил Годард';

  @override
  String get wisdom8 =>
      'Най-голямата заблуда на човека е убеждението му, че съществуват причини извън собственото му състояние на съзнанието.';

  @override
  String get wisdom8Author => 'Невил Годард';

  @override
  String get wisdom9 =>
      'Винаги си ученик, никога майстор. Трябва да продължаваш напред.';

  @override
  String get wisdom9Author => 'Конрад Хол';

  @override
  String get wisdom10 =>
      'Спри да се държиш така дребно. Ти си вселената в екстатично движение.';

  @override
  String get wisdom10Author => 'Руми';

  @override
  String get wisdom11 => 'Настоящият момент винаги ще е бил. Почивай в това.';

  @override
  String get wisdom12 =>
      'Освобождаването ни дава свобода, а свободата е единственото условие за щастие.';

  @override
  String get wisdom12Author => 'Тич Нят Хан';

  @override
  String get wisdom13 =>
      'Предаването не е отказване. То е отдаване на нещо по-голямо.';

  @override
  String get wisdom14 =>
      'В този момент носиш в себе си всичко необходимо, за да се справиш с всичко, което светът може да ти подхвърли.';

  @override
  String get wisdom14Author => 'Брайън Трейси';

  @override
  String get wisdom15 => 'Колкото по-тих ставаш, толкова повече можеш да чуеш.';

  @override
  String get wisdom15Author => 'Руми';

  @override
  String get wisdom16 =>
      'Твоята задача не е да търсиш любов, а просто да търсиш и намериш всички прегради в себе си, които си изградил срещу нея.';

  @override
  String get wisdom16Author => 'Руми';

  @override
  String get wisdom17 =>
      'Вярата е да направиш първата крачка, дори когато не виждаш цялото стълбище.';

  @override
  String get wisdom17Author => 'Мартин Лутър Кинг Мл.';

  @override
  String get wisdom18 => 'Семето не се бори с почвата. Просто расте.';

  @override
  String get wisdom19 =>
      'Освободи нуждата да знаеш как. Довери се, че вселената знае пътя.';

  @override
  String get wisdom20 =>
      'Започни да се виждаш като душа с тяло, а не като тяло с душа.';

  @override
  String get wisdom20Author => 'Уейн Дайър';

  @override
  String get wisdom21 =>
      'Не можеш винаги да контролираш случващото се отвън. Но винаги можеш да контролираш случващото се вътре.';

  @override
  String get wisdom21Author => 'Уейн Дайър';

  @override
  String get wisdom22 =>
      'Търпението не е пасивно чакане. То е активно доверие.';

  @override
  String get wisdom23 =>
      'Всичко, от което имаш нужда, вече е в теб, чакащо да се разгърне.';

  @override
  String get wisdom24 =>
      'Луната не се бори. Тя наблюдава. И чрез наблюдението държи всичко заедно.';

  @override
  String get wisdom25 =>
      'Действай така, сякаш това, което искаш да манифестираш в живота си, вече е реалност.';

  @override
  String get wisdom25Author => 'Уейн Дайър';

  @override
  String get wisdom26 => 'Бъди тих и знай.';

  @override
  String get wisdom27 => 'Пусни клоните и се довери на реката.';

  @override
  String get wisdom28 => 'Раната е мястото, откъдето светлината навлиза в теб.';

  @override
  String get wisdom28Author => 'Руми';

  @override
  String get wisdom29 =>
      'Корабът в пристанището е в безопасност, но не за това са създадени корабите.';

  @override
  String get wisdom29Author => 'Джон А. Шед';

  @override
  String get wisdom30 =>
      'Вселената винаги ни говори. Изпраща ни малки послания, предизвиква съвпадения и щастливи случайности. Единственият въпрос е: слушаме ли?';

  @override
  String get wisdom30Author => 'Нанси Тейър';
}
