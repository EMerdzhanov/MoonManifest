// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Moon Manifestへ\nようこそ';

  @override
  String get onboardingWelcomeBody => 'このアプリは、月のリズムに合わせた引き寄せの実践をガイドします。';

  @override
  String get onboardingCycleTitle => '月のサイクル';

  @override
  String get onboardingCycleBody => '毎月の月の周期は、それぞれ固有のエネルギーを持つ4つのフェーズを巡ります。';

  @override
  String get onboardingWhatYouDoTitle => 'あなたが行うこと';

  @override
  String get onboardingNewMoonDesc => '意図を設定し、新たな始まりの種を蒔きましょう。';

  @override
  String get onboardingWaxingDesc => '行動を起こし、目標に向かって勢いをつけましょう。';

  @override
  String get onboardingFullMoonDesc => '成果を祝い、もう必要のないものを手放しましょう。';

  @override
  String get onboardingWaningDesc => '振り返り、休息し、学んだ教訓を統合しましょう。';

  @override
  String get onboardingPreferencesTitle => 'あなたの設定';

  @override
  String get onboardingPreferencesSubtitle => 'ガイダンスを受け取る方法とタイミングをカスタマイズしましょう。';

  @override
  String get onboardingNotificationFrequency => '通知の頻度';

  @override
  String get onboardingNotificationFrequencyHint => '1日に何回リマインダーを受け取りたいですか？';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count回 / 日';
  }

  @override
  String get onboardingWakeWindow => '活動時間帯';

  @override
  String get onboardingWakeWindowHint => 'この時間帯以外には通知しません。';

  @override
  String get onboardingWakeUp => '起床時刻';

  @override
  String get onboardingWindDown => '就寝時刻';

  @override
  String get onboardingButtonContinue => '続ける';

  @override
  String get onboardingButtonBegin => '始める';

  @override
  String get waitingWindowNotOpen => '引き寄せのウィンドウはまだ開いていません';

  @override
  String waitingFirstCycle(String date) {
    return '最初のサイクルは$dateの新月に始まります。';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日後',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => '待っている間に準備しましょう';

  @override
  String get waitingLearnManifest => '引き寄せの方法を学ぶ';

  @override
  String get waitingLearnManifestSubtitle => 'この実践を成功させる4つのルール';

  @override
  String get waitingUnderstandCycle => '月の周期を理解する';

  @override
  String get waitingUnderstandCycleSubtitle => '今どのフェーズにいるか、各フェーズの意味を確認しましょう';

  @override
  String get waitingDraftIntentionsTitle => '意図の下書きを作る';

  @override
  String get waitingDraftIntentionsBody =>
      'このスペースを使って振り返り、準備しましょう。あなたは何を引き寄せたいですか？';

  @override
  String waitingIntentionHint(int number) {
    return '意図 $number…';
  }

  @override
  String get waitingAddIntention => '意図を追加';

  @override
  String get waitingMaxIntentionsMessage => '7つの意図は意味のある数です。最も大切なものを慎重に選びましょう。';

  @override
  String get waitingDraftSaved => '下書きを保存しました';

  @override
  String get commonSomethingWentWrong => 'エラーが発生しました。';

  @override
  String get newMoonSetIntentions => '新月。\n意図を設定しましょう。';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return '猶予期間の終了: $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      '自分に問いかけてみてください：欲望の奥に、本当に必要としているものは何か？成長、つながり、平和、豊かさ——心の根底にある願いに語りかける意図を設定しましょう。';

  @override
  String get newMoonHowToWrite => '力強い意図の書き方';

  @override
  String get newMoonYourIntentions => 'あなたの意図';

  @override
  String newMoonIntentionHint(int number) {
    return '意図 $number…';
  }

  @override
  String get newMoonAddIntention => '意図を追加';

  @override
  String get newMoonMaxIntentionsMessage => '7つの意図は意味のある数です。最も大切なものを慎重に選びましょう。';

  @override
  String get newMoonPlantIntentions => 'これらの意図を植える';

  @override
  String get newMoonLockedTitle => 'このサイクルのあなたの意図です。';

  @override
  String get newMoonLockedSubtitleEditing => '以下で意図を編集できます。';

  @override
  String get newMoonLockedSubtitlePlanted => '意図は植えられました。プロセスを信じましょう。';

  @override
  String newMoonEditIntentionHint(int number) {
    return '意図 $number...';
  }

  @override
  String get newMoonEditIntentions => '意図を編集';

  @override
  String get newMoonEditUntilWaxing => '上弦フェーズが始まるまで編集できます。';

  @override
  String get newMoonSaveChanges => '変更を保存';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return '上弦の$day日目';
  }

  @override
  String get waxingFullMoonTomorrow => '明日は満月です。';

  @override
  String waxingFullMoonInDays(int count) {
    return '満月まであと$count日。';
  }

  @override
  String get waxingYourIntentions => 'あなたの意図';

  @override
  String get waxingUnableToLoad => '意図を読み込めませんでした。';

  @override
  String get waxingNoIntentionsFound => 'このサイクルの意図が見つかりません。';

  @override
  String get fullMoonNoIntentionsSet => 'このサイクルでは意図が設定されていません';

  @override
  String get fullMoonWorkDone => 'やるべきことは終わりました。';

  @override
  String get fullMoonNowRelease => 'さあ、手放しましょう。';

  @override
  String fullMoonWaningNext(String date) {
    return '下弦フェーズがまもなく始まります。\n次のサイクルは$dateの新月に始まります。';
  }

  @override
  String get fullMoonGiveThanks => '満月。感謝を捧げましょう。';

  @override
  String get fullMoonGracePeriodActive => '猶予期間中';

  @override
  String get fullMoonThankUniverse => 'すでに願いが叶ったかのように、宇宙に感謝しましょう';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get fullMoonGratitudeHint => '私は〜に心から感謝しています…';

  @override
  String get fullMoonCompleteCeremony => 'セレモニーを完了する';

  @override
  String get fullMoonNextIntention => '次の意図へ';

  @override
  String get waningWindowClosed => '引き寄せのウィンドウは閉じています';

  @override
  String waningOpensAgain(int count) {
    return '新月にあと$count日で再び開きます';
  }

  @override
  String get waningReleaseTrust => '手放して。信じて。';

  @override
  String get waningWorkDone => 'やるべきことは終わりました。';

  @override
  String get waningNextNewMoon => '次の新月';

  @override
  String get waningWhyQuiet => 'なぜ静寂なの？';

  @override
  String get philosophyTitle => 'なぜ今ウィンドウが\n閉じているの？';

  @override
  String get philosophyBody1 =>
      '引き寄せはあなたのスケジュールではなく、月のリズムで動いています。月の周期には、意図を設定するのに力強い時期と、何もしないことが最も力強い行為である時期があります。';

  @override
  String get philosophyBody2 =>
      '今、月は下弦——闇に向かって縮んでいます。これは手放しのフェーズです。このサイクルのあなたの意図は、植えられ、育てられ、感謝とともに捧げられました。今はそれが根を張るための空間が必要です。このフェーズで無理に押し進めても助けにはなりません。むしろ妨げになります。';

  @override
  String get philosophyBody3 =>
      '新月が訪れると、ウィンドウは再び開きます。その時に新たな意図を設定し、新しいサイクルを始めましょう。この待つ時間は無駄ではありません——実践の一部です。手放す規律こそが、引き寄せを単なる願い事から分けるものです。';

  @override
  String get philosophyDaysUntilOpen => '日後にウィンドウが開きます';

  @override
  String philosophyReminderSetFor(String date) {
    return '$dateにリマインダーを設定しました';
  }

  @override
  String get philosophyRemindMe => '開いたら通知する';

  @override
  String get philosophyCouldNotSchedule => 'リマインダーを設定できませんでした';

  @override
  String get philosophyNotificationTitle => '引き寄せのウィンドウが開きました。';

  @override
  String get philosophyNotificationBody => '今すぐ意図を設定しましょう。';

  @override
  String get philosophyHookTitle => '彼らが知っていて\nあなたが知らないこと';

  @override
  String get philosophyHookBody1 =>
      '地球上で最も成功している人々は、ただ目標を立てるだけではありません。彼らはタイミングと共に動いています。ほとんどの人が決して理解しないことを彼らは知っています：宇宙にはリズムがあり、それに合わせる者は結果を追いかけない——結果の方が彼らを追いかけてくるのです。';

  @override
  String get philosophyHookBody2 =>
      'これは秘密ではありません。何千年もの間、帝国を築き、王朝を興し、静かに世界を動かした人々が実践してきた古代の知恵です。月は彼らの時計であり、「私は〜である」が彼らの言葉であり、コミットメントが彼らの代償でした。';

  @override
  String get philosophyHookBody3 =>
      '彼らが理解していたこと：引き寄せはシンプルです。簡単ではなく——シンプルなのです。自分がなりつつあるものを宣言する。心が信じるまで繰り返す。証拠を見る前に感謝する。そして完全に手放す。';

  @override
  String get philosophyHookBody4 =>
      'ほとんどの人が失敗するのは、プロセスにコミットしないからです。規律なしに結果だけを求めます。一日だけ引き寄せをして、サインを探し、火曜日までに何も起こらないとやめてしまう。それは引き寄せではありません。それはただの願い事です。';

  @override
  String get philosophyMoonHeading => '月こそが欠けていたピース';

  @override
  String get philosophyMoonBody1 =>
      'アファメーションは以前にも試したことがあるでしょう。鏡に向かって「私は豊かだ」と言って、何も変わらなかったかもしれません。それは、タイミングも構造も宇宙の整合もない虚空に語りかけていたからです。';

  @override
  String get philosophyMoonBody2 =>
      '月がすべてを変えます。月はあなたの実践にサイクルを与えます——始まり、中間、頂点、そして手放し。新月に意図を設定する時、あなたはただ願いを書いているのではありません。人類が存在する以前から大洋を動かしてきた唯一の土壌に種を蒔いているのです。';

  @override
  String get philosophyMoonBody3 =>
      '下弦の月は休止ではありません。すべてのフェーズの中で最も厳しいフェーズです。誰でも求めることはできます。誰でも繰り返すことはできます。しかし手放すこと——植えたものが暗闇の中で育っていると本当に信じて手放すこと——それには、この実践の根底にある規律が必要です。';

  @override
  String get philosophyFourPhasesHeading => '4つの神聖なフェーズ';

  @override
  String get philosophyPhasePlanting => '種蒔き';

  @override
  String get philosophyPhasePlantingDesc =>
      '闇の中で、あなたは本当に必要なものを名づけます——望むものではなく、魂が求めるものを。新月はありのままの真実のための空間を抱いています。';

  @override
  String get philosophyPhaseTending => '育み';

  @override
  String get philosophyPhaseTendingDesc =>
      '光が戻るにつれ、あなたは毎日意図を繰り返します。希望としてではなく、確信として。あなたは求めているのではない——すでに向かっているものを思い出しているのです。';

  @override
  String get philosophyPhaseGratitude => '感謝';

  @override
  String get philosophyPhaseGratitudeDesc =>
      '満ちた光の中で、求めたものをすでに手にしているかのように感謝を捧げます。これは偽りではありません。今いる場所と向かっている場所の距離を消し去る行為です。';

  @override
  String get philosophyPhaseRelease => '手放し';

  @override
  String get philosophyPhaseReleaseDesc =>
      'そして——静寂。手放します。押すのをやめ、確かめるのをやめ、求めるのをやめます。下弦の月は最も難しい教訓を教えてくれます：あなたの仕事は終わった、あとはあなたより大きな何かに委ねるということを。';

  @override
  String get philosophyClosing => '月が再び闇に戻るとき、\nあなたは始めます。';

  @override
  String get guideTitle => '引き寄せの方法';

  @override
  String get guideIntro => '4つのルール。それだけです。これらをマスターすれば、月があとは導いてくれます。';

  @override
  String get guideRule01 => 'ルール 01';

  @override
  String get guideRule01Title => '望みではなく、\n必要を名づけよ';

  @override
  String get guideRule01Body1 =>
      '表面的な欲求は本当の意図を隠しています。あなたが本当に欲しいのは100万ドルではなく、安心感、自由、心配しなくていいという感覚です。引き寄せは物質ではなく、感情のレベルで働きます。';

  @override
  String get guideRule01Body2 => '自分に問いかけてください：なぜこれが欲しいのか？ その答えがあなたの本当の意図です。';

  @override
  String get guideRule01Wrong1 => '100万円が欲しい';

  @override
  String get guideRule01Right1 => '私は経済的自由を体験している';

  @override
  String get guideRule01Wrong2 => 'パートナーが欲しい';

  @override
  String get guideRule01Right2 => '私は深く愛あるつながりに囲まれている';

  @override
  String get guideRule01Wrong3 => '昇進したい';

  @override
  String get guideRule01Right3 => '私は仕事で認められ、大切にされている';

  @override
  String get guideRule02 => 'ルール 02';

  @override
  String get guideRule02Title => '「私は〜である」——\nあなたが語る最も力強い言葉';

  @override
  String get guideRule02Body1 =>
      '聖書の中でモーセが神の名を尋ねた時、答えは「我は在りて在る者なり」でした。ヘルメス哲学からネヴィル・ゴダードまで、現代の実践に至るまで、引き寄せに触れたすべての伝統が「私は〜である」を現実を形作る宣言として扱っています。';

  @override
  String get guideRule02Body2 => '「私は〜である」に続く言葉が、宇宙へのあなたの指令になります。慎重に選びましょう。';

  @override
  String get guideRule02Tip1 => '常に肯定形で——「私は健康だ」であって「私は病気ではない」ではなく';

  @override
  String get guideRule02Tip2 => '常に現在形で——「私は〜である」であって「私は〜になる」ではなく';

  @override
  String get guideRule02Tip3 => '常に確信を持って——希望ではなく、真実として語る';

  @override
  String get guideRule02Right1 => '私は豊かで、お金は自然と私に流れてくる';

  @override
  String get guideRule02Right2 => '私はなりつつある自分と平和に向き合っている';

  @override
  String get guideRule02Right3 => '私は自分が創り出している人生にふさわしい存在である';

  @override
  String get guideRule03 => 'ルール 03';

  @override
  String get guideRule03Title => 'すでに叶ったかのように\n語りなさい';

  @override
  String get guideRule03Body1 =>
      'どうやって実現するかを知る必要はありません。あなたの唯一の仕事は、宣言したものをすでに手にしている——その波動、その感覚を保つことです。';

  @override
  String get guideRule03Body2 =>
      '宇宙はあなたが望むものに応じるのではありません。あなたが「何であるか」に応じるのです。追いかけないで。サインを探さないで。ただ、そうありなさい。';

  @override
  String get guideRule03Wrong1 => 'いつか平和を見つけられたらいいな';

  @override
  String get guideRule03Right1 => '私の人生を満たす平和に心から感謝している';

  @override
  String get guideRule03Wrong2 => 'もっと自信を持とうとしている';

  @override
  String get guideRule03Right2 => '私は自信に満ちている。自分自身を完全に信頼している。';

  @override
  String get guideRule04 => 'ルール 04';

  @override
  String get guideRule04Title => '感謝こそが証';

  @override
  String get guideRule04Body1 =>
      '感謝は事後のお礼状ではありません。受け取る前に送るシグナル——プロセスを信頼している証です。';

  @override
  String get guideRule04Body2 =>
      'まだ見ていないものに感謝するとき、望むことと手にすることの間の距離が消えます。これがこのアプリが毎月の満月にあなたを導くセレモニーです。';

  @override
  String get guideRule04Right1 => '経済的自由が私の現実であることに心から感謝しています';

  @override
  String get guideRule04Right2 => '毎日私を包む愛に感謝します';

  @override
  String get guideRule04Right3 => '私の健康、力、明晰さに感謝を捧げます';

  @override
  String get guideClosing => 'これがあなたの実践です。\n月がタイミングを与え、\nあなたが真実を提供します。';

  @override
  String get lunarCycleTitle => '月の周期';

  @override
  String lunarYouAreHere(String phase) {
    return '現在地: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return '$total日中$day日目';
  }

  @override
  String get lunarNewMoonPlant => '新月 — 種蒔き';

  @override
  String get lunarNewMoonPlantDesc =>
      '意図を設定しましょう。本当に必要なものを名づけましょう。ここからサイクルが始まります。';

  @override
  String get lunarNewMoonDuration => '約1日';

  @override
  String get lunarNewMoonStatus => '意図を受付中';

  @override
  String get lunarWaxingTend => '上弦 — 育み';

  @override
  String get lunarWaxingTendDesc =>
      '毎日意図を繰り返しましょう。繰り返しを通じて確信を築きます。月が満ちるように、あなたの信念も満ちていきます。';

  @override
  String get lunarWaxingDuration => '約14日';

  @override
  String get lunarWaxingStatus => 'デイリーリマインダー稼働中';

  @override
  String get lunarFullMoonGiveThanks => '満月 — 感謝';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      '求めたものをすでに手にしているかのように感謝を表しましょう。ここが頂点——受け取りの瞬間です。';

  @override
  String get lunarFullMoonDuration => '約1日';

  @override
  String get lunarFullMoonStatus => '感謝のセレモニー';

  @override
  String get lunarWaningRelease => '下弦 — 手放し';

  @override
  String get lunarWaningReleaseDesc =>
      '完全に手放しましょう。押すのをやめ、確かめるのをやめて。植えたものが暗闇の中で育っていると信じましょう。';

  @override
  String get lunarWaningDuration => '約14日';

  @override
  String get lunarWaningStatus => 'ウィンドウ閉鎖中 — 静寂';

  @override
  String get lunarLegendManifest => '引き寄せ';

  @override
  String get lunarLegendRelease => '手放し';

  @override
  String get lunarThisCycle => '今回のサイクル';

  @override
  String get lunarNow => '現在';

  @override
  String get cycleDiagramNewMoon => '新月';

  @override
  String get cycleDiagramWaxingCrescent => '三日月\n（上弦）';

  @override
  String get cycleDiagramFirstQuarter => '上弦の\n半月';

  @override
  String get cycleDiagramWaxingGibbous => '十三夜\n（上弦）';

  @override
  String get cycleDiagramFullMoon => '満月';

  @override
  String get cycleDiagramWaningGibbous => '十八夜\n（下弦）';

  @override
  String get cycleDiagramLastQuarter => '下弦の\n半月';

  @override
  String get cycleDiagramWaningCrescent => '二十六夜\n（下弦）';

  @override
  String get cycleDiagramManifest => '引き寄せ';

  @override
  String get cycleDiagramRelease => '手放し';

  @override
  String get cycleThisCycle => '今回のサイクル';

  @override
  String get cycleSeeFullDetails => 'サイクルの詳細を見る';

  @override
  String debugLabel(String info) {
    return 'デバッグ: $info';
  }

  @override
  String get debugLive => 'ライブ';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsNotifications => '通知';

  @override
  String get settingsReminderFrequency => 'リマインダーの頻度（1日あたりの回数）';

  @override
  String get settingsWakeWindow => '活動時間帯';

  @override
  String get settingsWakeWindowStart => '開始';

  @override
  String get settingsWakeWindowEnd => '終了';

  @override
  String get settingsMoonStyle => '月のスタイル';

  @override
  String get settingsMoonStyleDescription => 'アプリ全体での月の見た目を選びましょう';

  @override
  String get settingsMoonStyleClassic => 'クラシック';

  @override
  String get settingsMoonStyleStarfield => '星空';

  @override
  String get settingsMoonStyleAura => 'オーラ';

  @override
  String get settingsMoonStyleHalo => 'ハロー';

  @override
  String get settingsData => 'データ';

  @override
  String get settingsExportData => 'データをエクスポート';

  @override
  String get settingsImportData => 'データをインポート';

  @override
  String get settingsAbout => 'このアプリについて';

  @override
  String get settingsAboutDescription =>
      'Moon Manifestは、月の周期に合わせて意図を整えるためのパーソナルな儀式のコンパニオンです。新月ごとに最大3つの意図を設定し、続く28日間を毎日の感謝と振り返りで育みます。データはお使いのデバイスに安全に保存され、サーバーに送信されることはありません。エクスポート機能で暗号化されたバックアップを作成し、新しいデバイスにインポートして実践を復元できます。';

  @override
  String get settingsManifestationGuide => '引き寄せガイド';

  @override
  String get settingsExportPasswordTitle => 'エクスポート用パスワードを設定';

  @override
  String get settingsImportPasswordTitle => 'インポート用パスワードを入力';

  @override
  String get settingsPasswordHint => 'パスワード';

  @override
  String settingsExportFailed(String error) {
    return 'エクスポートに失敗しました: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'ファイルを読み取れませんでした。';

  @override
  String get settingsDataImported => 'データのインポートに成功しました。';

  @override
  String get settingsWrongPassword => 'パスワードが間違っているか、ファイルが破損しています。';

  @override
  String settingsImportFailed(String error) {
    return 'インポートに失敗しました: $error';
  }

  @override
  String get settingsExportSubject => 'Moon Manifest バックアップ';

  @override
  String get historyTitle => '履歴';

  @override
  String get historyNoCompletedCycles => '完了したサイクルはまだありません';

  @override
  String get historyOngoing => '進行中';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個の意図',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => '意図';

  @override
  String get historyGratitudesLabel => '感謝';

  @override
  String get phaseNewMoon => '新月';

  @override
  String get phaseWaxing => '上弦';

  @override
  String get phaseFullMoon => '満月';

  @override
  String get phaseWaning => '下弦';

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
  String get wisdom1 => 'あなたが探し求めているものも、あなたを探し求めている。';

  @override
  String get wisdom1Author => 'ルーミー';

  @override
  String get wisdom2 => '宇宙はあなたの外にはない。自分の内を見なさい。求めるものすべて、あなたはすでにそれである。';

  @override
  String get wisdom2Author => 'ルーミー';

  @override
  String get wisdom3 => '待つことを信じなさい。不確かさを受け入れなさい。';

  @override
  String get wisdom4 => 'あなたは欲しいものを引き寄せるのではない。あなた自身であるものを引き寄せるのだ。';

  @override
  String get wisdom5 => '今の自分を手放せば、なれるかもしれない自分になれる。';

  @override
  String get wisdom5Author => '老子';

  @override
  String get wisdom6 => '自然は急がない、それでもすべてが成し遂げられる。';

  @override
  String get wisdom6Author => '老子';

  @override
  String get wisdom7 => '願いが叶った気持ちを想定し、あなたの注意がたどる道を観察しなさい。';

  @override
  String get wisdom7Author => 'ネヴィル・ゴダード';

  @override
  String get wisdom8 => '人間の最大の錯覚は、自分自身の意識状態以外に原因があるという確信である。';

  @override
  String get wisdom8Author => 'ネヴィル・ゴダード';

  @override
  String get wisdom9 => 'あなたは常に学ぶ者であり、決して極めた者ではない。前に進み続けなければならない。';

  @override
  String get wisdom9Author => 'コンラッド・ホール';

  @override
  String get wisdom10 => 'そんなに小さくふるまうのはやめなさい。あなたは恍惚として躍動する宇宙そのものだ。';

  @override
  String get wisdom10Author => 'ルーミー';

  @override
  String get wisdom11 => '今この瞬間は、常に存在していた。そこに安らぎなさい。';

  @override
  String get wisdom12 => '手放すことが自由を与え、自由こそが幸せの唯一の条件である。';

  @override
  String get wisdom12Author => 'ティク・ナット・ハン';

  @override
  String get wisdom13 => '委ねることは諦めることではない。より大きなものに託すことだ。';

  @override
  String get wisdom14 => 'あなたの中には今この瞬間、世界が投げかけるどんなことにも対処できるすべてがある。';

  @override
  String get wisdom14Author => 'ブライアン・トレーシー';

  @override
  String get wisdom15 => '静かになればなるほど、より多くのことが聞こえるようになる。';

  @override
  String get wisdom15Author => 'ルーミー';

  @override
  String get wisdom16 => 'あなたの使命は愛を探すことではなく、自分の中に愛に対して築いた壁をすべて見つけ、取り除くことだ。';

  @override
  String get wisdom16Author => 'ルーミー';

  @override
  String get wisdom17 => '信仰とは、階段の全体が見えなくても、最初の一歩を踏み出すことだ。';

  @override
  String get wisdom17Author => 'マーティン・ルーサー・キング・ジュニア';

  @override
  String get wisdom18 => '種は土と戦わない。ただ、育つだけだ。';

  @override
  String get wisdom19 => '「どうやって」を知る必要を手放しなさい。宇宙が道を知っていると信じなさい。';

  @override
  String get wisdom20 => '体を持つ魂ではなく、魂を持つ体として自分を見始めなさい。';

  @override
  String get wisdom20Author => 'ウェイン・ダイアー';

  @override
  String get wisdom21 => '外で起こることをいつもコントロールすることはできない。しかし内で起こることはいつもコントロールできる。';

  @override
  String get wisdom21Author => 'ウェイン・ダイアー';

  @override
  String get wisdom22 => '忍耐は受動的な待機ではない。能動的な信頼である。';

  @override
  String get wisdom23 => '必要なものはすべて、すでにあなたの中にあり、展開するのを待っている。';

  @override
  String get wisdom24 => '月は戦わない。見守るだけだ。そして見守ることで、すべてをまとめている。';

  @override
  String get wisdom25 => '人生で引き寄せたいものが、すでに現実であるかのように行動しなさい。';

  @override
  String get wisdom25Author => 'ウェイン・ダイアー';

  @override
  String get wisdom26 => '静まりて、知れ。';

  @override
  String get wisdom27 => '枝を手放し、川を信じなさい。';

  @override
  String get wisdom28 => '傷こそが、光があなたに入ってくる場所だ。';

  @override
  String get wisdom28Author => 'ルーミー';

  @override
  String get wisdom29 => '港にいる船は安全だが、船はそのために造られたのではない。';

  @override
  String get wisdom29Author => 'ジョン・A・シェッド';

  @override
  String get wisdom30 =>
      '宇宙は常に私たちに語りかけている。小さなメッセージを送り、偶然の一致やめぐり合わせを起こしている。唯一の問いは：あなたは耳を傾けているか？';

  @override
  String get wisdom30Author => 'ナンシー・セイヤー';
}
