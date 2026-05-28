// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get onboardingWelcomeTitle => '欢迎来到\nMoon Manifest';

  @override
  String get onboardingWelcomeBody => '这款应用将引导你进行与月亮周期相连的显化练习。';

  @override
  String get onboardingCycleTitle => '月亮周期';

  @override
  String get onboardingCycleBody => '每个阴历月经历四个不同的阶段，每个阶段都有其独特的能量。';

  @override
  String get onboardingWhatYouDoTitle => '你将做什么';

  @override
  String get onboardingNewMoonDesc => '设定意图，为新的开始播下种子。';

  @override
  String get onboardingWaxingDesc => '采取行动，积蓄通向目标的力量。';

  @override
  String get onboardingFullMoonDesc => '庆祝收获，释放不再服务于你的事物。';

  @override
  String get onboardingWaningDesc => '反思、休息，整合所学到的经验。';

  @override
  String get onboardingPreferencesTitle => '你的偏好';

  @override
  String get onboardingPreferencesSubtitle => '自定义接收引导的方式和时间。';

  @override
  String get onboardingNotificationFrequency => '通知频率';

  @override
  String get onboardingNotificationFrequencyHint => '你希望每天收到多少次提醒？';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count 次/天';
  }

  @override
  String get onboardingWakeWindow => '清醒时段';

  @override
  String get onboardingWakeWindowHint => '在此时段之外不会发送通知。';

  @override
  String get onboardingWakeUp => '起床时间';

  @override
  String get onboardingWindDown => '休息时间';

  @override
  String get onboardingButtonContinue => '继续';

  @override
  String get onboardingButtonBegin => '开始';

  @override
  String get waitingWindowNotOpen => '显化之窗尚未开启';

  @override
  String waitingFirstCycle(String date) {
    return '你的第一个周期将在$date的新月开始。';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count天后',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => '在等待中做好准备';

  @override
  String get waitingLearnManifest => '学习如何显化';

  @override
  String get waitingLearnManifestSubtitle => '让这个练习生效的四条法则';

  @override
  String get waitingUnderstandCycle => '了解月亮周期';

  @override
  String get waitingUnderstandCycleSubtitle => '查看你所处的位置以及每个阶段的含义';

  @override
  String get waitingDraftIntentionsTitle => '草拟你的意图';

  @override
  String get waitingDraftIntentionsBody => '利用这个空间进行反思和准备。你希望召唤什么？';

  @override
  String waitingIntentionHint(int number) {
    return '意图 $number…';
  }

  @override
  String get waitingAddIntention => '添加意图';

  @override
  String get waitingMaxIntentionsMessage => '七个意图是一个有深意的数字。请慎重选择最重要的事。';

  @override
  String get waitingDraftSaved => '草稿已保存';

  @override
  String get commonSomethingWentWrong => '出了点问题。';

  @override
  String get newMoonSetIntentions => '新月。\n设定你的意图。';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return '宽限期截止于$deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      '问问自己：在我的渴望之下，我真正需要的是什么？设定触及内在需求的意图——成长、连接、平静、丰盛。';

  @override
  String get newMoonHowToWrite => '如何写出有力的意图';

  @override
  String get newMoonYourIntentions => '你的意图';

  @override
  String newMoonIntentionHint(int number) {
    return '意图 $number…';
  }

  @override
  String get newMoonAddIntention => '添加意图';

  @override
  String get newMoonMaxIntentionsMessage => '七个意图是一个有深意的数字。请慎重选择最重要的事。';

  @override
  String get newMoonPlantIntentions => '播种这些意图';

  @override
  String get newMoonLockedTitle => '这些是你本周期的意图。';

  @override
  String get newMoonLockedSubtitleEditing => '在下方编辑你的意图。';

  @override
  String get newMoonLockedSubtitlePlanted => '它们已经播种。相信这个过程。';

  @override
  String newMoonEditIntentionHint(int number) {
    return '意图 $number...';
  }

  @override
  String get newMoonEditIntentions => '编辑意图';

  @override
  String get newMoonEditUntilWaxing => '你可以在上弦月阶段开始前编辑。';

  @override
  String get newMoonSaveChanges => '保存更改';

  @override
  String get commonCancel => '取消';

  @override
  String get commonOk => '确定';

  @override
  String waxingDayOfWaxing(int day) {
    return '上弦月第$day天。';
  }

  @override
  String get waxingFullMoonTomorrow => '明天满月。';

  @override
  String waxingFullMoonInDays(int count) {
    return '距满月还有$count天。';
  }

  @override
  String get waxingYourIntentions => '你的意图';

  @override
  String get waxingUnableToLoad => '无法加载意图。';

  @override
  String get waxingNoIntentionsFound => '本周期未找到意图。';

  @override
  String get fullMoonNoIntentionsSet => '本周期未设定意图';

  @override
  String get fullMoonWorkDone => '功课已成。';

  @override
  String get fullMoonNowRelease => '现在，放手。';

  @override
  String fullMoonWaningNext(String date) {
    return '下弦月阶段即将开始。\n你的下一个周期将在$date的新月开始。';
  }

  @override
  String get fullMoonGiveThanks => '满月。感恩。';

  @override
  String get fullMoonGracePeriodActive => '宽限期生效中';

  @override
  String get fullMoonThankUniverse => '感谢宇宙，如同你已经拥有了所求之物';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get fullMoonGratitudeHint => '我非常感恩……';

  @override
  String get fullMoonCompleteCeremony => '完成仪式';

  @override
  String get fullMoonNextIntention => '下一个意图';

  @override
  String get waningWindowClosed => '显化之窗已关闭';

  @override
  String waningOpensAgain(int count) {
    return '将在$count天后的新月重新开启';
  }

  @override
  String get waningReleaseTrust => '放下。信任。';

  @override
  String get waningWorkDone => '功课已成。';

  @override
  String get waningNextNewMoon => '下次新月';

  @override
  String get waningWhyQuiet => '为什么这么安静？';

  @override
  String get philosophyTitle => '为什么现在\n窗口关闭了？';

  @override
  String get philosophyBody1 =>
      '显化不按你的时间表运作——它遵循月亮的节奏。月亮周期中有特定的窗口适合设定意图，也有些时段最有力的做法就是静待。';

  @override
  String get philosophyBody2 =>
      '此刻，月亮正在亏缺——趋向黑暗。这是释放的阶段。你本周期的意图已经播种、培育，并以感恩之心呈上。现在它们需要空间来扎根。在这个阶段加倍努力不但无益，反而会干扰。';

  @override
  String get philosophyBody3 =>
      '当新月到来时，窗口再次开启。那时你将设定全新的意图，开始新的周期。等待不是浪费时间——它是修行的一部分。放下的自律，才是显化与空想的分界线。';

  @override
  String get philosophyDaysUntilOpen => '天后窗口开启';

  @override
  String philosophyReminderSetFor(String date) {
    return '已为$date设置提醒';
  }

  @override
  String get philosophyRemindMe => '窗口开启时提醒我';

  @override
  String get philosophyCouldNotSchedule => '无法设置提醒';

  @override
  String get philosophyNotificationTitle => '显化之窗已开启。';

  @override
  String get philosophyNotificationBody => '现在就设定你的意图。';

  @override
  String get philosophyHookTitle => '他们知道而你\n不知道的事';

  @override
  String get philosophyHookBody1 =>
      '地球上最成功的人不只是设定目标。他们懂得把握时机。他们理解大多数人永远不会明白的道理：宇宙有其节奏，与之同频的人不追逐结果——结果追逐他们。';

  @override
  String get philosophyHookBody2 =>
      '这不是什么秘密。这是古老的智慧——数千年来，那些塑造帝国、建立王朝、悄然改变世界的人一直在实践。月亮是他们的时钟。「我是」是他们的语言。而承诺是他们的代价。';

  @override
  String get philosophyHookBody3 =>
      '这就是他们所领悟的：显化很简单。不是容易——是简单。你宣告你正在成为什么。你反复宣告直到你的心智相信。你在看到证据之前就感恩。然后你放手。彻底地。';

  @override
  String get philosophyHookBody4 =>
      '大多数人失败是因为他们不愿投入于这个过程。他们想要结果却不要自律。他们显化一天，就开始寻找征兆，到了周二什么都没发生就放弃了。那不是显化。那是空想。';

  @override
  String get philosophyMoonHeading => '月亮是缺失的那块拼图';

  @override
  String get philosophyMoonBody1 =>
      '你可能以前试过肯定语。你可能对着镜子说过「我是富足的」，然后什么也没改变。那是因为你在对着死寂的空气说话——没有时机、没有结构、没有宇宙的力量在背后支撑你的话语。';

  @override
  String get philosophyMoonBody2 =>
      '月亮改变了一切。它给你的练习带来了周期——开始、中间、高峰和释放。当你在新月时设定意图，你不仅仅是在写下愿望。你是在唯一自人类出现之前就在推动潮汐的土壤中播种。';

  @override
  String get philosophyMoonBody3 =>
      '下弦月不是暂停。它是所有阶段中最考验人的阶段。任何人都能祈求。任何人都能重复。但真正放手——完全信任你所播种的正在黑暗中生长——这需要这个修行所赖以建立的自律。';

  @override
  String get philosophyFourPhasesHeading => '四个神圣阶段';

  @override
  String get philosophyPhasePlanting => '播种';

  @override
  String get philosophyPhasePlantingDesc =>
      '在黑暗中，你说出你真正需要的——不是你想要的，而是你灵魂所渴求的。新月为至诚之言留出空间。';

  @override
  String get philosophyPhaseTending => '培育';

  @override
  String get philosophyPhaseTendingDesc =>
      '随着月光回归，你每天重复你的意图。不是作为希望，而是作为确信。你不是在祈求——你是在忆起已在途中之物。';

  @override
  String get philosophyPhaseGratitude => '感恩';

  @override
  String get philosophyPhaseGratitudeDesc =>
      '在满月的光辉中，你如同已经拥有所求之物般感恩。这不是假装。这是消弭你所在与你所往之间距离的行为。';

  @override
  String get philosophyPhaseRelease => '释放';

  @override
  String get philosophyPhaseReleaseDesc =>
      '然后——静默。你放手。你不再推动，不再查看，不再追问。下弦月教给我们最难的一课：你的功课已经完成，现在它属于比你更大的存在。';

  @override
  String get philosophyClosing => '当月亮回归黑暗，\n你重新开始。';

  @override
  String get guideTitle => '如何显化';

  @override
  String get guideIntro => '四条法则。就这些。掌握它们，月亮会完成剩下的。';

  @override
  String get guideRule01 => '法则一';

  @override
  String get guideRule01Title => '说出需要，\n而非想要';

  @override
  String get guideRule01Body1 =>
      '表面的欲望掩盖了真正的意图。你并非真的想要一百万——你想要的是安全感、自由感、不再担忧的感觉。显化作用于感受层面，而非物质层面。';

  @override
  String get guideRule01Body2 => '问问自己：我为什么想要这个？答案才是你真正的意图。';

  @override
  String get guideRule01Wrong1 => '我想要一百万';

  @override
  String get guideRule01Right1 => '我正在体验财务自由';

  @override
  String get guideRule01Wrong2 => '我想要一个伴侣';

  @override
  String get guideRule01Right2 => '我被深厚的爱与连接所围绕';

  @override
  String get guideRule01Wrong3 => '我想要升职';

  @override
  String get guideRule01Right3 => '我的价值和工作得到了认可';

  @override
  String get guideRule02 => '法则二';

  @override
  String get guideRule02Title => '「我是」——你将说出的\n最有力量的话';

  @override
  String get guideRule02Body1 =>
      '在《圣经》中，当摩西问上帝的名字时，回答是「我是自有永有的」。每一个涉及显化的传统——从赫尔墨斯哲学到内维尔·戈达德再到现代修行——都将「我是」视为塑造现实的宣言。';

  @override
  String get guideRule02Body2 => '「我是」之后的任何话语都将成为你向宇宙发出的指令。请慎重选择。';

  @override
  String get guideRule02Tip1 => '始终用肯定句——「我很健康」而不是「我不生病」';

  @override
  String get guideRule02Tip2 => '始终用现在时——「我是」而不是「我将会」';

  @override
  String get guideRule02Tip3 => '始终带着信念——以真理而非希望的方式说出';

  @override
  String get guideRule02Right1 => '我是丰盛的，金钱轻松地流向我';

  @override
  String get guideRule02Right2 => '我与正在成为的自己和平相处';

  @override
  String get guideRule02Right3 => '我配得上我正在创造的人生';

  @override
  String get guideRule03 => '法则三';

  @override
  String get guideRule03Title => '如同\n已经实现般去说';

  @override
  String get guideRule03Body1 => '你不需要知道它将如何发生。你唯一的任务是保持那种振频——那种已经拥有你所宣告之物的感觉。';

  @override
  String get guideRule03Body2 => '宇宙不回应你想要什么。它回应你是什么。不要追逐。不要寻找征兆。只管成为。';

  @override
  String get guideRule03Wrong1 => '我希望有一天能找到平静';

  @override
  String get guideRule03Right1 => '我感恩充满我生命的平静';

  @override
  String get guideRule03Wrong2 => '我在努力变得更自信';

  @override
  String get guideRule03Right2 => '我是自信的。我完全信任自己。';

  @override
  String get guideRule04 => '法则四';

  @override
  String get guideRule04Title => '感恩即是证明';

  @override
  String get guideRule04Body1 => '感恩不是事后的感谢信。它是你在收到之前发出的信号——向宇宙证明你信任这个过程。';

  @override
  String get guideRule04Body2 =>
      '当你为尚未看到的事物感恩时，你消弭了想要与拥有之间的鸿沟。这就是每个满月这款应用引导你完成的仪式。';

  @override
  String get guideRule04Right1 => '我非常感恩，财务自由已是我的现实';

  @override
  String get guideRule04Right2 => '感恩每天围绕着我的爱';

  @override
  String get guideRule04Right3 => '我感恩我的健康、我的力量、我的清明';

  @override
  String get guideClosing => '这是你的修行。\n月亮提供时机。\n你提供真诚。';

  @override
  String get lunarCycleTitle => '月亮周期';

  @override
  String lunarYouAreHere(String phase) {
    return '你在这里：$phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return '第$day天，共$total天';
  }

  @override
  String get lunarNewMoonPlant => '新月——播种';

  @override
  String get lunarNewMoonPlantDesc => '设定你的意图。说出你真正需要的。这是周期的起点。';

  @override
  String get lunarNewMoonDuration => '约1天';

  @override
  String get lunarNewMoonStatus => '意图开放中';

  @override
  String get lunarWaxingTend => '上弦月——培育';

  @override
  String get lunarWaxingTendDesc => '每天重复你的意图。通过重复建立信念。月亮在增长，你的信心也在增长。';

  @override
  String get lunarWaxingDuration => '约14天';

  @override
  String get lunarWaxingStatus => '每日提醒已开启';

  @override
  String get lunarFullMoonGiveThanks => '满月——感恩';

  @override
  String get lunarFullMoonGiveThanksDesc => '如同你已拥有所求之物般表达感恩。这是顶峰——接收的时刻。';

  @override
  String get lunarFullMoonDuration => '约1天';

  @override
  String get lunarFullMoonStatus => '感恩仪式';

  @override
  String get lunarWaningRelease => '下弦月——释放';

  @override
  String get lunarWaningReleaseDesc => '完全放手。停止推动，停止查看。相信你播下的正在黑暗中生长。';

  @override
  String get lunarWaningDuration => '约14天';

  @override
  String get lunarWaningStatus => '窗口关闭——静默';

  @override
  String get lunarLegendManifest => '显化';

  @override
  String get lunarLegendRelease => '释放';

  @override
  String get lunarThisCycle => '本周期';

  @override
  String get lunarNow => '当前';

  @override
  String get cycleDiagramNewMoon => '新月';

  @override
  String get cycleDiagramWaxingCrescent => '蛾眉月';

  @override
  String get cycleDiagramFirstQuarter => '上弦月';

  @override
  String get cycleDiagramWaxingGibbous => '盈凸月';

  @override
  String get cycleDiagramFullMoon => '满月';

  @override
  String get cycleDiagramWaningGibbous => '亏凸月';

  @override
  String get cycleDiagramLastQuarter => '下弦月';

  @override
  String get cycleDiagramWaningCrescent => '残月';

  @override
  String get cycleDiagramManifest => '显化';

  @override
  String get cycleDiagramRelease => '释放';

  @override
  String get cycleThisCycle => '本周期';

  @override
  String get cycleSeeFullDetails => '查看完整周期详情';

  @override
  String debugLabel(String info) {
    return '调试：$info';
  }

  @override
  String get debugLive => '实时';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsReminderFrequency => '提醒频率（每天次数）';

  @override
  String get settingsWakeWindow => '清醒时段';

  @override
  String get settingsWakeWindowStart => '开始';

  @override
  String get settingsWakeWindowEnd => '结束';

  @override
  String get settingsMoonStyle => '月亮样式';

  @override
  String get settingsMoonStyleDescription => '选择月亮在应用中的外观';

  @override
  String get settingsMoonStyleClassic => '经典';

  @override
  String get settingsMoonStyleStarfield => '星空';

  @override
  String get settingsMoonStyleAura => '光晕';

  @override
  String get settingsMoonStyleHalo => '光环';

  @override
  String get settingsData => '数据';

  @override
  String get settingsExportData => '导出数据';

  @override
  String get settingsImportData => '导入数据';

  @override
  String get settingsAbout => '关于';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest 是一款个人仪式伴侣应用，旨在帮助你将意图与月亮周期对齐。每个新月，你设定最多三个意图，并在接下来的28天中通过每日感恩和反思来培育它们。你的数据安全地存储在设备上，从不会发送到任何服务器。使用导出功能创建加密备份，在新设备上导入即可恢复你的修行。';

  @override
  String get settingsManifestationGuide => '显化指南';

  @override
  String get settingsExportPasswordTitle => '设置导出密码';

  @override
  String get settingsImportPasswordTitle => '输入导入密码';

  @override
  String get settingsPasswordHint => '密码';

  @override
  String settingsExportFailed(String error) {
    return '导出失败：$error';
  }

  @override
  String get settingsCouldNotReadFile => '无法读取文件。';

  @override
  String get settingsDataImported => '数据导入成功。';

  @override
  String get settingsWrongPassword => '密码错误或文件损坏。';

  @override
  String settingsImportFailed(String error) {
    return '导入失败：$error';
  }

  @override
  String get settingsExportSubject => 'Moon Manifest 备份';

  @override
  String get historyTitle => '历史';

  @override
  String get historyNoCompletedCycles => '尚无已完成的周期';

  @override
  String get historyOngoing => '进行中';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个意图',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => '意图';

  @override
  String get historyGratitudesLabel => '感恩';

  @override
  String get phaseNewMoon => '新月';

  @override
  String get phaseWaxing => '上弦月';

  @override
  String get phaseFullMoon => '满月';

  @override
  String get phaseWaning => '下弦月';

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
  String get wisdom1 => '你所寻找的，也在寻找你。';

  @override
  String get wisdom1Author => '鲁米';

  @override
  String get wisdom2 => '宇宙不在你身外。向内看，你想要的一切，你已经是了。';

  @override
  String get wisdom2Author => '鲁米';

  @override
  String get wisdom3 => '信任等待。拥抱不确定。';

  @override
  String get wisdom4 => '你吸引的不是你想要的，而是你所是的。';

  @override
  String get wisdom5 => '当我放下我是什么，我就成为我可能是的。';

  @override
  String get wisdom5Author => '老子';

  @override
  String get wisdom6 => '天地不争，万物自成。';

  @override
  String get wisdom6Author => '老子';

  @override
  String get wisdom7 => '假定你的愿望已经实现的感觉，然后观察你注意力所遵循的路线。';

  @override
  String get wisdom7Author => '内维尔·戈达德';

  @override
  String get wisdom8 => '人最大的错觉，是以为存在他自身意识状态之外的原因。';

  @override
  String get wisdom8Author => '内维尔·戈达德';

  @override
  String get wisdom9 => '你永远是学生，从不是大师。你必须持续前行。';

  @override
  String get wisdom9Author => '康拉德·霍尔';

  @override
  String get wisdom10 => '别再把自己看得那么渺小。你是宇宙在欣喜地舞动。';

  @override
  String get wisdom10Author => '鲁米';

  @override
  String get wisdom11 => '此刻永恒存在。安住于此。';

  @override
  String get wisdom12 => '放下给予我们自由，而自由是幸福的唯一条件。';

  @override
  String get wisdom12Author => '一行禅师';

  @override
  String get wisdom13 => '臣服不是放弃。是将自己交托给更伟大的存在。';

  @override
  String get wisdom14 => '此刻的你，已经拥有应对世间一切的力量。';

  @override
  String get wisdom14Author => '博恩·崔西';

  @override
  String get wisdom15 => '你越安静，就越能听见。';

  @override
  String get wisdom15Author => '鲁米';

  @override
  String get wisdom16 => '你的任务不是去寻找爱，而是去发现你内心为抵御爱而筑起的所有屏障。';

  @override
  String get wisdom16Author => '鲁米';

  @override
  String get wisdom17 => '信念是在看不到整个阶梯时迈出第一步。';

  @override
  String get wisdom17Author => '马丁·路德·金';

  @override
  String get wisdom18 => '种子不与泥土对抗。它只是生长。';

  @override
  String get wisdom19 => '放下对「如何」的执念。相信宇宙知道方向。';

  @override
  String get wisdom20 => '开始把自己看作拥有身体的灵魂，而不是拥有灵魂的身体。';

  @override
  String get wisdom20Author => '韦恩·戴尔';

  @override
  String get wisdom21 => '你不能总是控制外在发生的事。但你始终可以控制内在发生的事。';

  @override
  String get wisdom21Author => '韦恩·戴尔';

  @override
  String get wisdom22 => '耐心不是被动的等待。它是主动的信任。';

  @override
  String get wisdom23 => '你所需要的一切已在你之内，等待绽放。';

  @override
  String get wisdom24 => '月亮不争。它注视。在注视中，它将一切凝聚在一起。';

  @override
  String get wisdom25 => '行动起来，如同你想在生命中显化的已是现实。';

  @override
  String get wisdom25Author => '韦恩·戴尔';

  @override
  String get wisdom26 => '静下来，去感知。';

  @override
  String get wisdom27 => '放开枝干，信任河流。';

  @override
  String get wisdom28 => '伤口，是光进入你的地方。';

  @override
  String get wisdom28Author => '鲁米';

  @override
  String get wisdom29 => '停在港湾里的船是安全的，但那不是造船的目的。';

  @override
  String get wisdom29Author => '约翰·A·谢德';

  @override
  String get wisdom30 => '宇宙一直在对我们说话。给我们送来小小的讯息，制造巧合与缘分。唯一的问题是：我们在听吗？';

  @override
  String get wisdom30Author => '南希·塞耶';
}
