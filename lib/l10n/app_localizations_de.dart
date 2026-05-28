// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Willkommen bei\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'Diese App begleitet dich bei einer Manifestationspraxis, die mit dem Mond verbunden ist.';

  @override
  String get onboardingCycleTitle => 'Der Zyklus';

  @override
  String get onboardingCycleBody =>
      'Jeder Mondmonat durchläuft vier verschiedene Phasen, jede mit ihrer eigenen Energie.';

  @override
  String get onboardingWhatYouDoTitle => 'Was du tun wirst';

  @override
  String get onboardingNewMoonDesc =>
      'Setze Intentionen und pflanze Samen für neue Anfänge.';

  @override
  String get onboardingWaxingDesc =>
      'Handle und baue Schwung auf dem Weg zu deinen Zielen auf.';

  @override
  String get onboardingFullMoonDesc =>
      'Feiere Erfolge und lass los, was dir nicht mehr dient.';

  @override
  String get onboardingWaningDesc =>
      'Reflektiere, ruhe dich aus und integriere die Lektionen.';

  @override
  String get onboardingPreferencesTitle => 'Deine Einstellungen';

  @override
  String get onboardingPreferencesSubtitle =>
      'Passe an, wie und wann du Anleitungen erhältst.';

  @override
  String get onboardingNotificationFrequency => 'Benachrichtigungshäufigkeit';

  @override
  String get onboardingNotificationFrequencyHint =>
      'Wie oft am Tag möchtest du erinnert werden?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / Tag';
  }

  @override
  String get onboardingWakeWindow => 'Wachfenster';

  @override
  String get onboardingWakeWindowHint =>
      'Keine Benachrichtigungen außerhalb dieser Zeiten.';

  @override
  String get onboardingWakeUp => 'Aufwachen';

  @override
  String get onboardingWindDown => 'Zur Ruhe kommen';

  @override
  String get onboardingButtonContinue => 'Weiter';

  @override
  String get onboardingButtonBegin => 'Beginnen';

  @override
  String get waitingWindowNotOpen =>
      'Das Manifestationsfenster ist noch nicht geöffnet';

  @override
  String waitingFirstCycle(String date) {
    return 'Dein erster Zyklus beginnt zum Neumond am $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'noch $count Tage',
      one: 'noch ein Tag',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Bereite dich vor, während du wartest';

  @override
  String get waitingLearnManifest => 'Lerne, wie man manifestiert';

  @override
  String get waitingLearnManifestSubtitle =>
      'Die 4 Regeln, die diese Praxis wirksam machen';

  @override
  String get waitingUnderstandCycle => 'Verstehe den Mondzyklus';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Sieh, wo du stehst und was jede Phase bedeutet';

  @override
  String get waitingDraftIntentionsTitle => 'Entwirf deine Intentionen';

  @override
  String get waitingDraftIntentionsBody =>
      'Nutze diesen Raum zum Nachdenken und Vorbereiten. Was möchtest du in dein Leben rufen?';

  @override
  String waitingIntentionHint(int number) {
    return 'Intention $number…';
  }

  @override
  String get waitingAddIntention => 'Intention hinzufügen';

  @override
  String get waitingMaxIntentionsMessage =>
      'Sieben Intentionen sind eine bedeutsame Zahl. Wähle sorgfältig, was dir am wichtigsten ist.';

  @override
  String get waitingDraftSaved => 'Entwurf gespeichert';

  @override
  String get commonSomethingWentWrong => 'Etwas ist schiefgelaufen.';

  @override
  String get newMoonSetIntentions => 'Neumond.\nSetze deine Intentionen.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Schonfrist endet $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Frage dich: Was brauche ich wirklich hinter meinen Wünschen? Setze Intentionen, die zu deinen tieferen Bedürfnissen sprechen — Wachstum, Verbindung, Frieden, Fülle.';

  @override
  String get newMoonHowToWrite => 'Wie du kraftvolle Intentionen schreibst';

  @override
  String get newMoonYourIntentions => 'Deine Intentionen';

  @override
  String newMoonIntentionHint(int number) {
    return 'Intention $number…';
  }

  @override
  String get newMoonAddIntention => 'Intention hinzufügen';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Sieben Intentionen sind eine bedeutsame Zahl. Wähle sorgfältig, was dir am wichtigsten ist.';

  @override
  String get newMoonPlantIntentions => 'Diese Intentionen pflanzen';

  @override
  String get newMoonLockedTitle =>
      'Das sind deine Intentionen für diesen Zyklus.';

  @override
  String get newMoonLockedSubtitleEditing =>
      'Bearbeite deine Intentionen unten.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'Sie wurden gepflanzt. Vertraue dem Prozess.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Intention $number...';
  }

  @override
  String get newMoonEditIntentions => 'Intentionen bearbeiten';

  @override
  String get newMoonEditUntilWaxing =>
      'Du kannst bearbeiten, bis die zunehmende Phase beginnt.';

  @override
  String get newMoonSaveChanges => 'Änderungen speichern';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Tag $day des zunehmenden Mondes.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Morgen ist Vollmond.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Vollmond in $count Tagen.';
  }

  @override
  String get waxingYourIntentions => 'Deine Intentionen';

  @override
  String get waxingUnableToLoad => 'Intentionen konnten nicht geladen werden.';

  @override
  String get waxingNoIntentionsFound =>
      'Keine Intentionen für diesen Zyklus gefunden.';

  @override
  String get fullMoonNoIntentionsSet =>
      'In diesem Zyklus wurden keine Intentionen gesetzt';

  @override
  String get fullMoonWorkDone => 'Die Arbeit ist getan.';

  @override
  String get fullMoonNowRelease => 'Jetzt lass los.';

  @override
  String fullMoonWaningNext(String date) {
    return 'Die abnehmende Phase beginnt bald.\nDein nächster Zyklus beginnt zum Neumond am $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Vollmond. Sei dankbar.';

  @override
  String get fullMoonGracePeriodActive => 'Schonfrist aktiv';

  @override
  String get fullMoonThankUniverse =>
      'Danke dem Universum, als hättest du bereits, worum du gebeten hast';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current von $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Ich bin so dankbar, dass…';

  @override
  String get fullMoonCompleteCeremony => 'Zeremonie abschließen';

  @override
  String get fullMoonNextIntention => 'Nächste Intention';

  @override
  String get waningWindowClosed => 'Das Manifestationsfenster ist geschlossen';

  @override
  String waningOpensAgain(int count) {
    return 'Öffnet sich in $count Tagen zum Neumond wieder';
  }

  @override
  String get waningReleaseTrust => 'Lass los. Vertraue.';

  @override
  String get waningWorkDone => 'Die Arbeit ist getan.';

  @override
  String get waningNextNewMoon => 'Nächster Neumond';

  @override
  String get waningWhyQuiet => 'Warum ist es still?';

  @override
  String get philosophyTitle => 'Warum ist das Fenster\njetzt geschlossen?';

  @override
  String get philosophyBody1 =>
      'Manifestation funktioniert nicht nach deinem Zeitplan — sie folgt dem des Mondes. Der Mondzyklus hat bestimmte Fenster, in denen das Setzen von Intentionen kraftvoll ist, und Phasen, in denen das Mächtigste, was du tun kannst, nichts ist.';

  @override
  String get philosophyBody2 =>
      'Im Moment nimmt der Mond ab — er schrumpft in die Dunkelheit. Dies ist die Phase des Loslassens. Deine Intentionen aus diesem Zyklus wurden gepflanzt, gepflegt und in Dankbarkeit dargebracht. Jetzt brauchen sie Raum, um Wurzeln zu schlagen. Stärker zu drängen hilft in dieser Phase nicht. Es stört.';

  @override
  String get philosophyBody3 =>
      'Wenn der Neumond kommt, öffnet sich das Fenster wieder. Dann setzt du frische Intentionen und beginnst einen neuen Zyklus. Das Warten ist keine verlorene Zeit — es ist Teil der Praxis. Die Disziplin des Loslassens ist es, die Manifestation vom bloßen Wünschen unterscheidet.';

  @override
  String get philosophyDaysUntilOpen => 'Tage, bis das Fenster sich öffnet';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Erinnerung gesetzt für $date';
  }

  @override
  String get philosophyRemindMe => 'Erinnere mich, wenn es sich öffnet';

  @override
  String get philosophyCouldNotSchedule =>
      'Erinnerung konnte nicht geplant werden';

  @override
  String get philosophyNotificationTitle =>
      'Das Manifestationsfenster ist geöffnet.';

  @override
  String get philosophyNotificationBody => 'Setze jetzt deine Intentionen.';

  @override
  String get philosophyHookTitle => 'Was sie wissen\nund du nicht';

  @override
  String get philosophyHookBody1 =>
      'Die erfolgreichsten Menschen der Erde setzen nicht einfach Ziele. Sie arbeiten mit dem Timing. Sie verstehen etwas, das die meisten nie begreifen werden: dass das Universum einen Rhythmus hat, und wer sich darauf einstimmt, jagt keine Ergebnisse — die Ergebnisse jagen sie.';

  @override
  String get philosophyHookBody2 =>
      'Das ist kein Geheimnis. Es ist uraltes Wissen — seit Tausenden von Jahren praktiziert von jenen, die Imperien formten, Dynastien aufbauten und die Welt leise bewegten. Der Mond war ihre Uhr. «ICH BIN» war ihre Sprache. Und Hingabe war ihr Preis.';

  @override
  String get philosophyHookBody3 =>
      'Das haben sie verstanden: Manifestation ist einfach. Nicht leicht — einfach. Du erklärst, was du wirst. Du wiederholst es, bis dein Verstand es glaubt. Du bist dankbar, bevor du Beweise siehst. Und dann lässt du los. Vollständig.';

  @override
  String get philosophyHookBody4 =>
      'Die meisten scheitern, weil sie sich nicht dem Prozess verpflichten. Sie wollen das Ergebnis ohne die Disziplin. Sie manifestieren einen Tag lang, suchen Zeichen und geben auf, wenn bis Dienstag nichts passiert. Das ist keine Manifestation. Das ist bloßes Wünschen.';

  @override
  String get philosophyMoonHeading => 'Der Mond ist das fehlende Stück';

  @override
  String get philosophyMoonBody1 =>
      'Wahrscheinlich hast du schon Affirmationen ausprobiert. Wahrscheinlich hast du «Ich bin reichhaltig» vor dem Spiegel gesagt und nichts hat sich verändert. Das liegt daran, dass du ins Leere gesprochen hast — ohne Timing, ohne Struktur, ohne kosmische Ausrichtung hinter deinen Worten.';

  @override
  String get philosophyMoonBody2 =>
      'Der Mond verändert alles. Er gibt deiner Praxis einen Zyklus — einen Anfang, eine Mitte, einen Höhepunkt und eine Freisetzung. Wenn du bei Neumond Intentionen setzt, schreibst du nicht einfach Wünsche. Du pflanzt Samen in den einzigen Boden, der seit vor der Existenz der Menschen Ozeane bewegt.';

  @override
  String get philosophyMoonBody3 =>
      'Der abnehmende Mond ist keine Pause. Er ist die anspruchsvollste Phase von allen. Jeder kann bitten. Jeder kann wiederholen. Aber loslassen — wirklich loslassen und darauf vertrauen, dass das Gepflanzte in der Dunkelheit wächst — das erfordert die Disziplin, auf der diese Praxis aufgebaut ist.';

  @override
  String get philosophyFourPhasesHeading => 'Die vier heiligen Phasen';

  @override
  String get philosophyPhasePlanting => 'Die Aussaat';

  @override
  String get philosophyPhasePlantingDesc =>
      'In der Dunkelheit benennst du, was du brauchst — nicht was du willst, sondern was deine Seele braucht. Der Neumond hält Raum für die nackte Wahrheit.';

  @override
  String get philosophyPhaseTending => 'Die Pflege';

  @override
  String get philosophyPhaseTendingDesc =>
      'Wenn das Licht zurückkehrt, wiederholst du deine Intentionen täglich. Nicht als Hoffnung, sondern als Gewissheit. Du bittest nicht — du erinnerst dich an das, was bereits auf dem Weg ist.';

  @override
  String get philosophyPhaseGratitude => 'Die Dankbarkeit';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'Bei voller Erleuchtung bist du dankbar, als hättest du bereits, worum du gebeten hast. Das ist kein Vortäuschen. Es ist die Handlung, die den Abstand zwischen dem, wo du bist, und dem, wohin du gehst, zusammenfallen lässt.';

  @override
  String get philosophyPhaseRelease => 'Das Loslassen';

  @override
  String get philosophyPhaseReleaseDesc =>
      'Und dann — Stille. Du lässt los. Du hörst auf zu drängen, zu prüfen, zu fragen. Der abnehmende Mond lehrt die schwerste Lektion: dass deine Arbeit getan ist, und sie nun etwas Größerem als dir gehört.';

  @override
  String get philosophyClosing =>
      'Wenn der Mond zurück in die Dunkelheit kehrt,\nbeginnst du.';

  @override
  String get guideTitle => 'Wie man manifestiert';

  @override
  String get guideIntro =>
      'Vier Regeln. Das ist alles. Meistere sie und der Mond erledigt den Rest.';

  @override
  String get guideRule01 => 'REGEL 01';

  @override
  String get guideRule01Title => 'Benenne das Bedürfnis,\nnicht den Wunsch';

  @override
  String get guideRule01Body1 =>
      'Der oberflächliche Wunsch verbirgt die wahre Intention. Du willst eigentlich keine Million Dollar — du willst das Gefühl von Sicherheit, Freiheit, Sorglosigkeit. Manifestation wirkt auf der Ebene des Gefühls, nicht der materiellen Objekte.';

  @override
  String get guideRule01Body2 =>
      'Frage dich: Warum will ich das? Die Antwort ist deine wahre Intention.';

  @override
  String get guideRule01Wrong1 => 'Ich will eine Million Dollar';

  @override
  String get guideRule01Right1 => 'Ich erlebe finanzielle Freiheit';

  @override
  String get guideRule01Wrong2 => 'Ich will einen Partner';

  @override
  String get guideRule01Right2 =>
      'Ich bin umgeben von tiefer, liebevoller Verbindung';

  @override
  String get guideRule01Wrong3 => 'Ich will eine Beförderung';

  @override
  String get guideRule01Right3 =>
      'Ich werde für meine Arbeit anerkannt und geschätzt';

  @override
  String get guideRule02 => 'REGEL 02';

  @override
  String get guideRule02Title =>
      'ICH BIN — Die mächtigsten\nWorte, die du je sprechen wirst';

  @override
  String get guideRule02Body1 =>
      'In der Bibel, als Mose nach Gottes Namen fragte, war die Antwort «ICH BIN, DER ICH BIN.» Jede Tradition, die Manifestation berührt hat — von der hermetischen Philosophie über Neville Goddard bis zur modernen Praxis — behandelt «ICH BIN» als die Erklärung, die die Realität formt.';

  @override
  String get guideRule02Body2 =>
      'Was auf «ICH BIN» folgt, wird dein Befehl an das Universum. Wähle mit Bedacht.';

  @override
  String get guideRule02Tip1 =>
      'Immer positiv — «Ich bin gesund», nicht «Ich bin nicht krank»';

  @override
  String get guideRule02Tip2 =>
      'Immer in der Gegenwartsform — «Ich bin», nicht «Ich werde sein»';

  @override
  String get guideRule02Tip3 =>
      'Immer mit Überzeugung — sprich es als Wahrheit, nicht als Hoffnung';

  @override
  String get guideRule02Right1 =>
      'Ich bin in Fülle und Geld fließt leicht zu mir';

  @override
  String get guideRule02Right2 => 'Ich bin im Frieden mit dem, was ich werde';

  @override
  String get guideRule02Right3 =>
      'Ich bin würdig des Lebens, das ich erschaffe';

  @override
  String get guideRule03 => 'REGEL 03';

  @override
  String get guideRule03Title => 'Sprich so, als wäre\nes bereits geschehen';

  @override
  String get guideRule03Body1 =>
      'Du musst nicht wissen, wie es geschehen wird. Deine einzige Aufgabe ist es, die Schwingung — das Gefühl — zu halten, dass du bereits hast, was du erklärt hast.';

  @override
  String get guideRule03Body2 =>
      'Das Universum antwortet nicht auf das, was du willst. Es antwortet auf das, was du bist. Jage nicht. Suche keine Zeichen. Sei es einfach.';

  @override
  String get guideRule03Wrong1 => 'Ich hoffe, eines Tages Frieden zu finden';

  @override
  String get guideRule03Right1 =>
      'Ich bin dankbar für den Frieden, der mein Leben erfüllt';

  @override
  String get guideRule03Wrong2 => 'Ich versuche, selbstbewusster zu werden';

  @override
  String get guideRule03Right2 =>
      'Ich bin selbstbewusst. Ich vertraue mir vollkommen.';

  @override
  String get guideRule04 => 'REGEL 04';

  @override
  String get guideRule04Title => 'Dankbarkeit ist der Beweis';

  @override
  String get guideRule04Body1 =>
      'Dankbarkeit ist kein Dankesbrief nach der Tatsache. Es ist das Signal, das du sendest, bevor du empfängst — der Beweis für das Universum, dass du dem Prozess vertraust.';

  @override
  String get guideRule04Body2 =>
      'Wenn du für etwas dankst, das du noch nicht gesehen hast, lässt du den Abstand zwischen Wollen und Haben zusammenfallen. Das ist die Zeremonie, durch die dich diese App bei jedem Vollmond führt.';

  @override
  String get guideRule04Right1 =>
      'Ich bin so dankbar, dass finanzielle Freiheit meine Realität ist';

  @override
  String get guideRule04Right2 =>
      'Danke für die Liebe, die mich jeden Tag umgibt';

  @override
  String get guideRule04Right3 =>
      'Ich bin dankbar für meine Gesundheit, meine Kraft, meine Klarheit';

  @override
  String get guideClosing =>
      'Das ist deine Praxis.\nDer Mond gibt das Timing vor.\nDu gibst die Wahrheit.';

  @override
  String get lunarCycleTitle => 'Der Mondzyklus';

  @override
  String lunarYouAreHere(String phase) {
    return 'Du bist hier: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'Tag $day von $total';
  }

  @override
  String get lunarNewMoonPlant => 'Neumond — Aussaat';

  @override
  String get lunarNewMoonPlantDesc =>
      'Setze deine Intentionen. Benenne, was du wirklich brauchst. Hier beginnt der Zyklus.';

  @override
  String get lunarNewMoonDuration => '~1 Tag';

  @override
  String get lunarNewMoonStatus => 'Intentionen offen';

  @override
  String get lunarWaxingTend => 'Zunehmend — Pflege';

  @override
  String get lunarWaxingTendDesc =>
      'Wiederhole deine Intentionen täglich. Baue Glauben durch Wiederholung auf. Der Mond wächst, und deine Überzeugung auch.';

  @override
  String get lunarWaxingDuration => '~14 Tage';

  @override
  String get lunarWaxingStatus => 'Tägliche Erinnerungen aktiv';

  @override
  String get lunarFullMoonGiveThanks => 'Vollmond — Dankbarkeit';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Drücke Dankbarkeit aus, als hättest du bereits, worum du gebeten hast. Das ist der Höhepunkt — der Moment des Empfangens.';

  @override
  String get lunarFullMoonDuration => '~1 Tag';

  @override
  String get lunarFullMoonStatus => 'Dankbarkeits-Zeremonie';

  @override
  String get lunarWaningRelease => 'Abnehmend — Loslassen';

  @override
  String get lunarWaningReleaseDesc =>
      'Lass vollständig los. Hör auf zu drängen, zu prüfen. Vertraue, dass das Gepflanzte in der Dunkelheit wächst.';

  @override
  String get lunarWaningDuration => '~14 Tage';

  @override
  String get lunarWaningStatus => 'Fenster geschlossen — Stille';

  @override
  String get lunarLegendManifest => 'Manifestieren';

  @override
  String get lunarLegendRelease => 'Loslassen';

  @override
  String get lunarThisCycle => 'Dieser Zyklus';

  @override
  String get lunarNow => 'JETZT';

  @override
  String get cycleDiagramNewMoon => 'Neumond';

  @override
  String get cycleDiagramWaxingCrescent => 'Zunehmende\nSichel';

  @override
  String get cycleDiagramFirstQuarter => 'Erstes\nViertel';

  @override
  String get cycleDiagramWaxingGibbous => 'Zunehmender\nMond';

  @override
  String get cycleDiagramFullMoon => 'Vollmond';

  @override
  String get cycleDiagramWaningGibbous => 'Abnehmender\nMond';

  @override
  String get cycleDiagramLastQuarter => 'Letztes\nViertel';

  @override
  String get cycleDiagramWaningCrescent => 'Abnehmende\nSichel';

  @override
  String get cycleDiagramManifest => 'MANIFESTIEREN';

  @override
  String get cycleDiagramRelease => 'LOSLASSEN';

  @override
  String get cycleThisCycle => 'Dieser Zyklus';

  @override
  String get cycleSeeFullDetails => 'Vollständige Zyklusdetails ansehen';

  @override
  String debugLabel(String info) {
    return 'DEBUG: $info';
  }

  @override
  String get debugLive => 'live';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsNotifications => 'Benachrichtigungen';

  @override
  String get settingsReminderFrequency => 'Erinnerungshäufigkeit (mal pro Tag)';

  @override
  String get settingsWakeWindow => 'Wachfenster';

  @override
  String get settingsWakeWindowStart => 'Beginn';

  @override
  String get settingsWakeWindowEnd => 'Ende';

  @override
  String get settingsMoonStyle => 'Mondstil';

  @override
  String get settingsMoonStyleDescription =>
      'Wähle, wie der Mond in der App aussieht';

  @override
  String get settingsMoonStyleClassic => 'Klassisch';

  @override
  String get settingsMoonStyleStarfield => 'Sternenfeld';

  @override
  String get settingsMoonStyleAura => 'Aura';

  @override
  String get settingsMoonStyleHalo => 'Halo';

  @override
  String get settingsData => 'Daten';

  @override
  String get settingsExportData => 'Daten exportieren';

  @override
  String get settingsImportData => 'Daten importieren';

  @override
  String get settingsAbout => 'Über';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest ist ein persönlicher Ritual-Begleiter, der dir hilft, deine Intentionen mit dem Mondzyklus in Einklang zu bringen. Bei jedem Neumond setzt du bis zu drei Intentionen und verbringst die folgenden 28 Tage damit, sie durch tägliche Dankbarkeit und Reflexion zu nähren. Deine Daten werden sicher auf deinem Gerät gespeichert und niemals an einen Server gesendet. Nutze die Exportfunktion, um eine verschlüsselte Sicherung zu erstellen, und importiere sie auf einem neuen Gerät, um deine Praxis wiederherzustellen.';

  @override
  String get settingsManifestationGuide => 'Manifestations-Leitfaden';

  @override
  String get settingsExportPasswordTitle => 'Export-Passwort festlegen';

  @override
  String get settingsImportPasswordTitle => 'Import-Passwort eingeben';

  @override
  String get settingsPasswordHint => 'Passwort';

  @override
  String settingsExportFailed(String error) {
    return 'Export fehlgeschlagen: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Datei konnte nicht gelesen werden.';

  @override
  String get settingsDataImported => 'Daten erfolgreich importiert.';

  @override
  String get settingsWrongPassword =>
      'Falsches Passwort oder beschädigte Datei.';

  @override
  String settingsImportFailed(String error) {
    return 'Import fehlgeschlagen: $error';
  }

  @override
  String get settingsExportSubject => 'Moon Manifest Sicherung';

  @override
  String get historyTitle => 'Verlauf';

  @override
  String get historyNoCompletedCycles => 'Noch keine abgeschlossenen Zyklen';

  @override
  String get historyOngoing => 'Laufend';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Intentionen',
      one: '1 Intention',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'Intentionen';

  @override
  String get historyGratitudesLabel => 'Dankbarkeiten';

  @override
  String get phaseNewMoon => 'Neumond';

  @override
  String get phaseWaxing => 'Zunehmend';

  @override
  String get phaseFullMoon => 'Vollmond';

  @override
  String get phaseWaning => 'Abnehmend';

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
  String get wisdom1 => 'Was du suchst, sucht auch dich.';

  @override
  String get wisdom1Author => 'Rumi';

  @override
  String get wisdom2 =>
      'Das Universum ist nicht außerhalb von dir. Schau in dich hinein; alles, was du willst, bist du bereits.';

  @override
  String get wisdom2Author => 'Rumi';

  @override
  String get wisdom3 => 'Vertraue dem Warten. Umarme die Ungewissheit.';

  @override
  String get wisdom4 =>
      'Du ziehst nicht an, was du willst. Du ziehst an, was du bist.';

  @override
  String get wisdom5 =>
      'Wenn ich loslasse, was ich bin, werde ich, was ich sein könnte.';

  @override
  String get wisdom5Author => 'Lao Tzu';

  @override
  String get wisdom6 => 'Die Natur eilt nicht, und doch ist alles vollbracht.';

  @override
  String get wisdom6Author => 'Lao Tzu';

  @override
  String get wisdom7 =>
      'Nimm das Gefühl deines erfüllten Wunsches an und beobachte den Weg, den deine Aufmerksamkeit nimmt.';

  @override
  String get wisdom7Author => 'Neville Goddard';

  @override
  String get wisdom8 =>
      'Die größte Täuschung des Menschen ist seine Überzeugung, dass es Ursachen außerhalb seines eigenen Bewusstseinszustandes gibt.';

  @override
  String get wisdom8Author => 'Neville Goddard';

  @override
  String get wisdom9 =>
      'Du bist immer Schüler, nie Meister. Du musst immer weiter vorangehen.';

  @override
  String get wisdom9Author => 'Conrad Hall';

  @override
  String get wisdom10 =>
      'Hör auf, dich so klein zu verhalten. Du bist das Universum in ekstatischer Bewegung.';

  @override
  String get wisdom10Author => 'Rumi';

  @override
  String get wisdom11 =>
      'Der gegenwärtige Moment wird immer gewesen sein. Ruhe darin.';

  @override
  String get wisdom12 =>
      'Loslassen gibt uns Freiheit, und Freiheit ist die einzige Voraussetzung für Glück.';

  @override
  String get wisdom12Author => 'Thich Nhat Hanh';

  @override
  String get wisdom13 =>
      'Sich ergeben heißt nicht aufzugeben. Es heißt, sich etwas Größerem hinzugeben.';

  @override
  String get wisdom14 =>
      'Du hast gerade jetzt alles in dir, was du brauchst, um mit allem umzugehen, was die Welt dir entgegenwerfen kann.';

  @override
  String get wisdom14Author => 'Brian Tracy';

  @override
  String get wisdom15 => 'Je stiller du wirst, desto mehr kannst du hören.';

  @override
  String get wisdom15Author => 'Rumi';

  @override
  String get wisdom16 =>
      'Deine Aufgabe ist es nicht, nach Liebe zu suchen, sondern alle Barrieren in dir zu finden, die du gegen sie errichtet hast.';

  @override
  String get wisdom16Author => 'Rumi';

  @override
  String get wisdom17 =>
      'Glaube bedeutet, den ersten Schritt zu tun, auch wenn du die ganze Treppe nicht siehst.';

  @override
  String get wisdom17Author => 'Martin Luther King Jr.';

  @override
  String get wisdom18 =>
      'Der Same kämpft nicht gegen die Erde. Er wächst einfach.';

  @override
  String get wisdom19 =>
      'Lass das Bedürfnis los zu wissen, wie. Vertraue darauf, dass das Universum den Weg kennt.';

  @override
  String get wisdom20 =>
      'Beginne, dich als Seele mit einem Körper zu sehen, statt als Körper mit einer Seele.';

  @override
  String get wisdom20Author => 'Wayne Dyer';

  @override
  String get wisdom21 =>
      'Du kannst nicht immer kontrollieren, was draußen passiert. Aber du kannst immer kontrollieren, was drinnen passiert.';

  @override
  String get wisdom21Author => 'Wayne Dyer';

  @override
  String get wisdom22 =>
      'Geduld ist kein passives Warten. Sie ist aktives Vertrauen.';

  @override
  String get wisdom23 =>
      'Alles, was du brauchst, ist bereits in dir und wartet darauf, sich zu entfalten.';

  @override
  String get wisdom24 =>
      'Der Mond kämpft nicht. Er beobachtet. Und durch das Beobachten hält er alles zusammen.';

  @override
  String get wisdom25 =>
      'Handle so, als wäre das, was du in deinem Leben manifestieren willst, bereits Wirklichkeit.';

  @override
  String get wisdom25Author => 'Wayne Dyer';

  @override
  String get wisdom26 => 'Sei still und wisse.';

  @override
  String get wisdom27 => 'Lass die Äste los und vertraue dem Fluss.';

  @override
  String get wisdom28 =>
      'Die Wunde ist der Ort, an dem das Licht in dich eintritt.';

  @override
  String get wisdom28Author => 'Rumi';

  @override
  String get wisdom29 =>
      'Ein Schiff im Hafen ist sicher, aber dafür werden Schiffe nicht gebaut.';

  @override
  String get wisdom29Author => 'John A. Shedd';

  @override
  String get wisdom30 =>
      'Das Universum spricht immer zu uns. Es sendet uns kleine Botschaften, verursacht Zufälle und glückliche Fügungen. Die einzige Frage ist: Hören wir zu?';

  @override
  String get wisdom30Author => 'Nancy Thayer';
}
