import 'dart:convert';

class Intention {
  final String id;
  final String text;
  final DateTime createdAt;

  const Intention({required this.id, required this.text, required this.createdAt});

  Map<String, dynamic> toJson() => {
    'id': id, 'text': text, 'createdAt': createdAt.toIso8601String(),
  };

  factory Intention.fromJson(Map<String, dynamic> json) => Intention(
    id: json['id'] as String,
    text: json['text'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

class Gratitude {
  final String intentionId;
  final String text;
  final DateTime createdAt;

  const Gratitude({required this.intentionId, required this.text, required this.createdAt});

  Map<String, dynamic> toJson() => {
    'intentionId': intentionId, 'text': text, 'createdAt': createdAt.toIso8601String(),
  };

  factory Gratitude.fromJson(Map<String, dynamic> json) => Gratitude(
    intentionId: json['intentionId'] as String,
    text: json['text'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

class Cycle {
  final String id;
  final DateTime newMoonDate;
  final DateTime? fullMoonDate;
  final DateTime? cycleEndDate;
  final List<Intention> intentions;
  final List<Gratitude> gratitudes;
  final bool intentionsLocked;
  final bool gratitudeCompleted;

  const Cycle({
    required this.id,
    required this.newMoonDate,
    this.fullMoonDate,
    this.cycleEndDate,
    this.intentions = const [],
    this.gratitudes = const [],
    this.intentionsLocked = false,
    this.gratitudeCompleted = false,
  });

  Cycle copyWith({
    String? id, DateTime? newMoonDate, DateTime? fullMoonDate,
    DateTime? cycleEndDate, List<Intention>? intentions,
    List<Gratitude>? gratitudes, bool? intentionsLocked, bool? gratitudeCompleted,
  }) => Cycle(
    id: id ?? this.id,
    newMoonDate: newMoonDate ?? this.newMoonDate,
    fullMoonDate: fullMoonDate ?? this.fullMoonDate,
    cycleEndDate: cycleEndDate ?? this.cycleEndDate,
    intentions: intentions ?? this.intentions,
    gratitudes: gratitudes ?? this.gratitudes,
    intentionsLocked: intentionsLocked ?? this.intentionsLocked,
    gratitudeCompleted: gratitudeCompleted ?? this.gratitudeCompleted,
  );

  bool get isComplete => cycleEndDate != null;

  Map<String, dynamic> toJson() => {
    'id': id,
    'newMoonDate': newMoonDate.toIso8601String(),
    'fullMoonDate': fullMoonDate?.toIso8601String(),
    'cycleEndDate': cycleEndDate?.toIso8601String(),
    'intentions': intentions.map((i) => i.toJson()).toList(),
    'gratitudes': gratitudes.map((g) => g.toJson()).toList(),
    'intentionsLocked': intentionsLocked,
    'gratitudeCompleted': gratitudeCompleted,
  };

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
    id: json['id'] as String,
    newMoonDate: DateTime.parse(json['newMoonDate'] as String),
    fullMoonDate: json['fullMoonDate'] != null ? DateTime.parse(json['fullMoonDate'] as String) : null,
    cycleEndDate: json['cycleEndDate'] != null ? DateTime.parse(json['cycleEndDate'] as String) : null,
    intentions: (json['intentions'] as List<dynamic>).map((i) => Intention.fromJson(i as Map<String, dynamic>)).toList(),
    gratitudes: (json['gratitudes'] as List<dynamic>).map((g) => Gratitude.fromJson(g as Map<String, dynamic>)).toList(),
    intentionsLocked: json['intentionsLocked'] as bool? ?? false,
    gratitudeCompleted: json['gratitudeCompleted'] as bool? ?? false,
  );

  String toJsonString() => jsonEncode(toJson());
  factory Cycle.fromJsonString(String jsonString) => Cycle.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
}
