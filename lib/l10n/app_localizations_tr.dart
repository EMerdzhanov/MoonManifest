// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Moon Manifest\'e\nHoş Geldiniz';

  @override
  String get onboardingWelcomeBody =>
      'Bu uygulama, aya bağlı bir niyet belirleme pratiğine rehberlik eder.';

  @override
  String get onboardingCycleTitle => 'Döngü';

  @override
  String get onboardingCycleBody =>
      'Her ay döngüsü, kendine özgü enerjiye sahip dört ayrı evreden geçer.';

  @override
  String get onboardingWhatYouDoTitle => 'Neler Yapacaksınız';

  @override
  String get onboardingNewMoonDesc =>
      'Niyetlerinizi belirleyin ve yeni başlangıçlar için tohumlar ekin.';

  @override
  String get onboardingWaxingDesc =>
      'Harekete geçin ve hedeflerinize doğru ivme kazanın.';

  @override
  String get onboardingFullMoonDesc =>
      'Kazanımlarınızı kutlayın ve artık size hizmet etmeyenleri bırakın.';

  @override
  String get onboardingWaningDesc =>
      'Düşünün, dinlenin ve öğrenilen dersleri içselleştirin.';

  @override
  String get onboardingPreferencesTitle => 'Tercihleriniz';

  @override
  String get onboardingPreferencesSubtitle =>
      'Rehberliği nasıl ve ne zaman alacağınızı özelleştirin.';

  @override
  String get onboardingNotificationFrequency => 'Bildirim Sıklığı';

  @override
  String get onboardingNotificationFrequencyHint =>
      'Günde kaç kez hatırlatılmak istiyorsunuz?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / gün';
  }

  @override
  String get onboardingWakeWindow => 'Uyanıklık Penceresi';

  @override
  String get onboardingWakeWindowHint => 'Bu saatler dışında bildirim gelmez.';

  @override
  String get onboardingWakeUp => 'Uyanış';

  @override
  String get onboardingWindDown => 'Dinlenme';

  @override
  String get onboardingButtonContinue => 'Devam';

  @override
  String get onboardingButtonBegin => 'Başla';

  @override
  String get waitingWindowNotOpen => 'Niyet belirleme penceresi henüz açılmadı';

  @override
  String waitingFirstCycle(String date) {
    return 'İlk döngünüz $date tarihindeki yeni ayda başlıyor.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün kaldı',
      one: '1 gün kaldı',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Beklerken hazırlanın';

  @override
  String get waitingLearnManifest => 'Niyet belirlemeyi öğrenin';

  @override
  String get waitingLearnManifestSubtitle => 'Bu pratiği işler kılan 4 kural';

  @override
  String get waitingUnderstandCycle => 'Ay döngüsünü anlayın';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Nerede olduğunuzu ve her evrenin ne anlama geldiğini görün';

  @override
  String get waitingDraftIntentionsTitle => 'Niyetlerinizi taslak olarak yazın';

  @override
  String get waitingDraftIntentionsBody =>
      'Bu alanı düşünmek ve hazırlanmak için kullanın. Hayatınıza neyi çağırmak istiyorsunuz?';

  @override
  String waitingIntentionHint(int number) {
    return 'Niyet $number…';
  }

  @override
  String get waitingAddIntention => 'Niyet ekle';

  @override
  String get waitingMaxIntentionsMessage =>
      'Yedi niyet anlamlı bir sayıdır. En çok neyin önemli olduğunu seçmeye özen gösterin.';

  @override
  String get waitingDraftSaved => 'Taslak kaydedildi';

  @override
  String get commonSomethingWentWrong => 'Bir şeyler ters gitti.';

  @override
  String get newMoonSetIntentions => 'Yeni Ay.\nNiyetlerinizi belirleyin.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Ek süre $deadline tarihinde sona eriyor';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Kendinize sorun: Arzularımın altında gerçekten neye ihtiyacım var? Altta yatan ihtiyaçlarınıza hitap eden niyetler belirleyin — büyüme, bağlantı, huzur, bereket.';

  @override
  String get newMoonHowToWrite => 'Güçlü niyetler nasıl yazılır';

  @override
  String get newMoonYourIntentions => 'Niyetleriniz';

  @override
  String newMoonIntentionHint(int number) {
    return 'Niyet $number…';
  }

  @override
  String get newMoonAddIntention => 'Niyet ekle';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Yedi niyet anlamlı bir sayıdır. En çok neyin önemli olduğunu seçmeye özen gösterin.';

  @override
  String get newMoonPlantIntentions => 'Bu niyetleri ek';

  @override
  String get newMoonLockedTitle => 'Bunlar bu döngü için niyetleriniz.';

  @override
  String get newMoonLockedSubtitleEditing =>
      'Niyetlerinizi aşağıdan düzenleyin.';

  @override
  String get newMoonLockedSubtitlePlanted => 'Ekildi. Sürece güvenin.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Niyet $number...';
  }

  @override
  String get newMoonEditIntentions => 'Niyetleri düzenle';

  @override
  String get newMoonEditUntilWaxing =>
      'Hilal evresi başlayana kadar düzenleyebilirsiniz.';

  @override
  String get newMoonSaveChanges => 'Değişiklikleri kaydet';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonOk => 'Tamam';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Hilal evresinin $day. günü.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Dolunay yarın.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Dolunaya $count gün.';
  }

  @override
  String get waxingYourIntentions => 'Niyetleriniz';

  @override
  String get waxingUnableToLoad => 'Niyetler yüklenemedi.';

  @override
  String get waxingNoIntentionsFound => 'Bu döngü için niyet bulunamadı.';

  @override
  String get fullMoonNoIntentionsSet => 'Bu döngüde niyet belirlenmedi';

  @override
  String get fullMoonWorkDone => 'İş tamamlandı.';

  @override
  String get fullMoonNowRelease => 'Şimdi bırakın.';

  @override
  String fullMoonWaningNext(String date) {
    return 'Azalan ay evresi yakında başlıyor.\nBir sonraki döngünüz $date tarihindeki yeni ayda başlayacak.';
  }

  @override
  String get fullMoonGiveThanks => 'Dolunay. Şükredin.';

  @override
  String get fullMoonGracePeriodActive => 'Ek süre aktif';

  @override
  String get fullMoonThankUniverse =>
      'İstediğiniz şeylere zaten sahipmişsiniz gibi evrene şükredin';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Çok minnettarım ki…';

  @override
  String get fullMoonCompleteCeremony => 'Töreni tamamla';

  @override
  String get fullMoonNextIntention => 'Sonraki niyet';

  @override
  String get waningWindowClosed => 'Niyet belirleme penceresi kapandı';

  @override
  String waningOpensAgain(int count) {
    return 'Yeni ayda $count gün sonra tekrar açılacak';
  }

  @override
  String get waningReleaseTrust => 'Bırakın. Güvenin.';

  @override
  String get waningWorkDone => 'İş tamamlandı.';

  @override
  String get waningNextNewMoon => 'Sonraki yeni ay';

  @override
  String get waningWhyQuiet => 'Neden sessiz?';

  @override
  String get philosophyTitle => 'Pencere Neden\nŞu An Kapalı?';

  @override
  String get philosophyBody1 =>
      'Niyet belirleme sizin programınıza göre değil — ayın programına göre çalışır. Ay döngüsünün niyet belirlemenin güçlü olduğu belirli pencereleri ve yapabileceğiniz en güçlü şeyin hiçbir şey yapmamak olduğu dönemleri vardır.';

  @override
  String get philosophyBody2 =>
      'Şu anda ay azalıyor — karanlığa doğru küçülüyor. Bu, bırakma evresidir. Bu döngüdeki niyetleriniz ekildi, bakıldı ve şükranla sunuldu. Şimdi kök salmaları için alana ihtiyaçları var. Bu evrede daha fazla zorlamak yardımcı olmaz. Müdahale eder.';

  @override
  String get philosophyBody3 =>
      'Yeni ay geldiğinde pencere tekrar açılır. O zaman yeni niyetler belirler ve yeni bir döngüye başlarsınız. Bekleme boşa geçen zaman değildir — pratiğin bir parçasıdır. Bırakma disiplini, niyet belirlemeyi dilek tutmaktan ayıran şeydir.';

  @override
  String get philosophyDaysUntilOpen => 'pencerenin açılmasına kalan gün';

  @override
  String philosophyReminderSetFor(String date) {
    return '$date için hatırlatıcı ayarlandı';
  }

  @override
  String get philosophyRemindMe => 'Açıldığında bana hatırlat';

  @override
  String get philosophyCouldNotSchedule => 'Hatırlatıcı ayarlanamadı';

  @override
  String get philosophyNotificationTitle => 'Niyet belirleme penceresi açık.';

  @override
  String get philosophyNotificationBody => 'Niyetlerinizi şimdi belirleyin.';

  @override
  String get philosophyHookTitle => 'Onların Bilip\nSizin Bilmediğiniz Şey';

  @override
  String get philosophyHookBody1 =>
      'Dünyanın en başarılı insanları sadece hedef belirlemez. Zamanlamayla çalışırlar. Çoğu insanın asla anlamayacağı bir şeyi anlarlar: evrenin bir ritmi vardır ve ona uyum sağlayanlar sonuçları kovalamaz — sonuçlar onları kovalar.';

  @override
  String get philosophyHookBody2 =>
      'Bu bir sır değil. Bu kadim bir bilgidir — imparatorluklar kuran, hanedanlar inşa eden ve dünyayı sessizce değiştirenlerin binlerce yıldır uyguladığı bir bilgi. Ay onların saatiydi. \"BEN\" onların diliydi. Ve bağlılık onların bedeliydi.';

  @override
  String get philosophyHookBody3 =>
      'İşte onların anladığı şey: niyet belirleme basittir. Kolay değil — basit. Ne olduğunuzu ilan edersiniz. Zihniniz inanana kadar tekrarlarsınız. Kanıt görmeden önce şükredersiniz. Ve sonra bırakırsınız. Tamamen.';

  @override
  String get philosophyHookBody4 =>
      'Çoğu insan sürece bağlanmayı reddettiği için başarısız olur. Disiplin olmadan sonuç isterler. Bir gün niyet belirler, işaretleri kontrol eder ve salıya kadar bir şey olmayınca vazgeçerler. Bu niyet belirleme değildir. Bu dilek tutmaktır.';

  @override
  String get philosophyMoonHeading => 'Ay, Eksik Parçadır';

  @override
  String get philosophyMoonBody1 =>
      'Muhtemelen daha önce olumlamaları denediniz. Muhtemelen aynada \"Ben bolluk içindeyim\" dediniz ve hiçbir şeyin değişmediğini hissettiniz. Bunun nedeni, boşluğa konuşuyor olmanızdı — zamanlama yok, yapı yok, sözlerinizin arkasında kozmik hizalanma yok.';

  @override
  String get philosophyMoonBody2 =>
      'Ay her şeyi değiştirir. Pratiğinize bir döngü verir — bir başlangıç, bir orta, bir zirve ve bir bırakma. Yeni ayda niyet belirlediğinizde, sadece dilekler yazmıyorsunuz. İnsanlık var olmadan önce okyanusları hareket ettiren tek toprak olan toprağa tohum ekiyorsunuz.';

  @override
  String get philosophyMoonBody3 =>
      'Azalan ay bir duraklama değildir. Tüm evrelerin en zorlusudur. Herkes isteyebilir. Herkes tekrarlayabilir. Ama bırakmak — ektiğiniz şeyin karanlıkta büyüdüğüne gerçekten güvenmek ve bırakmak — bu pratiğin üzerine inşa edildiği disiplini gerektirir.';

  @override
  String get philosophyFourPhasesHeading => 'Dört Kutsal Evre';

  @override
  String get philosophyPhasePlanting => 'Ekim';

  @override
  String get philosophyPhasePlantingDesc =>
      'Karanlıkta, gerçekten neye ihtiyacınız olduğunu söylersiniz — istediğinizi değil, ruhunuzun gerektirdiğini. Yeni ay, çıplak gerçek için alan tutar.';

  @override
  String get philosophyPhaseTending => 'Bakım';

  @override
  String get philosophyPhaseTendingDesc =>
      'Işık geri dönerken, niyetlerinizi her gün tekrarlarsınız. Umut olarak değil, kesinlik olarak. Sormuyorsunuz — zaten yolda olanı hatırlıyorsunuz.';

  @override
  String get philosophyPhaseGratitude => 'Şükran';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'Tam aydınlanmada, istediğiniz şeyleri zaten elinizde tutuyormuşsunuz gibi şükredersiniz. Bu rol yapmak değildir. Bu, olduğunuz yer ile gittiğiniz yer arasındaki mesafeyi kapatan eylemdir.';

  @override
  String get philosophyPhaseRelease => 'Bırakma';

  @override
  String get philosophyPhaseReleaseDesc =>
      'Ve sonra — sessizlik. Bırakırsınız. Zorlamayı, kontrol etmeyi, sormayı bırakırsınız. Azalan ay en zor dersi öğretir: işiniz bitti ve artık sizden büyük bir şeye ait.';

  @override
  String get philosophyClosing => 'Ay karanlığa döndüğünde,\nsiz başlarsınız.';

  @override
  String get guideTitle => 'Nasıl Niyet Belirlenir';

  @override
  String get guideIntro =>
      'Dört kural. Hepsi bu. Bunlarda ustalaşın, gerisini ay halledecek.';

  @override
  String get guideRule01 => 'KURAL 01';

  @override
  String get guideRule01Title => 'İhtiyacı Söyleyin,\nİsteği Değil';

  @override
  String get guideRule01Body1 =>
      'Yüzeydeki arzu gerçek niyeti maskeler. Aslında bir milyon dolar istemiyorsunuz — güvenlik, özgürlük, endişelenmeme hissini istiyorsunuz. Niyet belirleme, maddi nesneler düzeyinde değil, duygu düzeyinde çalışır.';

  @override
  String get guideRule01Body2 =>
      'Kendinize sorun: bunu neden istiyorum? Cevap, gerçek niyetinizdir.';

  @override
  String get guideRule01Wrong1 => 'Bir milyon dolar istiyorum';

  @override
  String get guideRule01Right1 => 'Finansal özgürlüğü yaşıyorum';

  @override
  String get guideRule01Wrong2 => 'Bir partner istiyorum';

  @override
  String get guideRule01Right2 => 'Derin, sevgi dolu bağlantılarla çevriliyim';

  @override
  String get guideRule01Wrong3 => 'Terfi istiyorum';

  @override
  String get guideRule01Right3 => 'İşim için tanınıyor ve değer görüyorum';

  @override
  String get guideRule02 => 'KURAL 02';

  @override
  String get guideRule02Title => 'BEN — Söyleyeceğiniz\nEn Güçlü Sözcükler';

  @override
  String get guideRule02Body1 =>
      'İncil\'de Musa Tanrı\'nın adını sorduğunda, cevap \"BEN, BEN OLANIM\" olmuştur. Niyet belirlemeye dokunan her gelenek — Hermetik felsefeden Neville Goddard\'a, modern pratiğe kadar — \"BEN\" ifadesini gerçekliği şekillendiren bildiri olarak kabul eder.';

  @override
  String get guideRule02Body2 =>
      '\"BEN\" ifadesinin ardından gelen her şey evrene verdiğiniz emirdir. Dikkatli seçin.';

  @override
  String get guideRule02Tip1 =>
      'Her zaman olumlu — \"Sağlıklıyım\" diye, \"Hasta değilim\" değil';

  @override
  String get guideRule02Tip2 =>
      'Her zaman şimdiki zaman — \"Ben ...yım\" diye, \"Ben ...olacağım\" değil';

  @override
  String get guideRule02Tip3 =>
      'Her zaman inançla — umut olarak değil, gerçek olarak söyleyin';

  @override
  String get guideRule02Right1 =>
      'Bolluk içindeyim ve para bana kolayca akıyor';

  @override
  String get guideRule02Right2 => 'Olmakta olduğum kişiyle barışığım';

  @override
  String get guideRule02Right3 => 'Yarattığım hayata layığım';

  @override
  String get guideRule03 => 'KURAL 03';

  @override
  String get guideRule03Title => 'Zaten Olmuş Gibi\nKonuşun';

  @override
  String get guideRule03Body1 =>
      'Nasıl olacağını bilmenize gerek yok. Tek göreviniz, ilan ettiğiniz şeye zaten sahip olmanın titreşimini — hissini — tutmaktır.';

  @override
  String get guideRule03Body2 =>
      'Evren istediğinize değil, olduğunuz şeye cevap verir. Kovalamayın. İşaret aramayın. Sadece o olun.';

  @override
  String get guideRule03Wrong1 => 'Umarım bir gün huzur bulurum';

  @override
  String get guideRule03Right1 => 'Hayatımı dolduran huzur için minnettarım';

  @override
  String get guideRule03Wrong2 => 'Daha özgüvenli olmaya çalışıyorum';

  @override
  String get guideRule03Right2 => 'Özgüvenliyim. Kendime tamamen güveniyorum.';

  @override
  String get guideRule04 => 'KURAL 04';

  @override
  String get guideRule04Title => 'Şükran, Kanıttır';

  @override
  String get guideRule04Body1 =>
      'Şükran, olaydan sonra gönderilen bir teşekkür notu değildir. Almadan önce gönderdiğiniz sinyaldir — sürece güvendiğinizin evrene kanıtıdır.';

  @override
  String get guideRule04Body2 =>
      'Henüz görmediğiniz bir şey için şükrettiğinizde, istemek ile sahip olmak arasındaki boşluğu kapatırsınız. Bu, uygulamanın her dolunayda size rehberlik ettiği törendir.';

  @override
  String get guideRule04Right1 =>
      'Finansal özgürlüğün gerçeğim olduğu için çok minnettarım';

  @override
  String get guideRule04Right2 =>
      'Her gün beni saran sevgi için teşekkür ederim';

  @override
  String get guideRule04Right3 =>
      'Sağlığım, gücüm ve berraklığım için şükrederim';

  @override
  String get guideClosing =>
      'Bu sizin pratiğiniz.\nAy zamanlamayı sağlar.\nSiz gerçeği sağlarsınız.';

  @override
  String get lunarCycleTitle => 'Ay Döngüsü';

  @override
  String lunarYouAreHere(String phase) {
    return 'Buradasınız: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return '$total günün $day. günü';
  }

  @override
  String get lunarNewMoonPlant => 'Yeni Ay — Ekin';

  @override
  String get lunarNewMoonPlantDesc =>
      'Niyetlerinizi belirleyin. Gerçekten neye ihtiyacınız olduğunu söyleyin. Döngü burada başlar.';

  @override
  String get lunarNewMoonDuration => '~1 gün';

  @override
  String get lunarNewMoonStatus => 'Niyetler açık';

  @override
  String get lunarWaxingTend => 'Hilal — Bakım';

  @override
  String get lunarWaxingTendDesc =>
      'Niyetlerinizi her gün tekrarlayın. Tekrarla inanç oluşturun. Ay büyür, inancınız da.';

  @override
  String get lunarWaxingDuration => '~14 gün';

  @override
  String get lunarWaxingStatus => 'Günlük hatırlatıcılar aktif';

  @override
  String get lunarFullMoonGiveThanks => 'Dolunay — Şükredin';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'İstediğiniz şeylere zaten sahipmiş gibi şükranınızı ifade edin. Bu zirvedir — alma anıdır.';

  @override
  String get lunarFullMoonDuration => '~1 gün';

  @override
  String get lunarFullMoonStatus => 'Şükran töreni';

  @override
  String get lunarWaningRelease => 'Azalan Ay — Bırakın';

  @override
  String get lunarWaningReleaseDesc =>
      'Tamamen bırakın. Zorlamayı, kontrol etmeyi bırakın. Ektiğiniz şeyin karanlıkta büyüdüğüne güvenin.';

  @override
  String get lunarWaningDuration => '~14 gün';

  @override
  String get lunarWaningStatus => 'Pencere kapalı — sessizlik';

  @override
  String get lunarLegendManifest => 'Niyet Belirle';

  @override
  String get lunarLegendRelease => 'Bırak';

  @override
  String get lunarThisCycle => 'Bu Döngü';

  @override
  String get lunarNow => 'ŞİMDİ';

  @override
  String get cycleDiagramNewMoon => 'Yeni Ay';

  @override
  String get cycleDiagramWaxingCrescent => 'İlk\nHilal';

  @override
  String get cycleDiagramFirstQuarter => 'İlk\nDördün';

  @override
  String get cycleDiagramWaxingGibbous => 'Şişkin\nHilal';

  @override
  String get cycleDiagramFullMoon => 'Dolunay';

  @override
  String get cycleDiagramWaningGibbous => 'Şişkin\nAzalan';

  @override
  String get cycleDiagramLastQuarter => 'Son\nDördün';

  @override
  String get cycleDiagramWaningCrescent => 'Azalan\nHilal';

  @override
  String get cycleDiagramManifest => 'NİYET BELİRLE';

  @override
  String get cycleDiagramRelease => 'BIRAK';

  @override
  String get cycleThisCycle => 'Bu Döngü';

  @override
  String get cycleSeeFullDetails => 'Döngü detaylarını gör';

  @override
  String debugLabel(String info) {
    return 'HATA AYIKLAMA: $info';
  }

  @override
  String get debugLive => 'canlı';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsNotifications => 'Bildirimler';

  @override
  String get settingsReminderFrequency => 'Hatırlatıcı sıklığı (günde kaç kez)';

  @override
  String get settingsWakeWindow => 'Uyanıklık penceresi';

  @override
  String get settingsWakeWindowStart => 'Başlangıç';

  @override
  String get settingsWakeWindowEnd => 'Bitiş';

  @override
  String get settingsMoonStyle => 'Ay Stili';

  @override
  String get settingsMoonStyleDescription =>
      'Uygulama genelinde ayın nasıl görüneceğini seçin';

  @override
  String get settingsMoonStyleClassic => 'Klasik';

  @override
  String get settingsMoonStyleStarfield => 'Yıldız Alanı';

  @override
  String get settingsMoonStyleAura => 'Aura';

  @override
  String get settingsMoonStyleHalo => 'Hale';

  @override
  String get settingsData => 'Veri';

  @override
  String get settingsExportData => 'Verileri Dışa Aktar';

  @override
  String get settingsImportData => 'Verileri İçe Aktar';

  @override
  String get settingsAbout => 'Hakkında';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest, niyetlerinizi ay döngüsüyle uyumlamaya yardımcı olmak için tasarlanmış kişisel bir ritüel arkadaşıdır. Her yeni ayda en fazla üç niyet belirler ve sonraki 28 günü günlük şükran ve düşünce yoluyla onları besleyerek geçirirsiniz. Verileriniz cihazınızda güvenle saklanır ve hiçbir zaman herhangi bir sunucuya gönderilmez. Şifreli bir yedek oluşturmak için dışa aktarma özelliğini kullanın ve pratiğinizi geri yüklemek için yeni bir cihazda içe aktarın.';

  @override
  String get settingsManifestationGuide => 'Niyet Belirleme Rehberi';

  @override
  String get settingsExportPasswordTitle => 'Dışa Aktarma Şifresi Belirle';

  @override
  String get settingsImportPasswordTitle => 'İçe Aktarma Şifresini Gir';

  @override
  String get settingsPasswordHint => 'Şifre';

  @override
  String settingsExportFailed(String error) {
    return 'Dışa aktarma başarısız: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Dosya okunamadı.';

  @override
  String get settingsDataImported => 'Veriler başarıyla içe aktarıldı.';

  @override
  String get settingsWrongPassword => 'Yanlış şifre veya bozuk dosya.';

  @override
  String settingsImportFailed(String error) {
    return 'İçe aktarma başarısız: $error';
  }

  @override
  String get settingsExportSubject => 'Moon Manifest Yedek';

  @override
  String get historyTitle => 'Geçmiş';

  @override
  String get historyNoCompletedCycles => 'Henüz tamamlanmış döngü yok';

  @override
  String get historyOngoing => 'Devam ediyor';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count niyet',
      one: '1 niyet',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'Niyetler';

  @override
  String get historyGratitudesLabel => 'Şükranlar';

  @override
  String get phaseNewMoon => 'Yeni Ay';

  @override
  String get phaseWaxing => 'Hilal';

  @override
  String get phaseFullMoon => 'Dolunay';

  @override
  String get phaseWaning => 'Azalan Ay';

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
  String get wisdom1 => 'Aradığın şey seni arıyor.';

  @override
  String get wisdom1Author => 'Mevlana';

  @override
  String get wisdom2 =>
      'Evren senin dışında değil. Kendine bak; istediğin her şey zaten sensin.';

  @override
  String get wisdom2Author => 'Mevlana';

  @override
  String get wisdom3 => 'Bekleyişe güven. Belirsizliği kucakla.';

  @override
  String get wisdom4 => 'İstediğin şeyi çekmezsin. Olduğun şeyi çekersin.';

  @override
  String get wisdom5 => 'Olduğum şeyi bıraktığımda, olabileceğim şey olurum.';

  @override
  String get wisdom5Author => 'Lao Tzu';

  @override
  String get wisdom6 => 'Doğa acele etmez, yine de her şey tamamlanır.';

  @override
  String get wisdom6Author => 'Lao Tzu';

  @override
  String get wisdom7 =>
      'Dileğinin gerçekleşmiş hissini yaşa ve dikkatinin izlediği yolu gözlemle.';

  @override
  String get wisdom7Author => 'Neville Goddard';

  @override
  String get wisdom8 =>
      'İnsanın en büyük yanılgısı, kendi bilinç durumu dışında başka sebepler olduğuna olan inancıdır.';

  @override
  String get wisdom8Author => 'Neville Goddard';

  @override
  String get wisdom9 =>
      'Her zaman öğrencisiniz, asla usta değil. İlerlemeye devam etmelisiniz.';

  @override
  String get wisdom9Author => 'Conrad Hall';

  @override
  String get wisdom10 =>
      'Bu kadar küçük davranmayı bırak. Sen coşkuyla hareket eden evrensin.';

  @override
  String get wisdom10Author => 'Mevlana';

  @override
  String get wisdom11 =>
      'Şimdiki an her zaman var olmuş olacak. Bunda huzur bul.';

  @override
  String get wisdom12 =>
      'Bırakmak bize özgürlük verir ve özgürlük mutluluğun tek koşuludur.';

  @override
  String get wisdom12Author => 'Thich Nhat Hanh';

  @override
  String get wisdom13 =>
      'Teslim olmak vazgeçmek değildir. Daha büyük bir şeye bırakmaktır.';

  @override
  String get wisdom14 =>
      'Şu anda içinde, dünyanın sana ne fırlatırsa fırlatsın başa çıkman için gereken her şey var.';

  @override
  String get wisdom14Author => 'Brian Tracy';

  @override
  String get wisdom15 => 'Ne kadar sessizleşirsen, o kadar çok duyabilirsin.';

  @override
  String get wisdom15Author => 'Mevlana';

  @override
  String get wisdom16 =>
      'Görevin sevgiyi aramak değil, sadece sevgiye karşı kendi içinde kurduğun tüm engelleri bulmak ve kaldırmaktır.';

  @override
  String get wisdom16Author => 'Mevlana';

  @override
  String get wisdom17 =>
      'İnanç, tüm merdiveni görmesen bile ilk adımı atmaktır.';

  @override
  String get wisdom17Author => 'Martin Luther King Jr.';

  @override
  String get wisdom18 => 'Tohum toprakla savaşmaz. Sadece büyür.';

  @override
  String get wisdom19 =>
      'Nasıl olacağını bilme ihtiyacını bırak. Evrenin yolu bildiğine güven.';

  @override
  String get wisdom20 =>
      'Kendinizi ruhu olan bir beden olarak değil, bedeni olan bir ruh olarak görmeye başlayın.';

  @override
  String get wisdom20Author => 'Wayne Dyer';

  @override
  String get wisdom21 =>
      'Dışarıda olup biteni her zaman kontrol edemezsiniz. Ama içeride olup biteni her zaman kontrol edebilirsiniz.';

  @override
  String get wisdom21Author => 'Wayne Dyer';

  @override
  String get wisdom22 => 'Sabır pasif bekleyiş değildir. Aktif güvendir.';

  @override
  String get wisdom23 =>
      'İhtiyacın olan her şey zaten içinde, açılmayı bekliyor.';

  @override
  String get wisdom24 =>
      'Ay savaşmaz. İzler. Ve izleyerek her şeyi bir arada tutar.';

  @override
  String get wisdom25 =>
      'Hayatınızda gerçekleştirmek istediğiniz şey zaten bir gerçekmiş gibi davranın.';

  @override
  String get wisdom25Author => 'Wayne Dyer';

  @override
  String get wisdom26 => 'Sessiz ol ve bil.';

  @override
  String get wisdom27 => 'Dalları bırak ve nehre güven.';

  @override
  String get wisdom28 => 'Yara, ışığın sana girdiği yerdir.';

  @override
  String get wisdom28Author => 'Mevlana';

  @override
  String get wisdom29 =>
      'Limandaki gemi güvendedir, ama gemiler bunun için yapılmamıştır.';

  @override
  String get wisdom29Author => 'John A. Shedd';

  @override
  String get wisdom30 =>
      'Evren her zaman bizimle konuşuyor. Bize küçük mesajlar gönderiyor, tesadüfler ve rastlantılar yaratıyor. Tek soru şu: dinliyor muyuz?';

  @override
  String get wisdom30Author => 'Nancy Thayer';
}
