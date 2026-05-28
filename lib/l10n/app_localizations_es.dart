// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Bienvenido a\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'Esta app te guía en una práctica de manifestación conectada con la luna.';

  @override
  String get onboardingCycleTitle => 'El ciclo';

  @override
  String get onboardingCycleBody =>
      'Cada mes lunar fluye a través de cuatro fases distintas, cada una con su propia energía.';

  @override
  String get onboardingWhatYouDoTitle => 'Lo que harás';

  @override
  String get onboardingNewMoonDesc =>
      'Establece intenciones y planta semillas para nuevos comienzos.';

  @override
  String get onboardingWaxingDesc =>
      'Actúa y construye impulso hacia tus metas.';

  @override
  String get onboardingFullMoonDesc =>
      'Celebra tus logros y libera lo que ya no te sirve.';

  @override
  String get onboardingWaningDesc =>
      'Reflexiona, descansa e integra las lecciones aprendidas.';

  @override
  String get onboardingPreferencesTitle => 'Tus preferencias';

  @override
  String get onboardingPreferencesSubtitle =>
      'Personaliza cómo y cuándo recibes orientación.';

  @override
  String get onboardingNotificationFrequency => 'Frecuencia de notificaciones';

  @override
  String get onboardingNotificationFrequencyHint =>
      '¿Cuántas veces al día quieres recibir recordatorios?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / día';
  }

  @override
  String get onboardingWakeWindow => 'Ventana de vigilia';

  @override
  String get onboardingWakeWindowHint =>
      'Sin notificaciones fuera de estas horas.';

  @override
  String get onboardingWakeUp => 'Despertar';

  @override
  String get onboardingWindDown => 'Descanso';

  @override
  String get onboardingButtonContinue => 'Continuar';

  @override
  String get onboardingButtonBegin => 'Comenzar';

  @override
  String get waitingWindowNotOpen =>
      'La ventana de manifestación aún no está abierta';

  @override
  String waitingFirstCycle(String date) {
    return 'Tu primer ciclo comienza en la luna nueva del $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'faltan $count días',
      one: 'falta un día',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Prepárate mientras esperas';

  @override
  String get waitingLearnManifest => 'Aprende a manifestar';

  @override
  String get waitingLearnManifestSubtitle =>
      'Las 4 reglas que hacen funcionar esta práctica';

  @override
  String get waitingUnderstandCycle => 'Comprende el ciclo lunar';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Mira dónde estás y qué significa cada fase';

  @override
  String get waitingDraftIntentionsTitle =>
      'Escribe un borrador de tus intenciones';

  @override
  String get waitingDraftIntentionsBody =>
      'Usa este espacio para reflexionar y prepararte. ¿Qué deseas atraer a tu vida?';

  @override
  String waitingIntentionHint(int number) {
    return 'Intención $number…';
  }

  @override
  String get waitingAddIntention => 'Añadir intención';

  @override
  String get waitingMaxIntentionsMessage =>
      'Siete intenciones es un número significativo. Elige con cuidado lo que más importa.';

  @override
  String get waitingDraftSaved => 'Borrador guardado';

  @override
  String get commonSomethingWentWrong => 'Algo salió mal.';

  @override
  String get newMoonSetIntentions => 'Luna nueva.\nEstablece tus intenciones.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'El período de gracia termina $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Pregúntate: ¿Qué necesito realmente detrás de mis deseos? Establece intenciones que hablen a tus necesidades profundas: crecimiento, conexión, paz, abundancia.';

  @override
  String get newMoonHowToWrite => 'Cómo escribir intenciones poderosas';

  @override
  String get newMoonYourIntentions => 'Tus intenciones';

  @override
  String newMoonIntentionHint(int number) {
    return 'Intención $number…';
  }

  @override
  String get newMoonAddIntention => 'Añadir intención';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Siete intenciones es un número significativo. Elige con cuidado lo que más importa.';

  @override
  String get newMoonPlantIntentions => 'Plantar estas intenciones';

  @override
  String get newMoonLockedTitle => 'Estas son tus intenciones para este ciclo.';

  @override
  String get newMoonLockedSubtitleEditing =>
      'Edita tus intenciones a continuación.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'Han sido plantadas. Confía en el proceso.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Intención $number...';
  }

  @override
  String get newMoonEditIntentions => 'Editar intenciones';

  @override
  String get newMoonEditUntilWaxing =>
      'Puedes editar hasta que comience la fase creciente.';

  @override
  String get newMoonSaveChanges => 'Guardar cambios';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Día $day de la luna creciente.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Luna llena mañana.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Luna llena en $count días.';
  }

  @override
  String get waxingYourIntentions => 'Tus intenciones';

  @override
  String get waxingUnableToLoad => 'No se pudieron cargar las intenciones.';

  @override
  String get waxingNoIntentionsFound =>
      'No se encontraron intenciones para este ciclo.';

  @override
  String get fullMoonNoIntentionsSet =>
      'No se establecieron intenciones en este ciclo';

  @override
  String get fullMoonWorkDone => 'El trabajo está hecho.';

  @override
  String get fullMoonNowRelease => 'Ahora libera.';

  @override
  String fullMoonWaningNext(String date) {
    return 'La fase menguante comienza pronto.\nTu próximo ciclo empieza en la luna nueva del $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Luna llena. Da gracias.';

  @override
  String get fullMoonGracePeriodActive => 'Período de gracia activo';

  @override
  String get fullMoonThankUniverse =>
      'Agradece al universo como si ya tuvieras lo que pediste';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current de $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Estoy tan agradecido/a de que…';

  @override
  String get fullMoonCompleteCeremony => 'Completar ceremonia';

  @override
  String get fullMoonNextIntention => 'Siguiente intención';

  @override
  String get waningWindowClosed => 'La ventana de manifestación está cerrada';

  @override
  String waningOpensAgain(int count) {
    return 'Se abre de nuevo en $count días con la luna nueva';
  }

  @override
  String get waningReleaseTrust => 'Libera. Confía.';

  @override
  String get waningWorkDone => 'El trabajo está hecho.';

  @override
  String get waningNextNewMoon => 'Próxima luna nueva';

  @override
  String get waningWhyQuiet => '¿Por qué está en silencio?';

  @override
  String get philosophyTitle => '¿Por qué la ventana\nestá cerrada ahora?';

  @override
  String get philosophyBody1 =>
      'La manifestación no funciona según tu horario — funciona según el de la luna. El ciclo lunar tiene ventanas específicas donde establecer intenciones es poderoso, y períodos donde lo más poderoso que puedes hacer es nada.';

  @override
  String get philosophyBody2 =>
      'Ahora mismo, la luna está menguando — encogiéndose hacia la oscuridad. Esta es la fase de liberación. Tus intenciones de este ciclo han sido plantadas, cuidadas y ofrecidas en gratitud. Ahora necesitan espacio para echar raíces. Presionar más durante esta fase no ayuda. Interfiere.';

  @override
  String get philosophyBody3 =>
      'Cuando llegue la luna nueva, la ventana se abre de nuevo. Entonces establecerás intenciones frescas y comenzarás un nuevo ciclo. La espera no es tiempo perdido — es parte de la práctica. La disciplina de soltar es lo que separa la manifestación del simple deseo.';

  @override
  String get philosophyDaysUntilOpen => 'días hasta que se abra la ventana';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Recordatorio programado para $date';
  }

  @override
  String get philosophyRemindMe => 'Recúerdame cuando se abra';

  @override
  String get philosophyCouldNotSchedule =>
      'No se pudo programar el recordatorio';

  @override
  String get philosophyNotificationTitle =>
      'La ventana de manifestación está abierta.';

  @override
  String get philosophyNotificationBody => 'Establece tus intenciones ahora.';

  @override
  String get philosophyHookTitle => 'Lo que ellos saben\ny tú no';

  @override
  String get philosophyHookBody1 =>
      'Las personas más exitosas de la tierra no solo se ponen metas. Trabajan con el tiempo. Entienden algo que la mayoría nunca comprenderá: que el universo tiene un ritmo, y quienes se alinean con él no persiguen resultados — los resultados los persiguen a ellos.';

  @override
  String get philosophyHookBody2 =>
      'Esto no es un secreto. Es conocimiento antiguo — practicado durante miles de años por quienes forjaron imperios, construyeron dinastías y movieron el mundo en silencio. La luna era su reloj. «YO SOY» era su lenguaje. Y el compromiso era su precio.';

  @override
  String get philosophyHookBody3 =>
      'Esto es lo que entendían: la manifestación es simple. No fácil — simple. Declaras en qué te estás convirtiendo. Lo repites hasta que tu mente lo cree. Agradeces antes de ver pruebas. Y luego sueltas. Completamente.';

  @override
  String get philosophyHookBody4 =>
      'La mayoría fracasa porque no se compromete con el proceso. Quieren el resultado sin la disciplina. Manifiestan un día, buscan señales y abandonan cuando nada ocurre para el martes. Eso no es manifestación. Eso es simplemente desear.';

  @override
  String get philosophyMoonHeading => 'La luna es la pieza que falta';

  @override
  String get philosophyMoonBody1 =>
      'Probablemente ya has intentado afirmaciones. Probablemente has dicho «Soy abundante» frente al espejo y nada cambió. Eso es porque hablabas al vacío — sin tiempo, sin estructura, sin alineación cósmica detrás de tus palabras.';

  @override
  String get philosophyMoonBody2 =>
      'La luna lo cambia todo. Le da a tu práctica un ciclo — un comienzo, un medio, un clímax y una liberación. Cuando estableces intenciones en la luna nueva, no estás escribiendo deseos. Estás plantando semillas en la única tierra que ha movido océanos desde antes de que existieran los humanos.';

  @override
  String get philosophyMoonBody3 =>
      'La luna menguante no es una pausa. Es la fase más exigente de todas. Cualquiera puede pedir. Cualquiera puede repetir. Pero soltar — realmente dejar ir y confiar en que lo que plantaste crece en la oscuridad — eso requiere la disciplina sobre la que se construyó esta práctica.';

  @override
  String get philosophyFourPhasesHeading => 'Las cuatro fases sagradas';

  @override
  String get philosophyPhasePlanting => 'La siembra';

  @override
  String get philosophyPhasePlantingDesc =>
      'En la oscuridad, nombras lo que necesitas — no lo que quieres, sino lo que tu alma requiere. La luna nueva guarda espacio para la verdad pura.';

  @override
  String get philosophyPhaseTending => 'El cuidado';

  @override
  String get philosophyPhaseTendingDesc =>
      'A medida que la luz regresa, repites tus intenciones cada día. No como esperanza, sino como certeza. No estás pidiendo — estás recordando lo que ya viene en camino.';

  @override
  String get philosophyPhaseGratitude => 'La gratitud';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'En plena iluminación, agradeces como si ya tuvieras lo que pediste. Esto no es fingir. Es el acto que colapsa la distancia entre donde estás y hacia donde vas.';

  @override
  String get philosophyPhaseRelease => 'La liberación';

  @override
  String get philosophyPhaseReleaseDesc =>
      'Y luego — silencio. Sueltas. Dejas de empujar, de verificar, de preguntar. La luna menguante enseña la lección más difícil: que tu trabajo está hecho, y ahora pertenece a algo más grande que tú.';

  @override
  String get philosophyClosing =>
      'Cuando la luna regrese a la oscuridad,\ncomienzas.';

  @override
  String get guideTitle => 'Cómo manifestar';

  @override
  String get guideIntro =>
      'Cuatro reglas. Eso es todo. Domínalas y la luna hará el resto.';

  @override
  String get guideRule01 => 'REGLA 01';

  @override
  String get guideRule01Title => 'Nombra la necesidad,\nno el deseo';

  @override
  String get guideRule01Body1 =>
      'El deseo superficial oculta la intención real. En realidad no quieres un millón de dólares — quieres la sensación de seguridad, de libertad, de no preocuparte. La manifestación funciona a nivel del sentimiento, no de los objetos materiales.';

  @override
  String get guideRule01Body2 =>
      'Pregúntate: ¿por qué quiero esto? La respuesta es tu verdadera intención.';

  @override
  String get guideRule01Wrong1 => 'Quiero un millón de dólares';

  @override
  String get guideRule01Right1 => 'Estoy experimentando libertad financiera';

  @override
  String get guideRule01Wrong2 => 'Quiero una pareja';

  @override
  String get guideRule01Right2 =>
      'Estoy rodeado/a de una conexión profunda y amorosa';

  @override
  String get guideRule01Wrong3 => 'Quiero un ascenso';

  @override
  String get guideRule01Right3 =>
      'Soy reconocido/a y valorado/a por mi trabajo';

  @override
  String get guideRule02 => 'REGLA 02';

  @override
  String get guideRule02Title =>
      'YO SOY — Las palabras más\npoderosas que dirás';

  @override
  String get guideRule02Body1 =>
      'En la Biblia, cuando Moisés preguntó el nombre de Dios, la respuesta fue «YO SOY EL QUE SOY.» Cada tradición que ha tocado la manifestación — desde la filosofía hermética hasta Neville Goddard y la práctica moderna — trata «YO SOY» como la declaración que moldea la realidad.';

  @override
  String get guideRule02Body2 =>
      'Lo que siga a «YO SOY» se convierte en tu orden al universo. Elige con cuidado.';

  @override
  String get guideRule02Tip1 =>
      'Siempre positivo — «Soy sano/a», no «No estoy enfermo/a»';

  @override
  String get guideRule02Tip2 =>
      'Siempre en tiempo presente — «Yo soy», no «Yo seré»';

  @override
  String get guideRule02Tip3 =>
      'Siempre con convicción — dilo como verdad, no como esperanza';

  @override
  String get guideRule02Right1 =>
      'Soy abundante y el dinero fluye hacia mí fácilmente';

  @override
  String get guideRule02Right2 =>
      'Estoy en paz con quien me estoy convirtiendo';

  @override
  String get guideRule02Right3 => 'Soy digno/a de la vida que estoy creando';

  @override
  String get guideRule03 => 'REGLA 03';

  @override
  String get guideRule03Title => 'Habla como si\nya hubiera sucedido';

  @override
  String get guideRule03Body1 =>
      'No necesitas saber cómo sucederá. Tu único trabajo es mantener la vibración — el sentimiento — de ya tener lo que declaraste.';

  @override
  String get guideRule03Body2 =>
      'El universo no responde a lo que quieres. Responde a lo que eres. No persigas. No busques señales. Simplemente sélo.';

  @override
  String get guideRule03Wrong1 => 'Espero encontrar paz algún día';

  @override
  String get guideRule03Right1 =>
      'Estoy agradecido/a por la paz que llena mi vida';

  @override
  String get guideRule03Wrong2 => 'Estoy tratando de ser más seguro/a';

  @override
  String get guideRule03Right2 =>
      'Soy seguro/a de mí mismo/a. Confío en mí completamente.';

  @override
  String get guideRule04 => 'REGLA 04';

  @override
  String get guideRule04Title => 'La gratitud es la prueba';

  @override
  String get guideRule04Body1 =>
      'La gratitud no es una nota de agradecimiento después del hecho. Es la señal que envías antes de recibir — prueba al universo de que confías en el proceso.';

  @override
  String get guideRule04Body2 =>
      'Cuando agradeces por algo que aún no has visto, colapsas la brecha entre querer y tener. Esta es la ceremonia que esta app te guía en cada luna llena.';

  @override
  String get guideRule04Right1 =>
      'Estoy tan agradecido/a de que la libertad financiera es mi realidad';

  @override
  String get guideRule04Right2 => 'Gracias por el amor que me rodea cada día';

  @override
  String get guideRule04Right3 =>
      'Doy gracias por mi salud, mi fuerza, mi claridad';

  @override
  String get guideClosing =>
      'Esta es tu práctica.\nLa luna provee el tiempo.\nTú provees la verdad.';

  @override
  String get lunarCycleTitle => 'El ciclo lunar';

  @override
  String lunarYouAreHere(String phase) {
    return 'Estás aquí: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'Día $day de $total';
  }

  @override
  String get lunarNewMoonPlant => 'Luna nueva — Siembra';

  @override
  String get lunarNewMoonPlantDesc =>
      'Establece tus intenciones. Nombra lo que verdaderamente necesitas. Aquí es donde comienza el ciclo.';

  @override
  String get lunarNewMoonDuration => '~1 día';

  @override
  String get lunarNewMoonStatus => 'Intenciones abiertas';

  @override
  String get lunarWaxingTend => 'Creciente — Cuidado';

  @override
  String get lunarWaxingTendDesc =>
      'Repite tus intenciones cada día. Construye fe a través de la repetición. La luna crece, y tu convicción también.';

  @override
  String get lunarWaxingDuration => '~14 días';

  @override
  String get lunarWaxingStatus => 'Recordatorios diarios activos';

  @override
  String get lunarFullMoonGiveThanks => 'Luna llena — Da gracias';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Expresa gratitud como si ya tuvieras lo que pediste. Este es el clímax — el momento de recibir.';

  @override
  String get lunarFullMoonDuration => '~1 día';

  @override
  String get lunarFullMoonStatus => 'Ceremonia de gratitud';

  @override
  String get lunarWaningRelease => 'Menguante — Liberación';

  @override
  String get lunarWaningReleaseDesc =>
      'Suelta completamente. Deja de empujar, de verificar. Confía en que lo que plantaste crece en la oscuridad.';

  @override
  String get lunarWaningDuration => '~14 días';

  @override
  String get lunarWaningStatus => 'Ventana cerrada — silencio';

  @override
  String get lunarLegendManifest => 'Manifestar';

  @override
  String get lunarLegendRelease => 'Liberar';

  @override
  String get lunarThisCycle => 'Este ciclo';

  @override
  String get lunarNow => 'AHORA';

  @override
  String get cycleDiagramNewMoon => 'Luna nueva';

  @override
  String get cycleDiagramWaxingCrescent => 'Creciente\nluminoso';

  @override
  String get cycleDiagramFirstQuarter => 'Cuarto\ncreciente';

  @override
  String get cycleDiagramWaxingGibbous => 'Gibosa\ncreciente';

  @override
  String get cycleDiagramFullMoon => 'Luna llena';

  @override
  String get cycleDiagramWaningGibbous => 'Gibosa\nmenguante';

  @override
  String get cycleDiagramLastQuarter => 'Último\ncuarto';

  @override
  String get cycleDiagramWaningCrescent => 'Creciente\nmenguante';

  @override
  String get cycleDiagramManifest => 'MANIFESTAR';

  @override
  String get cycleDiagramRelease => 'LIBERAR';

  @override
  String get cycleThisCycle => 'Este ciclo';

  @override
  String get cycleSeeFullDetails => 'Ver detalles completos del ciclo';

  @override
  String debugLabel(String info) {
    return 'DEBUG: $info';
  }

  @override
  String get debugLive => 'live';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsReminderFrequency =>
      'Frecuencia de recordatorios (veces al día)';

  @override
  String get settingsWakeWindow => 'Ventana de vigilia';

  @override
  String get settingsWakeWindowStart => 'Inicio';

  @override
  String get settingsWakeWindowEnd => 'Fin';

  @override
  String get settingsMoonStyle => 'Estilo de luna';

  @override
  String get settingsMoonStyleDescription =>
      'Elige cómo se ve la luna en la app';

  @override
  String get settingsMoonStyleClassic => 'Clásica';

  @override
  String get settingsMoonStyleStarfield => 'Campo estelar';

  @override
  String get settingsMoonStyleAura => 'Aura';

  @override
  String get settingsMoonStyleHalo => 'Halo';

  @override
  String get settingsData => 'Datos';

  @override
  String get settingsExportData => 'Exportar datos';

  @override
  String get settingsImportData => 'Importar datos';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest es un compañero ritual personal diseñado para ayudarte a alinear tus intenciones con el ciclo lunar. Cada luna nueva, estableces hasta tres intenciones y pasas los siguientes 28 días cultivándolas a través de gratitud y reflexión diaria. Tus datos se almacenan de forma segura en tu dispositivo y nunca se envían a ningún servidor. Usa la función de exportación para crear una copia de seguridad encriptada, e impórtala en un nuevo dispositivo para restaurar tu práctica.';

  @override
  String get settingsManifestationGuide => 'Guía de manifestación';

  @override
  String get settingsExportPasswordTitle =>
      'Establecer contraseña de exportación';

  @override
  String get settingsImportPasswordTitle =>
      'Introducir contraseña de importación';

  @override
  String get settingsPasswordHint => 'Contraseña';

  @override
  String settingsExportFailed(String error) {
    return 'La exportación falló: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'No se pudo leer el archivo.';

  @override
  String get settingsDataImported => 'Datos importados exitosamente.';

  @override
  String get settingsWrongPassword => 'Contraseña incorrecta o archivo dañado.';

  @override
  String settingsImportFailed(String error) {
    return 'La importación falló: $error';
  }

  @override
  String get settingsExportSubject => 'Copia de seguridad de Moon Manifest';

  @override
  String get historyTitle => 'Historial';

  @override
  String get historyNoCompletedCycles => 'Aún no hay ciclos completados';

  @override
  String get historyOngoing => 'En curso';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count intenciones',
      one: '1 intención',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'Intenciones';

  @override
  String get historyGratitudesLabel => 'Gratitudes';

  @override
  String get phaseNewMoon => 'Luna nueva';

  @override
  String get phaseWaxing => 'Creciente';

  @override
  String get phaseFullMoon => 'Luna llena';

  @override
  String get phaseWaning => 'Menguante';

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
  String get wisdom1 => 'Lo que buscas te está buscando.';

  @override
  String get wisdom1Author => 'Rumi';

  @override
  String get wisdom2 =>
      'El universo no está fuera de ti. Mira dentro de ti; todo lo que quieres, ya lo eres.';

  @override
  String get wisdom2Author => 'Rumi';

  @override
  String get wisdom3 => 'Confía en la espera. Abraza la incertidumbre.';

  @override
  String get wisdom4 => 'No atraes lo que quieres. Atraes lo que eres.';

  @override
  String get wisdom5 =>
      'Cuando suelto lo que soy, me convierto en lo que podría ser.';

  @override
  String get wisdom5Author => 'Lao Tzu';

  @override
  String get wisdom6 =>
      'La naturaleza no se apresura, y sin embargo todo se logra.';

  @override
  String get wisdom6Author => 'Lao Tzu';

  @override
  String get wisdom7 =>
      'Asume el sentimiento de tu deseo cumplido y observa la ruta que sigue tu atención.';

  @override
  String get wisdom7Author => 'Neville Goddard';

  @override
  String get wisdom8 =>
      'La mayor ilusión del hombre es su convicción de que existen causas ajenas a su propio estado de conciencia.';

  @override
  String get wisdom8Author => 'Neville Goddard';

  @override
  String get wisdom9 =>
      'Siempre eres estudiante, nunca maestro. Debes seguir avanzando.';

  @override
  String get wisdom9Author => 'Conrad Hall';

  @override
  String get wisdom10 =>
      'Deja de actuar tan pequeño. Eres el universo en movimiento extático.';

  @override
  String get wisdom10Author => 'Rumi';

  @override
  String get wisdom11 =>
      'El momento presente siempre habrá sido. Descansa en eso.';

  @override
  String get wisdom12 =>
      'Soltar nos da libertad, y la libertad es la única condición para la felicidad.';

  @override
  String get wisdom12Author => 'Thich Nhat Hanh';

  @override
  String get wisdom13 =>
      'Rendirse no es darse por vencido. Es entregarse a algo más grande.';

  @override
  String get wisdom14 =>
      'Tienes dentro de ti ahora mismo todo lo que necesitas para enfrentar cualquier cosa que el mundo te presente.';

  @override
  String get wisdom14Author => 'Brian Tracy';

  @override
  String get wisdom15 => 'Cuanto más silencioso te vuelves, más puedes oír.';

  @override
  String get wisdom15Author => 'Rumi';

  @override
  String get wisdom16 =>
      'Tu tarea no es buscar el amor, sino simplemente buscar y encontrar todas las barreras que has construido dentro de ti contra él.';

  @override
  String get wisdom16Author => 'Rumi';

  @override
  String get wisdom17 =>
      'La fe es dar el primer paso aun cuando no ves toda la escalera.';

  @override
  String get wisdom17Author => 'Martin Luther King Jr.';

  @override
  String get wisdom18 =>
      'La semilla no lucha contra la tierra. Simplemente crece.';

  @override
  String get wisdom19 =>
      'Libera la necesidad de saber cómo. Confía en que el universo conoce el camino.';

  @override
  String get wisdom20 =>
      'Empieza a verte como un alma con un cuerpo en lugar de un cuerpo con un alma.';

  @override
  String get wisdom20Author => 'Wayne Dyer';

  @override
  String get wisdom21 =>
      'No siempre puedes controlar lo que sucede afuera. Pero siempre puedes controlar lo que sucede adentro.';

  @override
  String get wisdom21Author => 'Wayne Dyer';

  @override
  String get wisdom22 =>
      'La paciencia no es espera pasiva. Es confianza activa.';

  @override
  String get wisdom23 =>
      'Todo lo que necesitas ya está dentro de ti, esperando desplegarse.';

  @override
  String get wisdom24 =>
      'La luna no lucha. Observa. Y al observar, mantiene todo unido.';

  @override
  String get wisdom25 =>
      'Actúa como si lo que pretendes manifestar en tu vida ya fuera una realidad.';

  @override
  String get wisdom25Author => 'Wayne Dyer';

  @override
  String get wisdom26 => 'Queda en silencio y sabe.';

  @override
  String get wisdom27 => 'Suelta las ramas y confía en el río.';

  @override
  String get wisdom28 => 'La herida es el lugar por donde la luz entra en ti.';

  @override
  String get wisdom28Author => 'Rumi';

  @override
  String get wisdom29 =>
      'Un barco en el puerto está a salvo, pero no es para eso que se construyen los barcos.';

  @override
  String get wisdom29Author => 'John A. Shedd';

  @override
  String get wisdom30 =>
      'El universo siempre nos está hablando. Enviándonos pequeños mensajes, causando coincidencias y serendipias. La única pregunta es: ¿estamos escuchando?';

  @override
  String get wisdom30Author => 'Nancy Thayer';
}
