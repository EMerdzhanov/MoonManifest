import 'package:moon_manifest/l10n/app_localizations.dart';

class WisdomQuote {
  final String text;
  final String? author;

  const WisdomQuote({required this.text, this.author});
}

class DailyWisdom {
  DailyWisdom._();

  static const List<WisdomQuote> _quotes = [
    WisdomQuote(
      text: 'What you seek is seeking you.',
      author: 'Rumi',
    ),
    WisdomQuote(
      text:
          'The universe is not outside of you. Look inside yourself; everything that you want, you already are.',
      author: 'Rumi',
    ),
    WisdomQuote(
      text: 'Trust the wait. Embrace the uncertainty.',
    ),
    WisdomQuote(
      text: 'You don\'t attract what you want. You attract what you are.',
    ),
    WisdomQuote(
      text:
          'When I let go of what I am, I become what I might be.',
      author: 'Lao Tzu',
    ),
    WisdomQuote(
      text: 'Nature does not hurry, yet everything is accomplished.',
      author: 'Lao Tzu',
    ),
    WisdomQuote(
      text:
          'Assume the feeling of your wish fulfilled and observe the route that your attention follows.',
      author: 'Neville Goddard',
    ),
    WisdomQuote(
      text:
          'Man\'s chief delusion is his conviction that there are causes other than his own state of consciousness.',
      author: 'Neville Goddard',
    ),
    WisdomQuote(
      text:
          'You are always a student, never a master. You have to keep moving forward.',
      author: 'Conrad Hall',
    ),
    WisdomQuote(
      text:
          'Stop acting so small. You are the universe in ecstatic motion.',
      author: 'Rumi',
    ),
    WisdomQuote(
      text: 'The present moment always will have been. Rest in that.',
    ),
    WisdomQuote(
      text:
          'Letting go gives us freedom, and freedom is the only condition for happiness.',
      author: 'Thich Nhat Hanh',
    ),
    WisdomQuote(
      text: 'Surrender is not giving up. It is giving over to something greater.',
    ),
    WisdomQuote(
      text:
          'You have within you right now, everything you need to deal with whatever the world can throw at you.',
      author: 'Brian Tracy',
    ),
    WisdomQuote(
      text: 'The quieter you become, the more you are able to hear.',
      author: 'Rumi',
    ),
    WisdomQuote(
      text:
          'Your task is not to seek for love, but merely to seek and find all the barriers within yourself that you have built against it.',
      author: 'Rumi',
    ),
    WisdomQuote(
      text: 'Faith is taking the first step even when you don\'t see the whole staircase.',
      author: 'Martin Luther King Jr.',
    ),
    WisdomQuote(
      text:
          'The seed does not fight the soil. It simply grows.',
    ),
    WisdomQuote(
      text: 'Release the need to know how. Trust that the universe knows the way.',
    ),
    WisdomQuote(
      text:
          'Begin to see yourself as a soul with a body rather than a body with a soul.',
      author: 'Wayne Dyer',
    ),
    WisdomQuote(
      text:
          'You cannot always control what goes on outside. But you can always control what goes on inside.',
      author: 'Wayne Dyer',
    ),
    WisdomQuote(
      text: 'Patience is not passive waiting. It is active trust.',
    ),
    WisdomQuote(
      text:
          'Everything you need is already within you, waiting to unfold.',
    ),
    WisdomQuote(
      text:
          'The moon does not fight. It watches. And in watching, it holds everything together.',
    ),
    WisdomQuote(
      text:
          'Act as if what you intend to manifest in life is already a reality.',
      author: 'Wayne Dyer',
    ),
    WisdomQuote(
      text: 'Be still and know.',
    ),
    WisdomQuote(
      text:
          'Let go of the branches and trust the river.',
    ),
    WisdomQuote(
      text:
          'The wound is the place where the light enters you.',
      author: 'Rumi',
    ),
    WisdomQuote(
      text:
          'A ship in a harbor is safe, but that is not what ships are built for.',
      author: 'John A. Shedd',
    ),
    WisdomQuote(
      text:
          'The universe is always speaking to us. Sending us little messages, causing coincidences and serendipities. The only question is: are we listening?',
      author: 'Nancy Thayer',
    ),
  ];

  /// Returns the wisdom quote for the given day within the waning phase.
  /// [dayInPhase] should be 1-based (day 1 = first day of waning).
  static WisdomQuote forDay(int dayInPhase) {
    final index = (dayInPhase - 1).clamp(0, _quotes.length - 1) % _quotes.length;
    return _quotes[index];
  }

  /// Returns the localized wisdom quote for the given day.
  static WisdomQuote forDayLocalized(int dayInPhase, AppLocalizations l10n) {
    final index = (dayInPhase - 1).clamp(0, 29) % 30;
    final texts = [
      l10n.wisdom1, l10n.wisdom2, l10n.wisdom3, l10n.wisdom4, l10n.wisdom5,
      l10n.wisdom6, l10n.wisdom7, l10n.wisdom8, l10n.wisdom9, l10n.wisdom10,
      l10n.wisdom11, l10n.wisdom12, l10n.wisdom13, l10n.wisdom14, l10n.wisdom15,
      l10n.wisdom16, l10n.wisdom17, l10n.wisdom18, l10n.wisdom19, l10n.wisdom20,
      l10n.wisdom21, l10n.wisdom22, l10n.wisdom23, l10n.wisdom24, l10n.wisdom25,
      l10n.wisdom26, l10n.wisdom27, l10n.wisdom28, l10n.wisdom29, l10n.wisdom30,
    ];
    final authors = <int, String>{
      0: l10n.wisdom1Author,
      1: l10n.wisdom2Author,
      4: l10n.wisdom5Author,
      5: l10n.wisdom6Author,
      6: l10n.wisdom7Author,
      7: l10n.wisdom8Author,
      8: l10n.wisdom9Author,
      9: l10n.wisdom10Author,
      11: l10n.wisdom12Author,
      13: l10n.wisdom14Author,
      14: l10n.wisdom15Author,
      15: l10n.wisdom16Author,
      16: l10n.wisdom17Author,
      19: l10n.wisdom20Author,
      20: l10n.wisdom21Author,
      24: l10n.wisdom25Author,
      27: l10n.wisdom28Author,
      28: l10n.wisdom29Author,
      29: l10n.wisdom30Author,
    };
    return WisdomQuote(text: texts[index], author: authors[index]);
  }
}
