// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Добро пожаловать в\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'Это приложение направляет практику манифестации, связанную с луной.';

  @override
  String get onboardingCycleTitle => 'Цикл';

  @override
  String get onboardingCycleBody =>
      'Каждый лунный месяц проходит через четыре особые фазы, каждая со своей энергией.';

  @override
  String get onboardingWhatYouDoTitle => 'Что вы будете делать';

  @override
  String get onboardingNewMoonDesc =>
      'Задайте намерения и посейте семена новых начинаний.';

  @override
  String get onboardingWaxingDesc =>
      'Действуйте и набирайте силу на пути к своим целям.';

  @override
  String get onboardingFullMoonDesc =>
      'Отпразднуйте победы и отпустите то, что вам больше не служит.';

  @override
  String get onboardingWaningDesc =>
      'Размышляйте, отдыхайте и осмысляйте полученные уроки.';

  @override
  String get onboardingPreferencesTitle => 'Ваши предпочтения';

  @override
  String get onboardingPreferencesSubtitle =>
      'Настройте, как и когда вы получаете напутствия.';

  @override
  String get onboardingNotificationFrequency => 'Частота уведомлений';

  @override
  String get onboardingNotificationFrequencyHint =>
      'Сколько раз в день вы хотите получать напоминания?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / день';
  }

  @override
  String get onboardingWakeWindow => 'Окно бодрствования';

  @override
  String get onboardingWakeWindowHint =>
      'Никаких уведомлений за пределами этих часов.';

  @override
  String get onboardingWakeUp => 'Пробуждение';

  @override
  String get onboardingWindDown => 'Отход ко сну';

  @override
  String get onboardingButtonContinue => 'Продолжить';

  @override
  String get onboardingButtonBegin => 'Начать';

  @override
  String get waitingWindowNotOpen => 'Окно манифестации ещё не открыто';

  @override
  String waitingFirstCycle(String date) {
    return 'Ваш первый цикл начнётся в новолуние $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'через $count дней',
      many: 'через $count дней',
      few: 'через $count дня',
      one: 'через день',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Подготовьтесь, пока ждёте';

  @override
  String get waitingLearnManifest => 'Узнайте, как манифестировать';

  @override
  String get waitingLearnManifestSubtitle =>
      '4 правила, которые делают эту практику действенной';

  @override
  String get waitingUnderstandCycle => 'Изучите лунный цикл';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Узнайте, где вы находитесь и что означает каждая фаза';

  @override
  String get waitingDraftIntentionsTitle => 'Набросайте свои намерения';

  @override
  String get waitingDraftIntentionsBody =>
      'Используйте это пространство для размышлений и подготовки. Что вы хотите призвать в свою жизнь?';

  @override
  String waitingIntentionHint(int number) {
    return 'Намерение $number…';
  }

  @override
  String get waitingAddIntention => 'Добавить намерение';

  @override
  String get waitingMaxIntentionsMessage =>
      'Семь намерений — значимое число. Тщательно выбирайте то, что важнее всего.';

  @override
  String get waitingDraftSaved => 'Черновик сохранён';

  @override
  String get commonSomethingWentWrong => 'Что-то пошло не так.';

  @override
  String get newMoonSetIntentions => 'Новолуние.\nЗадайте свои намерения.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Льготный период заканчивается $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Спросите себя: что мне действительно нужно за моими желаниями? Задавайте намерения, которые говорят о ваших глубинных потребностях — рост, связь, покой, изобилие.';

  @override
  String get newMoonHowToWrite => 'Как писать сильные намерения';

  @override
  String get newMoonYourIntentions => 'Ваши намерения';

  @override
  String newMoonIntentionHint(int number) {
    return 'Намерение $number…';
  }

  @override
  String get newMoonAddIntention => 'Добавить намерение';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Семь намерений — значимое число. Тщательно выбирайте то, что важнее всего.';

  @override
  String get newMoonPlantIntentions => 'Посеять эти намерения';

  @override
  String get newMoonLockedTitle => 'Это ваши намерения на этот цикл.';

  @override
  String get newMoonLockedSubtitleEditing =>
      'Отредактируйте свои намерения ниже.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'Они были посеяны. Доверьтесь процессу.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Намерение $number...';
  }

  @override
  String get newMoonEditIntentions => 'Редактировать намерения';

  @override
  String get newMoonEditUntilWaxing =>
      'Вы можете редактировать до начала фазы роста.';

  @override
  String get newMoonSaveChanges => 'Сохранить изменения';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonOk => 'ОК';

  @override
  String waxingDayOfWaxing(int day) {
    return 'День $day фазы роста.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Полнолуние завтра.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Полнолуние через $count дней.';
  }

  @override
  String get waxingYourIntentions => 'Ваши намерения';

  @override
  String get waxingUnableToLoad => 'Не удалось загрузить намерения.';

  @override
  String get waxingNoIntentionsFound => 'Намерения для этого цикла не найдены.';

  @override
  String get fullMoonNoIntentionsSet => 'В этом цикле не было задано намерений';

  @override
  String get fullMoonWorkDone => 'Работа завершена.';

  @override
  String get fullMoonNowRelease => 'Теперь отпустите.';

  @override
  String fullMoonWaningNext(String date) {
    return 'Фаза убывания начнётся скоро.\nВаш следующий цикл начнётся в новолуние $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Полнолуние. Благодарите.';

  @override
  String get fullMoonGracePeriodActive => 'Льготный период активен';

  @override
  String get fullMoonThankUniverse =>
      'Благодарите вселенную так, словно вы уже получили то, о чём просили';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current из $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Я так благодарен/благодарна за то, что…';

  @override
  String get fullMoonCompleteCeremony => 'Завершить церемонию';

  @override
  String get fullMoonNextIntention => 'Следующее намерение';

  @override
  String get waningWindowClosed => 'Окно манифестации закрыто';

  @override
  String waningOpensAgain(int count) {
    return 'Откроется снова через $count дней в новолуние';
  }

  @override
  String get waningReleaseTrust => 'Отпустите. Доверьтесь.';

  @override
  String get waningWorkDone => 'Работа завершена.';

  @override
  String get waningNextNewMoon => 'Следующее новолуние';

  @override
  String get waningWhyQuiet => 'Почему тишина?';

  @override
  String get philosophyTitle => 'Почему окно\nсейчас закрыто?';

  @override
  String get philosophyBody1 =>
      'Манифестация работает не по вашему расписанию — она работает по расписанию луны. Лунный цикл имеет определённые окна, когда задавать намерения особенно сильно, и периоды, когда самое сильное, что вы можете сделать — это ничего не делать.';

  @override
  String get philosophyBody2 =>
      'Сейчас луна убывает — уменьшается к темноте. Это фаза отпускания. Ваши намерения этого цикла были посеяны, взращены и принесены с благодарностью. Теперь им нужно пространство, чтобы укорениться. Давить сильнее в эту фазу не поможет. Это помешает.';

  @override
  String get philosophyBody3 =>
      'Когда наступит новолуние, окно откроется вновь. Тогда вы зададите свежие намерения и начнёте новый цикл. Ожидание — не потраченное впустую время, оно часть практики. Дисциплина отпускания — вот что отличает манифестацию от простого загадывания желаний.';

  @override
  String get philosophyDaysUntilOpen => 'дней до открытия окна';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Напоминание установлено на $date';
  }

  @override
  String get philosophyRemindMe => 'Напомнить, когда откроется';

  @override
  String get philosophyCouldNotSchedule =>
      'Не удалось запланировать напоминание';

  @override
  String get philosophyNotificationTitle => 'Окно манифестации открыто.';

  @override
  String get philosophyNotificationBody => 'Задайте свои намерения сейчас.';

  @override
  String get philosophyHookTitle => 'Что они знают,\nа вы — нет';

  @override
  String get philosophyHookBody1 =>
      'Самые успешные люди на земле не просто ставят цели. Они работают со временем. Они понимают то, что большинство людей никогда не поймёт: у вселенной есть ритм, и те, кто настроен на него, не гонятся за результатами — результаты гонятся за ними.';

  @override
  String get philosophyHookBody2 =>
      'Это не секрет. Это древнее знание — практикуемое тысячи лет теми, кто строил империи, создавал династии и тихо двигал мир. Луна была их часами. «Я ЕСМЬ» было их языком. А преданность делу была их ценой.';

  @override
  String get philosophyHookBody3 =>
      'Вот что они понимали: манифестация проста. Не легка — проста. Вы заявляете, кем становитесь. Вы повторяете это, пока ваш разум не поверит. Вы благодарите до того, как увидите доказательства. А затем отпускаете. Полностью.';

  @override
  String get philosophyHookBody4 =>
      'Большинство людей терпят неудачу, потому что не готовы посвятить себя процессу. Они хотят результат без дисциплины. Они манифестируют один день, ищут знаки, и бросают, когда ко вторнику ничего не произошло. Это не манифестация. Это загадывание желаний.';

  @override
  String get philosophyMoonHeading => 'Луна — недостающий элемент';

  @override
  String get philosophyMoonBody1 =>
      'Вы, вероятно, уже пробовали аффирмации. Вы, вероятно, говорили «Я изобилен» перед зеркалом и не чувствовали никаких перемен. Потому что вы говорили в пустоту — без времени, без структуры, без космического выравнивания за вашими словами.';

  @override
  String get philosophyMoonBody2 =>
      'Луна всё меняет. Она придаёт вашей практике цикл — начало, середину, пик и отпускание. Когда вы задаёте намерения в новолуние, вы не просто записываете желания. Вы сажаете семена в единственную почву, которая двигала океаны ещё до появления людей.';

  @override
  String get philosophyMoonBody3 =>
      'Убывающая луна — не пауза. Это самая требовательная фаза из всех. Любой может попросить. Любой может повторять. Но отпустить — по-настоящему отпустить и довериться тому, что посаженное растёт в темноте — для этого нужна дисциплина, на которой построена эта практика.';

  @override
  String get philosophyFourPhasesHeading => 'Четыре священные фазы';

  @override
  String get philosophyPhasePlanting => 'Посев';

  @override
  String get philosophyPhasePlantingDesc =>
      'В темноте вы называете то, что вам нужно — не то, чего хотите, а то, что требует ваша душа. Новолуние хранит пространство для неприкрытой правды.';

  @override
  String get philosophyPhaseTending => 'Взращивание';

  @override
  String get philosophyPhaseTendingDesc =>
      'Когда свет возвращается, вы повторяете свои намерения ежедневно. Не как надежду, а как уверенность. Вы не просите — вы вспоминаете то, что уже в пути.';

  @override
  String get philosophyPhaseGratitude => 'Благодарность';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'В полном сиянии вы благодарите так, словно уже держите в руках то, о чём просили. Это не притворство. Это действие, которое стирает расстояние между тем, где вы есть, и тем, куда вы идёте.';

  @override
  String get philosophyPhaseRelease => 'Отпускание';

  @override
  String get philosophyPhaseReleaseDesc =>
      'А затем — тишина. Вы отпускаете. Перестаёте давить, перестаёте проверять, перестаёте просить. Убывающая луна преподаёт самый трудный урок: ваша работа завершена, и теперь она принадлежит чему-то большему, чем вы.';

  @override
  String get philosophyClosing =>
      'Когда луна возвращается во тьму,\nвы начинаете.';

  @override
  String get guideTitle => 'Как манифестировать';

  @override
  String get guideIntro =>
      'Четыре правила. Вот и всё. Освойте их, и луна сделает остальное.';

  @override
  String get guideRule01 => 'ПРАВИЛО 01';

  @override
  String get guideRule01Title => 'Назовите потребность,\nа не желание';

  @override
  String get guideRule01Body1 =>
      'Поверхностное желание скрывает настоящее намерение. На самом деле вам нужен не миллион долларов — вам нужно чувство безопасности, свободы, отсутствия тревог. Манифестация работает на уровне чувств, а не материальных вещей.';

  @override
  String get guideRule01Body2 =>
      'Спросите себя: почему я этого хочу? Ответ — ваше настоящее намерение.';

  @override
  String get guideRule01Wrong1 => 'Я хочу миллион долларов';

  @override
  String get guideRule01Right1 => 'Я переживаю финансовую свободу';

  @override
  String get guideRule01Wrong2 => 'Я хочу партнёра';

  @override
  String get guideRule01Right2 => 'Меня окружает глубокая, любящая связь';

  @override
  String get guideRule01Wrong3 => 'Я хочу повышение';

  @override
  String get guideRule01Right3 => 'Меня ценят и признают за мою работу';

  @override
  String get guideRule02 => 'ПРАВИЛО 02';

  @override
  String get guideRule02Title =>
      'Я ЕСМЬ — самые сильные\nслова, которые вы произнесёте';

  @override
  String get guideRule02Body1 =>
      'В Библии, когда Моисей спросил имя Бога, ответ был «Я ЕСМЬ СУЩИЙ». Каждая традиция, которая касалась манифестации — от герметической философии до Невилла Годдарда и современных практик — относится к «Я ЕСМЬ» как к декларации, формирующей реальность.';

  @override
  String get guideRule02Body2 =>
      'Всё, что следует за «Я ЕСМЬ», становится вашей командой вселенной. Выбирайте тщательно.';

  @override
  String get guideRule02Tip1 =>
      'Всегда позитивно — «Я здоров», а не «Я не болен»';

  @override
  String get guideRule02Tip2 =>
      'Всегда в настоящем времени — «Я есмь», а не «Я буду»';

  @override
  String get guideRule02Tip3 =>
      'Всегда с убеждённостью — говорите как истину, а не как надежду';

  @override
  String get guideRule02Right1 => 'Я изобилен, и деньги приходят ко мне легко';

  @override
  String get guideRule02Right2 => 'Я в мире с тем, кем я становлюсь';

  @override
  String get guideRule02Right3 => 'Я достоин жизни, которую создаю';

  @override
  String get guideRule03 => 'ПРАВИЛО 03';

  @override
  String get guideRule03Title => 'Говорите так, словно\nэто уже свершилось';

  @override
  String get guideRule03Body1 =>
      'Вам не нужно знать, как это произойдёт. Ваша единственная задача — удерживать вибрацию — ощущение — того, что вы уже имеете заявленное.';

  @override
  String get guideRule03Body2 =>
      'Вселенная отвечает не на то, чего вы хотите. Она отвечает на то, кем вы являетесь. Не гонитесь. Не проверяйте знаки. Просто будьте этим.';

  @override
  String get guideRule03Wrong1 => 'Я надеюсь когда-нибудь обрести покой';

  @override
  String get guideRule03Right1 =>
      'Я благодарен за покой, наполняющий мою жизнь';

  @override
  String get guideRule03Wrong2 => 'Я стараюсь быть увереннее';

  @override
  String get guideRule03Right2 => 'Я уверен. Я полностью доверяю себе.';

  @override
  String get guideRule04 => 'ПРАВИЛО 04';

  @override
  String get guideRule04Title => 'Благодарность — это доказательство';

  @override
  String get guideRule04Body1 =>
      'Благодарность — не записка с благодарностью постфактум. Это сигнал, который вы посылаете до получения — доказательство для вселенной, что вы доверяете процессу.';

  @override
  String get guideRule04Body2 =>
      'Когда вы благодарите за то, чего ещё не видели, вы стираете разрыв между желанием и обладанием. Это церемония, через которую это приложение ведёт вас в каждое полнолуние.';

  @override
  String get guideRule04Right1 =>
      'Я так благодарен, что финансовая свобода — моя реальность';

  @override
  String get guideRule04Right2 =>
      'Благодарю за любовь, которая окружает меня каждый день';

  @override
  String get guideRule04Right3 =>
      'Я благодарю за своё здоровье, свою силу, свою ясность';

  @override
  String get guideClosing =>
      'Это ваша практика.\nЛуна задаёт ритм.\nВы даёте правду.';

  @override
  String get lunarCycleTitle => 'Лунный цикл';

  @override
  String lunarYouAreHere(String phase) {
    return 'Вы здесь: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'День $day из $total';
  }

  @override
  String get lunarNewMoonPlant => 'Новолуние — Посев';

  @override
  String get lunarNewMoonPlantDesc =>
      'Задайте намерения. Назовите то, что вам действительно нужно. Здесь начинается цикл.';

  @override
  String get lunarNewMoonDuration => '~1 день';

  @override
  String get lunarNewMoonStatus => 'Намерения открыты';

  @override
  String get lunarWaxingTend => 'Растущая луна — Взращивание';

  @override
  String get lunarWaxingTendDesc =>
      'Повторяйте свои намерения ежедневно. Укрепляйте веру через повторение. Луна растёт, и ваша убеждённость тоже.';

  @override
  String get lunarWaxingDuration => '~14 дней';

  @override
  String get lunarWaxingStatus => 'Ежедневные напоминания активны';

  @override
  String get lunarFullMoonGiveThanks => 'Полнолуние — Благодарность';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Выразите благодарность так, словно уже получили то, о чём просили. Это пик — момент получения.';

  @override
  String get lunarFullMoonDuration => '~1 день';

  @override
  String get lunarFullMoonStatus => 'Церемония благодарности';

  @override
  String get lunarWaningRelease => 'Убывающая луна — Отпускание';

  @override
  String get lunarWaningReleaseDesc =>
      'Отпустите полностью. Перестаньте давить, перестаньте проверять. Доверьтесь тому, что посаженное растёт в темноте.';

  @override
  String get lunarWaningDuration => '~14 дней';

  @override
  String get lunarWaningStatus => 'Окно закрыто — тишина';

  @override
  String get lunarLegendManifest => 'Манифестация';

  @override
  String get lunarLegendRelease => 'Отпускание';

  @override
  String get lunarThisCycle => 'Этот цикл';

  @override
  String get lunarNow => 'СЕЙЧАС';

  @override
  String get cycleDiagramNewMoon => 'Новолуние';

  @override
  String get cycleDiagramWaxingCrescent => 'Растущий\nсерп';

  @override
  String get cycleDiagramFirstQuarter => 'Первая\nчетверть';

  @override
  String get cycleDiagramWaxingGibbous => 'Растущая\nлуна';

  @override
  String get cycleDiagramFullMoon => 'Полнолуние';

  @override
  String get cycleDiagramWaningGibbous => 'Убывающая\nлуна';

  @override
  String get cycleDiagramLastQuarter => 'Последняя\nчетверть';

  @override
  String get cycleDiagramWaningCrescent => 'Убывающий\nсерп';

  @override
  String get cycleDiagramManifest => 'МАНИФЕСТАЦИЯ';

  @override
  String get cycleDiagramRelease => 'ОТПУСКАНИЕ';

  @override
  String get cycleThisCycle => 'Этот цикл';

  @override
  String get cycleSeeFullDetails => 'Подробности цикла';

  @override
  String debugLabel(String info) {
    return 'ОТЛАДКА: $info';
  }

  @override
  String get debugLive => 'в реальном времени';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsNotifications => 'Уведомления';

  @override
  String get settingsReminderFrequency => 'Частота напоминаний (раз в день)';

  @override
  String get settingsWakeWindow => 'Окно бодрствования';

  @override
  String get settingsWakeWindowStart => 'Начало';

  @override
  String get settingsWakeWindowEnd => 'Конец';

  @override
  String get settingsMoonStyle => 'Стиль луны';

  @override
  String get settingsMoonStyleDescription =>
      'Выберите, как луна выглядит в приложении';

  @override
  String get settingsMoonStyleClassic => 'Классика';

  @override
  String get settingsMoonStyleStarfield => 'Звёздное поле';

  @override
  String get settingsMoonStyleAura => 'Аура';

  @override
  String get settingsMoonStyleHalo => 'Сияние';

  @override
  String get settingsData => 'Данные';

  @override
  String get settingsExportData => 'Экспорт данных';

  @override
  String get settingsImportData => 'Импорт данных';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest — это личный ритуальный спутник, созданный чтобы помочь вам согласовать свои намерения с лунным циклом. Каждое новолуние вы задаёте до трёх намерений и проводите следующие 28 дней, взращивая их через ежедневную благодарность и размышления. Ваши данные надёжно хранятся на вашем устройстве и никогда не отправляются на сервер. Используйте функцию экспорта для создания зашифрованной резервной копии и импортируйте её на новом устройстве для восстановления вашей практики.';

  @override
  String get settingsManifestationGuide => 'Руководство по манифестации';

  @override
  String get settingsExportPasswordTitle => 'Задайте пароль для экспорта';

  @override
  String get settingsImportPasswordTitle => 'Введите пароль для импорта';

  @override
  String get settingsPasswordHint => 'Пароль';

  @override
  String settingsExportFailed(String error) {
    return 'Ошибка экспорта: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Не удалось прочитать файл.';

  @override
  String get settingsDataImported => 'Данные успешно импортированы.';

  @override
  String get settingsWrongPassword => 'Неверный пароль или повреждённый файл.';

  @override
  String settingsImportFailed(String error) {
    return 'Ошибка импорта: $error';
  }

  @override
  String get settingsExportSubject => 'Резервная копия Moon Manifest';

  @override
  String get historyTitle => 'История';

  @override
  String get historyNoCompletedCycles => 'Завершённых циклов пока нет';

  @override
  String get historyOngoing => 'Текущий';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count намерений',
      many: '$count намерений',
      few: '$count намерения',
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
  String get phaseWaxing => 'Растущая луна';

  @override
  String get phaseFullMoon => 'Полнолуние';

  @override
  String get phaseWaning => 'Убывающая луна';

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
  String get wisdom1 => 'То, что ты ищешь, тоже ищет тебя.';

  @override
  String get wisdom1Author => 'Руми';

  @override
  String get wisdom2 =>
      'Вселенная не вне тебя. Загляни внутрь себя; всё, чего ты хочешь, ты уже есть.';

  @override
  String get wisdom2Author => 'Руми';

  @override
  String get wisdom3 => 'Доверься ожиданию. Прими неизвестность.';

  @override
  String get wisdom4 =>
      'Ты не притягиваешь то, чего хочешь. Ты притягиваешь то, чем являешься.';

  @override
  String get wisdom5 =>
      'Когда я отпускаю то, что я есть, я становлюсь тем, чем могу быть.';

  @override
  String get wisdom5Author => 'Лао-цзы';

  @override
  String get wisdom6 => 'Природа не торопится, но всё успевает.';

  @override
  String get wisdom6Author => 'Лао-цзы';

  @override
  String get wisdom7 =>
      'Примите ощущение исполненного желания и наблюдайте путь, по которому следует ваше внимание.';

  @override
  String get wisdom7Author => 'Невилл Годдард';

  @override
  String get wisdom8 =>
      'Главное заблуждение человека — его убеждённость в том, что существуют причины, помимо его собственного состояния сознания.';

  @override
  String get wisdom8Author => 'Невилл Годдард';

  @override
  String get wisdom9 =>
      'Ты всегда ученик, а не мастер. Нужно продолжать двигаться вперёд.';

  @override
  String get wisdom9Author => 'Конрад Холл';

  @override
  String get wisdom10 =>
      'Перестань умаляться. Ты — вселенная в восторженном движении.';

  @override
  String get wisdom10Author => 'Руми';

  @override
  String get wisdom11 => 'Настоящий момент пребудет всегда. Покойся в этом.';

  @override
  String get wisdom12 =>
      'Отпускание даёт нам свободу, а свобода — единственное условие счастья.';

  @override
  String get wisdom12Author => 'Тит Нат Хан';

  @override
  String get wisdom13 =>
      'Смирение — это не отказ. Это передача себя чему-то большему.';

  @override
  String get wisdom14 =>
      'Прямо сейчас в тебе есть всё необходимое, чтобы справиться с чем угодно, что жизнь преподнесёт.';

  @override
  String get wisdom14Author => 'Брайан Трейси';

  @override
  String get wisdom15 => 'Чем тише ты становишься, тем больше можешь услышать.';

  @override
  String get wisdom15Author => 'Руми';

  @override
  String get wisdom16 =>
      'Твоя задача — не искать любовь, а лишь найти и разрушить все преграды внутри себя, которые ты воздвиг против неё.';

  @override
  String get wisdom16Author => 'Руми';

  @override
  String get wisdom17 =>
      'Вера — это первый шаг, даже когда не видишь всю лестницу.';

  @override
  String get wisdom17Author => 'Мартин Лютер Кинг мл.';

  @override
  String get wisdom18 => 'Семя не борется с почвой. Оно просто растёт.';

  @override
  String get wisdom19 =>
      'Отпустите потребность знать как. Доверьтесь тому, что вселенная знает путь.';

  @override
  String get wisdom20 =>
      'Начните видеть себя как душу с телом, а не тело с душой.';

  @override
  String get wisdom20Author => 'Уэйн Дайер';

  @override
  String get wisdom21 =>
      'Вы не всегда можете контролировать то, что происходит снаружи. Но вы всегда можете контролировать то, что происходит внутри.';

  @override
  String get wisdom21Author => 'Уэйн Дайер';

  @override
  String get wisdom22 =>
      'Терпение — это не пассивное ожидание. Это активное доверие.';

  @override
  String get wisdom23 =>
      'Всё, что вам нужно, уже внутри вас, ожидая раскрытия.';

  @override
  String get wisdom24 =>
      'Луна не борется. Она наблюдает. И, наблюдая, она удерживает всё воедино.';

  @override
  String get wisdom25 =>
      'Действуйте так, словно то, что вы намерены проявить в жизни, уже является реальностью.';

  @override
  String get wisdom25Author => 'Уэйн Дайер';

  @override
  String get wisdom26 => 'Замри и знай.';

  @override
  String get wisdom27 => 'Отпусти ветви и доверься реке.';

  @override
  String get wisdom28 =>
      'Рана — это место, через которое в тебя проникает свет.';

  @override
  String get wisdom28Author => 'Руми';

  @override
  String get wisdom29 =>
      'Корабль в гавани в безопасности, но не для этого строят корабли.';

  @override
  String get wisdom29Author => 'Джон А. Шедд';

  @override
  String get wisdom30 =>
      'Вселенная всегда говорит с нами. Посылает маленькие послания, создаёт совпадения и случайные встречи. Единственный вопрос: слушаем ли мы?';

  @override
  String get wisdom30Author => 'Нэнси Тайер';
}
