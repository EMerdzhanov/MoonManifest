// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get onboardingWelcomeTitle => 'Bem-vindo ao\nMoon Manifest';

  @override
  String get onboardingWelcomeBody =>
      'Este app guia uma prática de manifestação conectada à lua.';

  @override
  String get onboardingCycleTitle => 'O ciclo';

  @override
  String get onboardingCycleBody =>
      'Cada mês lunar flui por quatro fases distintas, cada uma com a sua própria energia.';

  @override
  String get onboardingWhatYouDoTitle => 'O que vais fazer';

  @override
  String get onboardingNewMoonDesc =>
      'Define intenções e planta sementes para novos começos.';

  @override
  String get onboardingWaxingDesc =>
      'Age e constrói impulso em direção aos teus objetivos.';

  @override
  String get onboardingFullMoonDesc =>
      'Celebra as conquistas e liberta o que já não te serve.';

  @override
  String get onboardingWaningDesc =>
      'Reflete, descansa e integra as lições aprendidas.';

  @override
  String get onboardingPreferencesTitle => 'As tuas preferências';

  @override
  String get onboardingPreferencesSubtitle =>
      'Personaliza como e quando recebes orientação.';

  @override
  String get onboardingNotificationFrequency => 'Frequência das notificações';

  @override
  String get onboardingNotificationFrequencyHint =>
      'Quantas vezes por dia queres ser lembrado?';

  @override
  String onboardingFrequencyPerDay(int count) {
    return '$count / dia';
  }

  @override
  String get onboardingWakeWindow => 'Janela de vigília';

  @override
  String get onboardingWakeWindowHint => 'Sem notificações fora destas horas.';

  @override
  String get onboardingWakeUp => 'Despertar';

  @override
  String get onboardingWindDown => 'Descanso';

  @override
  String get onboardingButtonContinue => 'Continuar';

  @override
  String get onboardingButtonBegin => 'Começar';

  @override
  String get waitingWindowNotOpen =>
      'A janela de manifestação ainda não está aberta';

  @override
  String waitingFirstCycle(String date) {
    return 'O teu primeiro ciclo começa na lua nova de $date.';
  }

  @override
  String waitingDaysAway(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'faltam $count dias',
      one: 'falta um dia',
    );
    return '$_temp0';
  }

  @override
  String get waitingPrepareTitle => 'Prepara-te enquanto esperas';

  @override
  String get waitingLearnManifest => 'Aprende a manifestar';

  @override
  String get waitingLearnManifestSubtitle =>
      'As 4 regras que fazem esta prática funcionar';

  @override
  String get waitingUnderstandCycle => 'Compreende o ciclo lunar';

  @override
  String get waitingUnderstandCycleSubtitle =>
      'Vê onde estás e o que cada fase significa';

  @override
  String get waitingDraftIntentionsTitle => 'Esboça as tuas intenções';

  @override
  String get waitingDraftIntentionsBody =>
      'Usa este espaço para refletir e preparar-te. O que desejas atrair?';

  @override
  String waitingIntentionHint(int number) {
    return 'Intenção $number…';
  }

  @override
  String get waitingAddIntention => 'Adicionar intenção';

  @override
  String get waitingMaxIntentionsMessage =>
      'Sete intenções é um número significativo. Escolhe com cuidado o que mais importa.';

  @override
  String get waitingDraftSaved => 'Rascunho guardado';

  @override
  String get commonSomethingWentWrong => 'Algo correu mal.';

  @override
  String get newMoonSetIntentions => 'Lua nova.\nDefine as tuas intenções.';

  @override
  String newMoonGracePeriodEnds(String deadline) {
    return 'Período de graça termina em $deadline';
  }

  @override
  String get newMoonGuidancePrompt =>
      'Pergunta-te: O que realmente preciso por trás dos meus desejos? Define intenções que falem às tuas necessidades profundas — crescimento, conexão, paz, abundância.';

  @override
  String get newMoonHowToWrite => 'Como escrever intenções poderosas';

  @override
  String get newMoonYourIntentions => 'As tuas intenções';

  @override
  String newMoonIntentionHint(int number) {
    return 'Intenção $number…';
  }

  @override
  String get newMoonAddIntention => 'Adicionar intenção';

  @override
  String get newMoonMaxIntentionsMessage =>
      'Sete intenções é um número significativo. Escolhe com cuidado o que mais importa.';

  @override
  String get newMoonPlantIntentions => 'Plantar estas intenções';

  @override
  String get newMoonLockedTitle =>
      'Estas são as tuas intenções para este ciclo.';

  @override
  String get newMoonLockedSubtitleEditing => 'Edita as tuas intenções abaixo.';

  @override
  String get newMoonLockedSubtitlePlanted =>
      'Foram plantadas. Confia no processo.';

  @override
  String newMoonEditIntentionHint(int number) {
    return 'Intenção $number...';
  }

  @override
  String get newMoonEditIntentions => 'Editar intenções';

  @override
  String get newMoonEditUntilWaxing =>
      'Podes editar até a fase crescente começar.';

  @override
  String get newMoonSaveChanges => 'Guardar alterações';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonOk => 'OK';

  @override
  String waxingDayOfWaxing(int day) {
    return 'Dia $day da lua crescente.';
  }

  @override
  String get waxingFullMoonTomorrow => 'Lua cheia amanhã.';

  @override
  String waxingFullMoonInDays(int count) {
    return 'Lua cheia em $count dias.';
  }

  @override
  String get waxingYourIntentions => 'As tuas intenções';

  @override
  String get waxingUnableToLoad => 'Não foi possível carregar as intenções.';

  @override
  String get waxingNoIntentionsFound =>
      'Não foram encontradas intenções para este ciclo.';

  @override
  String get fullMoonNoIntentionsSet =>
      'Não foram definidas intenções neste ciclo';

  @override
  String get fullMoonWorkDone => 'O trabalho está feito.';

  @override
  String get fullMoonNowRelease => 'Agora liberta.';

  @override
  String fullMoonWaningNext(String date) {
    return 'A fase minguante começa em breve.\nO teu próximo ciclo começa na lua nova de $date.';
  }

  @override
  String get fullMoonGiveThanks => 'Lua cheia. Agradece.';

  @override
  String get fullMoonGracePeriodActive => 'Período de graça ativo';

  @override
  String get fullMoonThankUniverse =>
      'Agradece ao universo como se já tivesses o que pediste';

  @override
  String fullMoonProgressOf(int current, int total) {
    return '$current de $total';
  }

  @override
  String get fullMoonGratitudeHint => 'Estou tão grato/a por…';

  @override
  String get fullMoonCompleteCeremony => 'Completar cerimónia';

  @override
  String get fullMoonNextIntention => 'Próxima intenção';

  @override
  String get waningWindowClosed => 'A janela de manifestação está fechada';

  @override
  String waningOpensAgain(int count) {
    return 'Abre novamente em $count dias na lua nova';
  }

  @override
  String get waningReleaseTrust => 'Liberta. Confia.';

  @override
  String get waningWorkDone => 'O trabalho está feito.';

  @override
  String get waningNextNewMoon => 'Próxima lua nova';

  @override
  String get waningWhyQuiet => 'Porque está em silêncio?';

  @override
  String get philosophyTitle => 'Porque é que a janela\nestá fechada agora?';

  @override
  String get philosophyBody1 =>
      'A manifestação não funciona pelo teu horário — funciona pelo da lua. O ciclo lunar tem janelas específicas onde definir intenções é poderoso, e períodos onde a coisa mais poderosa que podes fazer é nada.';

  @override
  String get philosophyBody2 =>
      'Neste momento, a lua está a minguar — a encolher para a escuridão. Esta é a fase de libertação. As tuas intenções deste ciclo foram plantadas, cuidadas e oferecidas em gratidão. Agora precisam de espaço para criar raízes. Pressionar mais durante esta fase não ajuda. Interfere.';

  @override
  String get philosophyBody3 =>
      'Quando a lua nova chegar, a janela abre novamente. Então definirás novas intenções e começarás um novo ciclo. A espera não é tempo perdido — faz parte da prática. A disciplina de largar é o que separa a manifestação do simples desejo.';

  @override
  String get philosophyDaysUntilOpen => 'dias até a janela abrir';

  @override
  String philosophyReminderSetFor(String date) {
    return 'Lembrete definido para $date';
  }

  @override
  String get philosophyRemindMe => 'Lembra-me quando abrir';

  @override
  String get philosophyCouldNotSchedule =>
      'Não foi possível agendar o lembrete';

  @override
  String get philosophyNotificationTitle =>
      'A janela de manifestação está aberta.';

  @override
  String get philosophyNotificationBody => 'Define as tuas intenções agora.';

  @override
  String get philosophyHookTitle => 'O que eles sabem\ne tu não';

  @override
  String get philosophyHookBody1 =>
      'As pessoas mais bem-sucedidas da terra não definem apenas metas. Trabalham com o tempo. Compreendem algo que a maioria nunca entenderá: que o universo tem um ritmo, e quem se alinha com ele não persegue resultados — os resultados perseguem-nos.';

  @override
  String get philosophyHookBody2 =>
      'Isto não é um segredo. É conhecimento antigo — praticado durante milhares de anos por quem moldou impérios, construiu dinastias e moveu o mundo em silêncio. A lua era o seu relógio. «EU SOU» era a sua linguagem. E o compromisso era o seu preço.';

  @override
  String get philosophyHookBody3 =>
      'Eis o que eles compreendiam: a manifestação é simples. Não fácil — simples. Declaras aquilo em que te estás a tornar. Repetes até a tua mente acreditar. Agradeces antes de ver provas. E depois largas. Completamente.';

  @override
  String get philosophyHookBody4 =>
      'A maioria falha porque não se compromete com o processo. Querem o resultado sem a disciplina. Manifestam por um dia, procuram sinais e desistem quando nada acontece até terça-feira. Isso não é manifestação. Isso é simplesmente desejar.';

  @override
  String get philosophyMoonHeading => 'A lua é a peça que falta';

  @override
  String get philosophyMoonBody1 =>
      'Provavelmente já tentaste afirmações. Provavelmente disseste «Eu sou abundante» ao espelho e nada mudou. Isso é porque falavas para o vazio — sem tempo, sem estrutura, sem alinhamento cósmico por trás das tuas palavras.';

  @override
  String get philosophyMoonBody2 =>
      'A lua muda tudo. Dá à tua prática um ciclo — um início, um meio, um clímax e uma libertação. Quando defines intenções na lua nova, não estás a escrever desejos. Estás a plantar sementes na única terra que move oceanos desde antes dos humanos existirem.';

  @override
  String get philosophyMoonBody3 =>
      'A lua minguante não é uma pausa. É a fase mais exigente de todas. Qualquer pessoa pode pedir. Qualquer pessoa pode repetir. Mas largar — realmente soltar e confiar que o que plantaste cresce na escuridão — isso requer a disciplina sobre a qual esta prática foi construída.';

  @override
  String get philosophyFourPhasesHeading => 'As quatro fases sagradas';

  @override
  String get philosophyPhasePlanting => 'A sementeira';

  @override
  String get philosophyPhasePlantingDesc =>
      'Na escuridão, nomeias o que precisas — não o que queres, mas o que a tua alma necessita. A lua nova guarda espaço para a verdade pura.';

  @override
  String get philosophyPhaseTending => 'O cuidado';

  @override
  String get philosophyPhaseTendingDesc =>
      'À medida que a luz regressa, repetes as tuas intenções todos os dias. Não como esperança, mas como certeza. Não estás a pedir — estás a lembrar o que já está a caminho.';

  @override
  String get philosophyPhaseGratitude => 'A gratidão';

  @override
  String get philosophyPhaseGratitudeDesc =>
      'Na iluminação plena, agradeces como se já tivesses o que pediste. Isto não é fingir. É o ato que colapsa a distância entre onde estás e para onde vais.';

  @override
  String get philosophyPhaseRelease => 'A libertação';

  @override
  String get philosophyPhaseReleaseDesc =>
      'E depois — silêncio. Largas. Paras de empurrar, de verificar, de perguntar. A lua minguante ensina a lição mais difícil: que o teu trabalho está feito, e agora pertence a algo maior do que tu.';

  @override
  String get philosophyClosing =>
      'Quando a lua regressar à escuridão,\ncomeças.';

  @override
  String get guideTitle => 'Como manifestar';

  @override
  String get guideIntro =>
      'Quatro regras. É tudo. Domina-as e a lua faz o resto.';

  @override
  String get guideRule01 => 'REGRA 01';

  @override
  String get guideRule01Title => 'Nomeia a necessidade,\nnão o desejo';

  @override
  String get guideRule01Body1 =>
      'O desejo superficial esconde a intenção real. Na verdade não queres um milhão de dólares — queres a sensação de segurança, de liberdade, de não te preocupares. A manifestação funciona ao nível do sentimento, não dos objetos materiais.';

  @override
  String get guideRule01Body2 =>
      'Pergunta-te: porque é que quero isto? A resposta é a tua verdadeira intenção.';

  @override
  String get guideRule01Wrong1 => 'Quero um milhão de dólares';

  @override
  String get guideRule01Right1 => 'Estou a viver liberdade financeira';

  @override
  String get guideRule01Wrong2 => 'Quero um/a parceiro/a';

  @override
  String get guideRule01Right2 =>
      'Estou rodeado/a de conexão profunda e amorosa';

  @override
  String get guideRule01Wrong3 => 'Quero uma promoção';

  @override
  String get guideRule01Right3 =>
      'Sou reconhecido/a e valorizado/a pelo meu trabalho';

  @override
  String get guideRule02 => 'REGRA 02';

  @override
  String get guideRule02Title =>
      'EU SOU — As palavras mais\npoderosas que dirás';

  @override
  String get guideRule02Body1 =>
      'Na Bíblia, quando Moisés perguntou o nome de Deus, a resposta foi «EU SOU O QUE SOU.» Cada tradição que tocou a manifestação — da filosofia hermética a Neville Goddard à prática moderna — trata «EU SOU» como a declaração que molda a realidade.';

  @override
  String get guideRule02Body2 =>
      'O que vier depois de «EU SOU» torna-se a tua ordem ao universo. Escolhe com cuidado.';

  @override
  String get guideRule02Tip1 =>
      'Sempre positivo — «Eu sou saudável», não «Não estou doente»';

  @override
  String get guideRule02Tip2 => 'Sempre no presente — «Eu sou», não «Eu serei»';

  @override
  String get guideRule02Tip3 =>
      'Sempre com convicção — diz como verdade, não como esperança';

  @override
  String get guideRule02Right1 =>
      'Eu sou abundante e o dinheiro flui para mim facilmente';

  @override
  String get guideRule02Right2 => 'Estou em paz com quem me estou a tornar';

  @override
  String get guideRule02Right3 => 'Sou digno/a da vida que estou a criar';

  @override
  String get guideRule03 => 'REGRA 03';

  @override
  String get guideRule03Title => 'Fala como se\njá tivesse acontecido';

  @override
  String get guideRule03Body1 =>
      'Não precisas de saber como vai acontecer. O teu único trabalho é manter a vibração — o sentimento — de já teres o que declaraste.';

  @override
  String get guideRule03Body2 =>
      'O universo não responde ao que queres. Responde ao que és. Não persigas. Não procures sinais. Simplesmente sê isso.';

  @override
  String get guideRule03Wrong1 => 'Espero encontrar paz um dia';

  @override
  String get guideRule03Right1 =>
      'Estou grato/a pela paz que preenche a minha vida';

  @override
  String get guideRule03Wrong2 => 'Estou a tentar ser mais confiante';

  @override
  String get guideRule03Right2 =>
      'Eu sou confiante. Confio em mim completamente.';

  @override
  String get guideRule04 => 'REGRA 04';

  @override
  String get guideRule04Title => 'A gratidão é a prova';

  @override
  String get guideRule04Body1 =>
      'A gratidão não é um agradecimento depois do facto. É o sinal que envias antes de receber — prova ao universo de que confias no processo.';

  @override
  String get guideRule04Body2 =>
      'Quando agradeces por algo que ainda não viste, colapsas a distância entre querer e ter. Esta é a cerimónia que este app te guia em cada lua cheia.';

  @override
  String get guideRule04Right1 =>
      'Estou tão grato/a que a liberdade financeira é a minha realidade';

  @override
  String get guideRule04Right2 =>
      'Obrigado/a pelo amor que me rodeia todos os dias';

  @override
  String get guideRule04Right3 =>
      'Dou graças pela minha saúde, a minha força, a minha clareza';

  @override
  String get guideClosing =>
      'Esta é a tua prática.\nA lua fornece o tempo.\nTu forneces a verdade.';

  @override
  String get lunarCycleTitle => 'O ciclo lunar';

  @override
  String lunarYouAreHere(String phase) {
    return 'Estás aqui: $phase';
  }

  @override
  String lunarDayOfTotal(int day, int total) {
    return 'Dia $day de $total';
  }

  @override
  String get lunarNewMoonPlant => 'Lua nova — Sementeira';

  @override
  String get lunarNewMoonPlantDesc =>
      'Define as tuas intenções. Nomeia o que verdadeiramente precisas. É aqui que o ciclo começa.';

  @override
  String get lunarNewMoonDuration => '~1 dia';

  @override
  String get lunarNewMoonStatus => 'Intenções abertas';

  @override
  String get lunarWaxingTend => 'Crescente — Cuidado';

  @override
  String get lunarWaxingTendDesc =>
      'Repete as tuas intenções todos os dias. Constrói fé através da repetição. A lua cresce, e a tua convicção também.';

  @override
  String get lunarWaxingDuration => '~14 dias';

  @override
  String get lunarWaxingStatus => 'Lembretes diários ativos';

  @override
  String get lunarFullMoonGiveThanks => 'Lua cheia — Agradece';

  @override
  String get lunarFullMoonGiveThanksDesc =>
      'Expressa gratidão como se já tivesses o que pediste. Este é o clímax — o momento de receber.';

  @override
  String get lunarFullMoonDuration => '~1 dia';

  @override
  String get lunarFullMoonStatus => 'Cerimónia de gratidão';

  @override
  String get lunarWaningRelease => 'Minguante — Libertação';

  @override
  String get lunarWaningReleaseDesc =>
      'Larga completamente. Para de empurrar, de verificar. Confia que o que plantaste cresce na escuridão.';

  @override
  String get lunarWaningDuration => '~14 dias';

  @override
  String get lunarWaningStatus => 'Janela fechada — silêncio';

  @override
  String get lunarLegendManifest => 'Manifestar';

  @override
  String get lunarLegendRelease => 'Libertar';

  @override
  String get lunarThisCycle => 'Este ciclo';

  @override
  String get lunarNow => 'AGORA';

  @override
  String get cycleDiagramNewMoon => 'Lua nova';

  @override
  String get cycleDiagramWaxingCrescent => 'Crescente\ncornudo';

  @override
  String get cycleDiagramFirstQuarter => 'Quarto\ncrescente';

  @override
  String get cycleDiagramWaxingGibbous => 'Gibosa\ncrescente';

  @override
  String get cycleDiagramFullMoon => 'Lua cheia';

  @override
  String get cycleDiagramWaningGibbous => 'Gibosa\nminguante';

  @override
  String get cycleDiagramLastQuarter => 'Último\nquarto';

  @override
  String get cycleDiagramWaningCrescent => 'Crescente\nminguante';

  @override
  String get cycleDiagramManifest => 'MANIFESTAR';

  @override
  String get cycleDiagramRelease => 'LIBERTAR';

  @override
  String get cycleThisCycle => 'Este ciclo';

  @override
  String get cycleSeeFullDetails => 'Ver detalhes completos do ciclo';

  @override
  String debugLabel(String info) {
    return 'DEBUG: $info';
  }

  @override
  String get debugLive => 'live';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsNotifications => 'Notificações';

  @override
  String get settingsReminderFrequency =>
      'Frequência dos lembretes (vezes por dia)';

  @override
  String get settingsWakeWindow => 'Janela de vigília';

  @override
  String get settingsWakeWindowStart => 'Início';

  @override
  String get settingsWakeWindowEnd => 'Fim';

  @override
  String get settingsMoonStyle => 'Estilo da lua';

  @override
  String get settingsMoonStyleDescription =>
      'Escolhe como a lua aparece na app';

  @override
  String get settingsMoonStyleClassic => 'Clássica';

  @override
  String get settingsMoonStyleStarfield => 'Campo estelar';

  @override
  String get settingsMoonStyleAura => 'Aura';

  @override
  String get settingsMoonStyleHalo => 'Halo';

  @override
  String get settingsData => 'Dados';

  @override
  String get settingsExportData => 'Exportar dados';

  @override
  String get settingsImportData => 'Importar dados';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsAboutDescription =>
      'Moon Manifest é um companheiro ritual pessoal desenhado para te ajudar a alinhar as tuas intenções com o ciclo lunar. A cada lua nova, defines até três intenções e passas os 28 dias seguintes a cultivá-las através de gratidão e reflexão diária. Os teus dados são armazenados de forma segura no teu dispositivo e nunca são enviados para nenhum servidor. Usa a função de exportação para criar uma cópia de segurança encriptada, e importa-a num novo dispositivo para restaurar a tua prática.';

  @override
  String get settingsManifestationGuide => 'Guia de manifestação';

  @override
  String get settingsExportPasswordTitle =>
      'Definir palavra-passe de exportação';

  @override
  String get settingsImportPasswordTitle =>
      'Introduzir palavra-passe de importação';

  @override
  String get settingsPasswordHint => 'Palavra-passe';

  @override
  String settingsExportFailed(String error) {
    return 'A exportação falhou: $error';
  }

  @override
  String get settingsCouldNotReadFile => 'Não foi possível ler o ficheiro.';

  @override
  String get settingsDataImported => 'Dados importados com sucesso.';

  @override
  String get settingsWrongPassword =>
      'Palavra-passe errada ou ficheiro corrompido.';

  @override
  String settingsImportFailed(String error) {
    return 'A importação falhou: $error';
  }

  @override
  String get settingsExportSubject => 'Cópia de segurança do Moon Manifest';

  @override
  String get historyTitle => 'Histórico';

  @override
  String get historyNoCompletedCycles => 'Ainda sem ciclos completos';

  @override
  String get historyOngoing => 'Em curso';

  @override
  String historyIntentionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count intenções',
      one: '1 intenção',
    );
    return '$_temp0';
  }

  @override
  String get historyIntentionsLabel => 'Intenções';

  @override
  String get historyGratitudesLabel => 'Gratidões';

  @override
  String get phaseNewMoon => 'Lua nova';

  @override
  String get phaseWaxing => 'Crescente';

  @override
  String get phaseFullMoon => 'Lua cheia';

  @override
  String get phaseWaning => 'Minguante';

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
  String get wisdom1 => 'O que procuras está a procurar-te.';

  @override
  String get wisdom1Author => 'Rumi';

  @override
  String get wisdom2 =>
      'O universo não está fora de ti. Olha para dentro; tudo o que queres, já o és.';

  @override
  String get wisdom2Author => 'Rumi';

  @override
  String get wisdom3 => 'Confia na espera. Abraça a incerteza.';

  @override
  String get wisdom4 => 'Não atrais o que queres. Atrais o que és.';

  @override
  String get wisdom5 =>
      'Quando largo o que sou, torno-me naquilo que posso ser.';

  @override
  String get wisdom5Author => 'Lao Tzu';

  @override
  String get wisdom6 =>
      'A natureza não se apressa, e no entanto tudo se realiza.';

  @override
  String get wisdom6Author => 'Lao Tzu';

  @override
  String get wisdom7 =>
      'Assume o sentimento do teu desejo realizado e observa o caminho que a tua atenção segue.';

  @override
  String get wisdom7Author => 'Neville Goddard';

  @override
  String get wisdom8 =>
      'A maior ilusão do homem é a sua convicção de que existem causas para além do seu próprio estado de consciência.';

  @override
  String get wisdom8Author => 'Neville Goddard';

  @override
  String get wisdom9 =>
      'És sempre estudante, nunca mestre. Tens de continuar a avançar.';

  @override
  String get wisdom9Author => 'Conrad Hall';

  @override
  String get wisdom10 =>
      'Deixa de agir tão pequeno. És o universo em movimento extático.';

  @override
  String get wisdom10Author => 'Rumi';

  @override
  String get wisdom11 => 'O momento presente sempre terá sido. Descansa nisso.';

  @override
  String get wisdom12 =>
      'Largar dá-nos liberdade, e a liberdade é a única condição para a felicidade.';

  @override
  String get wisdom12Author => 'Thich Nhat Hanh';

  @override
  String get wisdom13 =>
      'Render-se não é desistir. É entregar-se a algo maior.';

  @override
  String get wisdom14 =>
      'Tens dentro de ti agora mesmo tudo o que precisas para lidar com qualquer coisa que o mundo te apresente.';

  @override
  String get wisdom14Author => 'Brian Tracy';

  @override
  String get wisdom15 =>
      'Quanto mais silencioso te tornas, mais consegues ouvir.';

  @override
  String get wisdom15Author => 'Rumi';

  @override
  String get wisdom16 =>
      'A tua tarefa não é procurar o amor, mas simplesmente procurar e encontrar todas as barreiras que construíste dentro de ti contra ele.';

  @override
  String get wisdom16Author => 'Rumi';

  @override
  String get wisdom17 =>
      'A fé é dar o primeiro passo mesmo quando não vês a escada toda.';

  @override
  String get wisdom17Author => 'Martin Luther King Jr.';

  @override
  String get wisdom18 =>
      'A semente não luta contra a terra. Simplesmente cresce.';

  @override
  String get wisdom19 =>
      'Liberta a necessidade de saber como. Confia que o universo conhece o caminho.';

  @override
  String get wisdom20 =>
      'Começa a ver-te como uma alma com um corpo em vez de um corpo com uma alma.';

  @override
  String get wisdom20Author => 'Wayne Dyer';

  @override
  String get wisdom21 =>
      'Nem sempre podes controlar o que acontece lá fora. Mas sempre podes controlar o que acontece cá dentro.';

  @override
  String get wisdom21Author => 'Wayne Dyer';

  @override
  String get wisdom22 => 'A paciência não é espera passiva. É confiança ativa.';

  @override
  String get wisdom23 =>
      'Tudo o que precisas já está dentro de ti, à espera de se desdobrar.';

  @override
  String get wisdom24 =>
      'A lua não luta. Observa. E ao observar, mantém tudo unido.';

  @override
  String get wisdom25 =>
      'Age como se o que pretendes manifestar na tua vida já fosse realidade.';

  @override
  String get wisdom25Author => 'Wayne Dyer';

  @override
  String get wisdom26 => 'Fica em silêncio e sabe.';

  @override
  String get wisdom27 => 'Larga os ramos e confia no rio.';

  @override
  String get wisdom28 => 'A ferida é o lugar por onde a luz entra em ti.';

  @override
  String get wisdom28Author => 'Rumi';

  @override
  String get wisdom29 =>
      'Um navio no porto está seguro, mas não é para isso que os navios são construídos.';

  @override
  String get wisdom29Author => 'John A. Shedd';

  @override
  String get wisdom30 =>
      'O universo está sempre a falar connosco. A enviar-nos pequenas mensagens, a causar coincidências e serendipidades. A única questão é: estamos a ouvir?';

  @override
  String get wisdom30Author => 'Nancy Thayer';
}
