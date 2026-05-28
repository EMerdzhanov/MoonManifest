// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Bienvenue sur\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'Cette app vous guide dans une pratique de manifestation liée à la lune.';

  @override
  String get onboardingCycleTitle => 'Le cycle';

  @override
  String get onboardingCycleBody =>
      'Chaque mois lunaire traverse quatre phases distinctes, chacune avec sa propre énergie.';

  @override
  String get onboardingWhatYouDoTitle => 'Ce que vous ferez';

  @override
  String get onboardingNewMoonDesc =>
      'Posez vos intentions et plantez les graines de nouveaux départs.';

  @override
  String get onboardingWaxingDesc =>
      'Agissez et créez de l\'élan vers vos objectifs.';

  @override
  String get onboardingFullMoonDesc =>
      'Célébrez vos réussites et libérez ce qui ne vous sert plus.';

  @override
  String get onboardingWaningDesc =>
      'Réfléchissez, reposez-vous et intégrez les leçons apprises.';

  @override
  String get onboardingPreferencesTitle => 'Vos préférences';

  @override
  String get onboardingPreferencesSubtitle =>
      'Personnalisez comment et quand vous recevez des conseils.';

  @override
  String get onboardingNotificationFrequency => 'Fréquence des notifications';

  @override
  String get onboardingNotificationFrequencyHint =>
      'Combien de fois par jour souhaitez-vous être rappelé ?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / jour';
  }

  @override
  String get onboardingWakeWindow => 'Plage d\'éveil';

  @override
  String get onboardingWakeWindowHint =>
      'Pas de notifications en dehors de ces heures.';

  @override
  String get onboardingWakeUp => 'Réveil';

  @override
  String get onboardingWindDown => 'Repos';

  @override
  String get onboardingButtonContinue => 'Continuer';

  @override
  String get onboardingButtonBegin => 'Commencer';

  @override
  String get waitingWindowNotOpen =>
      'La fenêtre de manifestation n\'est pas encore ouverte';

  @override
  String waitingFirstCycle(String date) {
    return 'Votre premier cycle commence à la nouvelle lune du $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dans $count jours',
      one: 'dans un jour',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Préparez-vous en attendant';

  @override
  String get waitingLearnManifest => 'Apprenez à manifester';

  @override
  String get waitingLearnManifestSubtitle =>
      'Les 4 règles qui font fonctionner cette pratique';

  @override
  String get waitingUnderstandCycle => 'Comprenez le cycle lunaire';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Voyez où vous en êtes et ce que chaque phase signifie';

  @override
  String get waitingDraftIntentionsTitle => 'Ébauchez vos intentions';

  @override
  String get waitingDraftIntentionsBody =>
      'Utilisez cet espace pour réfléchir et vous préparer. Qu\'est-ce que vous souhaitez attirer ?';

  @override
  String waitingIntentionHint(int number) {
    return 'Intention $number…';
  }

  @override
  String get waitingAddIntention => 'Ajouter une intention';

  @override
  String get waitingMaxIntentionsMessage =>
      'Sept intentions est un nombre significatif. Choisissez avec soin ce qui compte le plus.';

  @override
  String get waitingDraftSaved => 'Brouillon enregistré';

  @override
  String get commonSomethingWentWrong => 'Quelque chose s\'est mal passé.';

  @override
  String get newMoonSetIntentions => 'Nouvelle lune.\nPosez vos intentions.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Le délai de grâce se termine $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Demandez-vous : De quoi ai-je vraiment besoin derrière mes désirs ? Posez des intentions qui parlent à vos besoins profonds — croissance, connexion, paix, abondance.';

  @override
  String get newMoonHowToWrite => 'Comment écrire des intentions puissantes';

  @override
  String get newMoonYourIntentions => 'Vos intentions';

  @override
  String newMoonIntentionHint(int number) {
    return 'Intention $number…';
  }

  @override
  String get newMoonAddIntention => 'Ajouter une intention';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Sept intentions est un nombre significatif. Choisissez avec soin ce qui compte le plus.';

  @override
  String get newMoonPlantIntentions => 'Planter ces intentions';

  @override
  String get newMoonLockedTitle => 'Voici vos intentions pour ce cycle.';

  @override
  String get newMoonLockedSubtitleEditing =>
      'Modifiez vos intentions ci-dessous.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'Elles ont été plantées. Faites confiance au processus.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Intention $number...';
  }

  @override
  String get newMoonEditIntentions => 'Modifier les intentions';

  @override
  String get newMoonEditUntilWaxing =>
      'Vous pouvez modifier jusqu\'au début de la phase croissante.';

  @override
  String get newMoonSaveChanges => 'Enregistrer les modifications';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Jour $day de la lune croissante.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Pleine lune demain.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Pleine lune dans $count jours.';
  }

  @override
  String get waxingYourIntentions => 'Vos intentions';

  @override
  String get waxingUnableToLoad => 'Impossible de charger les intentions.';

  @override
  String get waxingNoIntentionsFound =>
      'Aucune intention trouvée pour ce cycle.';

  @override
  String get fullMoonNoIntentionsSet =>
      'Aucune intention n\'a été posée ce cycle';

  @override
  String get fullMoonWorkDone => 'Le travail est accompli.';

  @override
  String get fullMoonNowRelease => 'Maintenant, lâchez prise.';

  @override
  String fullMoonWaningNext(String date) {
    return 'La phase décroissante commence bientôt.\nVotre prochain cycle débute à la nouvelle lune du $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Pleine lune. Rendez grâce.';

  @override
  String get fullMoonGracePeriodActive => 'Délai de grâce actif';

  @override
  String get fullMoonThankUniverse =>
      'Remerciez l\'univers comme si vous aviez déjà ce que vous avez demandé';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current sur $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Je suis tellement reconnaissant(e) que…';

  @override
  String get fullMoonCompleteCeremony => 'Terminer la cérémonie';

  @override
  String get fullMoonNextIntention => 'Intention suivante';

  @override
  String get waningWindowClosed => 'La fenêtre de manifestation est fermée';

  @override
  String waningOpensAgain(int count) {
    return 'S\'ouvre à nouveau dans $count jours à la nouvelle lune';
  }

  @override
  String get waningReleaseTrust => 'Lâchez prise. Faites confiance.';

  @override
  String get waningWorkDone => 'Le travail est accompli.';

  @override
  String get waningNextNewMoon => 'Prochaine nouvelle lune';

  @override
  String get waningWhyQuiet => 'Pourquoi ce silence ?';

  @override
  String get philosophyTitle => 'Pourquoi la fenêtre\nest-elle fermée ?';

  @override
  String get philosophyBody1 =>
      'La manifestation ne fonctionne pas selon votre emploi du temps — elle suit celui de la lune. Le cycle lunaire a des fenêtres spécifiques où poser des intentions est puissant, et des périodes où la chose la plus puissante que vous puissiez faire est rien.';

  @override
  String get philosophyBody2 =>
      'En ce moment, la lune décroît — elle se rétracte vers l\'obscurité. C\'est la phase de libération. Vos intentions de ce cycle ont été plantées, soignées et offertes en gratitude. Maintenant elles ont besoin d\'espace pour prendre racine. Pousser plus fort pendant cette phase n\'aide pas. Cela interfère.';

  @override
  String get philosophyBody3 =>
      'Quand la nouvelle lune arrivera, la fenêtre s\'ouvrira à nouveau. Vous poserez alors de nouvelles intentions et commencerez un nouveau cycle. L\'attente n\'est pas du temps perdu — c\'est une partie de la pratique. La discipline du lâcher-prise est ce qui sépare la manifestation du simple souhait.';

  @override
  String get philosophyDaysUntilOpen =>
      'jours avant l\'ouverture de la fenêtre';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Rappel programmé pour le $date';
  }

  @override
  String get philosophyRemindMe => 'Rappelez-moi quand elle s\'ouvre';

  @override
  String get philosophyCouldNotSchedule => 'Impossible de programmer le rappel';

  @override
  String get philosophyNotificationTitle =>
      'La fenêtre de manifestation est ouverte.';

  @override
  String get philosophyNotificationBody => 'Posez vos intentions maintenant.';

  @override
  String get philosophyHookTitle => 'Ce qu\'ils savent\net que vous ignorez';

  @override
  String get philosophyHookBody1 =>
      'Les personnes les plus prospères de la terre ne se contentent pas de fixer des objectifs. Elles travaillent avec le timing. Elles comprennent quelque chose que la plupart ne saisiront jamais : que l\'univers a un rythme, et ceux qui s\'y alignent ne poursuivent pas les résultats — les résultats les poursuivent.';

  @override
  String get philosophyHookBody2 =>
      'Ce n\'est pas un secret. C\'est un savoir ancestral — pratiqué pendant des milliers d\'années par ceux qui ont façonné des empires, bâti des dynasties et discrètement fait bouger le monde. La lune était leur horloge. « JE SUIS » était leur langage. Et l\'engagement était leur prix.';

  @override
  String get philosophyHookBody3 =>
      'Voici ce qu\'ils comprenaient : la manifestation est simple. Pas facile — simple. Vous déclarez ce que vous devenez. Vous le répétez jusqu\'à ce que votre esprit y croie. Vous rendez grâce avant de voir des preuves. Et puis vous lâchez prise. Complètement.';

  @override
  String get philosophyHookBody4 =>
      'La plupart échouent parce qu\'ils ne s\'engagent pas dans le processus. Ils veulent le résultat sans la discipline. Ils manifestent pendant un jour, cherchent des signes et abandonnent quand rien ne se passe d\'ici mardi. Ce n\'est pas de la manifestation. C\'est simplement souhaiter.';

  @override
  String get philosophyMoonHeading => 'La lune est la pièce manquante';

  @override
  String get philosophyMoonBody1 =>
      'Vous avez probablement déjà essayé les affirmations. Vous avez probablement dit « Je suis dans l\'abondance » devant le miroir et rien n\'a changé. C\'est parce que vous parliez dans le vide — sans timing, sans structure, sans alignement cosmique derrière vos mots.';

  @override
  String get philosophyMoonBody2 =>
      'La lune change tout. Elle donne à votre pratique un cycle — un début, un milieu, un sommet et une libération. Quand vous posez des intentions à la nouvelle lune, vous n\'écrivez pas des souhaits. Vous plantez des graines dans la seule terre qui déplace les océans depuis avant l\'existence des humains.';

  @override
  String get philosophyMoonBody3 =>
      'La lune décroissante n\'est pas une pause. C\'est la phase la plus exigeante de toutes. N\'importe qui peut demander. N\'importe qui peut répéter. Mais lâcher prise — vraiment laisser aller et faire confiance que ce que vous avez planté pousse dans l\'obscurité — cela exige la discipline sur laquelle cette pratique est bâtie.';

  @override
  String get philosophyFourPhasesHeading => 'Les quatre phases sacrées';

  @override
  String get philosophyPhasePlanting => 'La plantation';

  @override
  String get philosophyPhasePlantingDesc =>
      'Dans l\'obscurité, vous nommez ce dont vous avez besoin — pas ce que vous voulez, mais ce que votre âme exige. La nouvelle lune garde l\'espace pour la vérité pure.';

  @override
  String get philosophyPhaseTending => 'Le soin';

  @override
  String get philosophyPhaseTendingDesc =>
      'À mesure que la lumière revient, vous répétez vos intentions chaque jour. Non comme un espoir, mais comme une certitude. Vous ne demandez pas — vous vous rappelez ce qui est déjà en chemin.';

  @override
  String get philosophyPhaseGratitude => 'La gratitude';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'En pleine illumination, vous rendez grâce comme si vous teniez déjà ce que vous avez demandé. Ce n\'est pas faire semblant. C\'est l\'acte qui efface la distance entre là où vous êtes et là où vous allez.';

  @override
  String get philosophyPhaseRelease => 'La libération';

  @override
  String get philosophyPhaseReleaseDesc =>
      'Et puis — le silence. Vous lâchez prise. Vous cessez de pousser, de vérifier, de demander. La lune décroissante enseigne la leçon la plus difficile : que votre travail est accompli, et qu\'il appartient maintenant à quelque chose de plus grand que vous.';

  @override
  String get philosophyClosing =>
      'Quand la lune retourne à l\'obscurité,\nvous commencez.';

  @override
  String get guideTitle => 'Comment manifester';

  @override
  String get guideIntro =>
      'Quatre règles. C\'est tout. Maîtrisez-les et la lune fera le reste.';

  @override
  String get guideRule01 => 'RÈGLE 01';

  @override
  String get guideRule01Title => 'Nommez le besoin,\npas le désir';

  @override
  String get guideRule01Body1 =>
      'Le désir superficiel masque la vraie intention. Vous ne voulez pas vraiment un million de dollars — vous voulez le sentiment de sécurité, de liberté, de sérénité. La manifestation opère au niveau du ressenti, pas des objets matériels.';

  @override
  String get guideRule01Body2 =>
      'Demandez-vous : pourquoi est-ce que je veux cela ? La réponse est votre vraie intention.';

  @override
  String get guideRule01Wrong1 => 'Je veux un million de dollars';

  @override
  String get guideRule01Right1 => 'Je vis la liberté financière';

  @override
  String get guideRule01Wrong2 => 'Je veux un(e) partenaire';

  @override
  String get guideRule01Right2 =>
      'Je suis entouré(e) d\'une connexion profonde et aimante';

  @override
  String get guideRule01Wrong3 => 'Je veux une promotion';

  @override
  String get guideRule01Right3 =>
      'Je suis reconnu(e) et valorisé(e) pour mon travail';

  @override
  String get guideRule02 => 'RÈGLE 02';

  @override
  String get guideRule02Title =>
      'JE SUIS — Les mots les plus\npuissants que vous prononcerez';

  @override
  String get guideRule02Body1 =>
      'Dans la Bible, lorsque Moïse demanda le nom de Dieu, la réponse fut « JE SUIS CELUI QUI SUIS. » Chaque tradition qui a touché la manifestation — de la philosophie hermétique à Neville Goddard en passant par la pratique moderne — traite « JE SUIS » comme la déclaration qui façonne la réalité.';

  @override
  String get guideRule02Body2 =>
      'Ce qui suit « JE SUIS » devient votre ordre à l\'univers. Choisissez avec soin.';

  @override
  String get guideRule02Tip1 =>
      'Toujours positif — « Je suis en santé », pas « Je ne suis pas malade »';

  @override
  String get guideRule02Tip2 =>
      'Toujours au présent — « Je suis », pas « Je serai »';

  @override
  String get guideRule02Tip3 =>
      'Toujours avec conviction — prononcez-le comme une vérité, pas comme un espoir';

  @override
  String get guideRule02Right1 =>
      'Je suis dans l\'abondance et l\'argent coule vers moi facilement';

  @override
  String get guideRule02Right2 => 'Je suis en paix avec ce que je deviens';

  @override
  String get guideRule02Right3 => 'Je suis digne de la vie que je crée';

  @override
  String get guideRule03 => 'RÈGLE 03';

  @override
  String get guideRule03Title => 'Parlez comme si\nc\'était déjà fait';

  @override
  String get guideRule03Body1 =>
      'Vous n\'avez pas besoin de savoir comment cela arrivera. Votre seul travail est de maintenir la vibration — le ressenti — d\'avoir déjà ce que vous avez déclaré.';

  @override
  String get guideRule03Body2 =>
      'L\'univers ne répond pas à ce que vous voulez. Il répond à ce que vous êtes. Ne poursuivez pas. Ne cherchez pas de signes. Soyez-le simplement.';

  @override
  String get guideRule03Wrong1 => 'J\'espère trouver la paix un jour';

  @override
  String get guideRule03Right1 =>
      'Je suis reconnaissant(e) pour la paix qui emplit ma vie';

  @override
  String get guideRule03Wrong2 => 'J\'essaie d\'être plus confiant(e)';

  @override
  String get guideRule03Right2 =>
      'Je suis confiant(e). J\'ai une confiance totale en moi.';

  @override
  String get guideRule04 => 'RÈGLE 04';

  @override
  String get guideRule04Title => 'La gratitude est la preuve';

  @override
  String get guideRule04Body1 =>
      'La gratitude n\'est pas un remerciement après coup. C\'est le signal que vous envoyez avant de recevoir — la preuve à l\'univers que vous faites confiance au processus.';

  @override
  String get guideRule04Body2 =>
      'Lorsque vous remerciez pour quelque chose que vous n\'avez pas encore vu, vous effacez l\'écart entre vouloir et avoir. C\'est la cérémonie que cette app vous guide à accomplir à chaque pleine lune.';

  @override
  String get guideRule04Right1 =>
      'Je suis tellement reconnaissant(e) que la liberté financière est ma réalité';

  @override
  String get guideRule04Right2 =>
      'Merci pour l\'amour qui m\'entoure chaque jour';

  @override
  String get guideRule04Right3 =>
      'Je rends grâce pour ma santé, ma force, ma clarté';

  @override
  String get guideClosing =>
      'C\'est votre pratique.\nLa lune fournit le timing.\nVous fournissez la vérité.';

  @override
  String get lunarCycleTitle => 'Le cycle lunaire';

  @override
  String lunarYouAreHere(String phase) {
    return 'Vous êtes ici : $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'Jour $day sur $total';
  }

  @override
  String get lunarNewMoonPlant => 'Nouvelle lune — Plantation';

  @override
  String get lunarNewMoonPlantDesc =>
      'Posez vos intentions. Nommez ce dont vous avez vraiment besoin. C\'est ici que le cycle commence.';

  @override
  String get lunarNewMoonDuration => '~1 jour';

  @override
  String get lunarNewMoonStatus => 'Intentions ouvertes';

  @override
  String get lunarWaxingTend => 'Croissante — Soin';

  @override
  String get lunarWaxingTendDesc =>
      'Répétez vos intentions chaque jour. Construisez la foi par la répétition. La lune grandit, et votre conviction aussi.';

  @override
  String get lunarWaxingDuration => '~14 jours';

  @override
  String get lunarWaxingStatus => 'Rappels quotidiens actifs';

  @override
  String get lunarFullMoonGiveThanks => 'Pleine lune — Gratitude';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Exprimez de la gratitude comme si vous aviez déjà ce que vous avez demandé. C\'est le sommet — le moment de recevoir.';

  @override
  String get lunarFullMoonDuration => '~1 jour';

  @override
  String get lunarFullMoonStatus => 'Cérémonie de gratitude';

  @override
  String get lunarWaningRelease => 'Décroissante — Libération';

  @override
  String get lunarWaningReleaseDesc =>
      'Lâchez prise complètement. Cessez de pousser, de vérifier. Faites confiance que ce que vous avez planté pousse dans l\'obscurité.';

  @override
  String get lunarWaningDuration => '~14 jours';

  @override
  String get lunarWaningStatus => 'Fenêtre fermée — silence';

  @override
  String get lunarLegendManifest => 'Manifester';

  @override
  String get lunarLegendRelease => 'Libérer';

  @override
  String get lunarThisCycle => 'Ce cycle';

  @override
  String get lunarNow => 'MAINTENANT';

  @override
  String get cycleDiagramNewMoon => 'Nouvelle lune';

  @override
  String get cycleDiagramWaxingCrescent => 'Premier\ncroissant';

  @override
  String get cycleDiagramFirstQuarter => 'Premier\nquartier';

  @override
  String get cycleDiagramWaxingGibbous => 'Gibbeuse\ncroissante';

  @override
  String get cycleDiagramFullMoon => 'Pleine lune';

  @override
  String get cycleDiagramWaningGibbous => 'Gibbeuse\ndécroissante';

  @override
  String get cycleDiagramLastQuarter => 'Dernier\nquartier';

  @override
  String get cycleDiagramWaningCrescent => 'Dernier\ncroissant';

  @override
  String get cycleDiagramManifest => 'MANIFESTER';

  @override
  String get cycleDiagramRelease => 'LIBÉRER';

  @override
  String get cycleThisCycle => 'Ce cycle';

  @override
  String get cycleSeeFullDetails => 'Voir les détails complets du cycle';

  @override
  String debugLabel(String info) {
    return 'DEBUG: $info';
  }

  @override
  String get debugLive => 'live';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsReminderFrequency =>
      'Fréquence des rappels (fois par jour)';

  @override
  String get settingsWakeWindow => 'Plage d\'éveil';

  @override
  String get settingsWakeWindowStart => 'Début';

  @override
  String get settingsWakeWindowEnd => 'Fin';

  @override
  String get settingsMoonStyle => 'Style de lune';

  @override
  String get settingsMoonStyleDescription =>
      'Choisissez l\'apparence de la lune dans l\'app';

  @override
  String get settingsMoonStyleClassic => 'Classique';

  @override
  String get settingsMoonStyleStarfield => 'Champ d\'étoiles';

  @override
  String get settingsMoonStyleAura => 'Aura';

  @override
  String get settingsMoonStyleHalo => 'Halo';

  @override
  String get settingsData => 'Données';

  @override
  String get settingsExportData => 'Exporter les données';

  @override
  String get settingsImportData => 'Importer les données';

  @override
  String get settingsAbout => 'À propos';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest est un compagnon rituel personnel conçu pour vous aider à aligner vos intentions avec le cycle lunaire. À chaque nouvelle lune, vous posez jusqu\'à trois intentions et passez les 28 jours suivants à les nourrir par la gratitude et la réflexion quotidiennes. Vos données sont stockées en toute sécurité sur votre appareil et ne sont jamais envoyées à un serveur. Utilisez la fonction d\'exportation pour créer une sauvegarde chiffrée, et importez-la sur un nouvel appareil pour restaurer votre pratique.';

  @override
  String get settingsManifestationGuide => 'Guide de manifestation';

  @override
  String get settingsExportPasswordTitle =>
      'Définir le mot de passe d\'exportation';

  @override
  String get settingsImportPasswordTitle =>
      'Entrer le mot de passe d\'importation';

  @override
  String get settingsPasswordHint => 'Mot de passe';

  @override
  String settingsExportFailed(String error) {
    return 'Échec de l\'exportation : $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Impossible de lire le fichier.';

  @override
  String get settingsDataImported => 'Données importées avec succès.';

  @override
  String get settingsWrongPassword =>
      'Mot de passe incorrect ou fichier corrompu.';

  @override
  String settingsImportFailed(String error) {
    return 'Échec de l\'importation : $error';
  }

  @override
  String get settingsExportSubject => 'Sauvegarde Moon Manifest';

  @override
  String get historyTitle => 'Historique';

  @override
  String get historyNoCompletedCycles => 'Aucun cycle terminé pour le moment';

  @override
  String get historyOngoing => 'En cours';

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
  String get phaseNewMoon => 'Nouvelle lune';

  @override
  String get phaseWaxing => 'Croissante';

  @override
  String get phaseFullMoon => 'Pleine lune';

  @override
  String get phaseWaning => 'Décroissante';

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
  String get wisdom1 => 'Ce que tu cherches te cherche aussi.';

  @override
  String get wisdom1Author => 'Rumi';

  @override
  String get wisdom2 =>
      'L\'univers n\'est pas en dehors de toi. Regarde en toi ; tout ce que tu veux, tu l\'es déjà.';

  @override
  String get wisdom2Author => 'Rumi';

  @override
  String get wisdom3 => 'Fais confiance à l\'attente. Embrasse l\'incertitude.';

  @override
  String get wisdom4 =>
      'Tu n\'attires pas ce que tu veux. Tu attires ce que tu es.';

  @override
  String get wisdom5 =>
      'Quand je lâche ce que je suis, je deviens ce que je pourrais être.';

  @override
  String get wisdom5Author => 'Lao Tseu';

  @override
  String get wisdom6 =>
      'La nature ne se presse pas, et pourtant tout s\'accomplit.';

  @override
  String get wisdom6Author => 'Lao Tseu';

  @override
  String get wisdom7 =>
      'Adopte le sentiment de ton souhait réalisé et observe le chemin que prend ton attention.';

  @override
  String get wisdom7Author => 'Neville Goddard';

  @override
  String get wisdom8 =>
      'La plus grande illusion de l\'homme est sa conviction qu\'il existe des causes en dehors de son propre état de conscience.';

  @override
  String get wisdom8Author => 'Neville Goddard';

  @override
  String get wisdom9 =>
      'Tu es toujours un élève, jamais un maître. Tu dois continuer à avancer.';

  @override
  String get wisdom9Author => 'Conrad Hall';

  @override
  String get wisdom10 =>
      'Cesse de te faire si petit. Tu es l\'univers en mouvement extatique.';

  @override
  String get wisdom10Author => 'Rumi';

  @override
  String get wisdom11 =>
      'Le moment présent aura toujours été. Repose-toi en cela.';

  @override
  String get wisdom12 =>
      'Lâcher prise nous donne la liberté, et la liberté est la seule condition du bonheur.';

  @override
  String get wisdom12Author => 'Thich Nhat Hanh';

  @override
  String get wisdom13 =>
      'S\'abandonner n\'est pas renoncer. C\'est se remettre à quelque chose de plus grand.';

  @override
  String get wisdom14 =>
      'Tu as en toi en ce moment même tout ce qu\'il faut pour faire face à tout ce que le monde peut te lancer.';

  @override
  String get wisdom14Author => 'Brian Tracy';

  @override
  String get wisdom15 =>
      'Plus tu deviens silencieux, plus tu es capable d\'entendre.';

  @override
  String get wisdom15Author => 'Rumi';

  @override
  String get wisdom16 =>
      'Ta tâche n\'est pas de chercher l\'amour, mais simplement de chercher et trouver toutes les barrières que tu as construites en toi contre lui.';

  @override
  String get wisdom16Author => 'Rumi';

  @override
  String get wisdom17 =>
      'La foi, c\'est faire le premier pas même quand on ne voit pas tout l\'escalier.';

  @override
  String get wisdom17Author => 'Martin Luther King Jr.';

  @override
  String get wisdom18 =>
      'La graine ne lutte pas contre la terre. Elle pousse simplement.';

  @override
  String get wisdom19 =>
      'Libère le besoin de savoir comment. Fais confiance que l\'univers connaît le chemin.';

  @override
  String get wisdom20 =>
      'Commence à te voir comme une âme avec un corps plutôt qu\'un corps avec une âme.';

  @override
  String get wisdom20Author => 'Wayne Dyer';

  @override
  String get wisdom21 =>
      'Tu ne peux pas toujours contrôler ce qui se passe à l\'extérieur. Mais tu peux toujours contrôler ce qui se passe à l\'intérieur.';

  @override
  String get wisdom21Author => 'Wayne Dyer';

  @override
  String get wisdom22 =>
      'La patience n\'est pas une attente passive. C\'est une confiance active.';

  @override
  String get wisdom23 =>
      'Tout ce dont tu as besoin est déjà en toi, attendant de se déployer.';

  @override
  String get wisdom24 =>
      'La lune ne lutte pas. Elle observe. Et en observant, elle maintient tout ensemble.';

  @override
  String get wisdom25 =>
      'Agis comme si ce que tu as l\'intention de manifester dans ta vie était déjà une réalité.';

  @override
  String get wisdom25Author => 'Wayne Dyer';

  @override
  String get wisdom26 => 'Sois immobile et sache.';

  @override
  String get wisdom27 => 'Lâche les branches et fais confiance à la rivière.';

  @override
  String get wisdom28 =>
      'La blessure est l\'endroit par où la lumière entre en toi.';

  @override
  String get wisdom28Author => 'Rumi';

  @override
  String get wisdom29 =>
      'Un navire au port est en sécurité, mais ce n\'est pas pour cela que les navires sont construits.';

  @override
  String get wisdom29Author => 'John A. Shedd';

  @override
  String get wisdom30 =>
      'L\'univers nous parle toujours. Il nous envoie de petits messages, provoque des coïncidences et des hasards heureux. La seule question est : écoutons-nous ?';

  @override
  String get wisdom30Author => 'Nancy Thayer';
}
