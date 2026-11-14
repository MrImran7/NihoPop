import 'lesson.dart';

class VocabularyWord {
  final String japanese;
  final String reading;
  final String meaning;
  final Lesson lesson;

  const VocabularyWord(this.japanese, this.reading, this.meaning, this.lesson);

  // Stable bookmark identity; keep lesson IDs and Japanese spelling stable.
  String get id => '${lesson.id}:$japanese';
  String get label => japanese == reading ? japanese : '$japanese（$reading）';
  String get topic => lesson.title.replaceFirst('Vocabulary: ', '');
}

// Keep this reference aligned with the taught words; tests check all mappings.
const vocabularyWords = <VocabularyWord>[
  VocabularyWord('人', 'ひと', 'Person', vocabularyPeople),
  VocabularyWord('友達', 'ともだち', 'Friend', vocabularyPeople),
  VocabularyWord('先生', 'せんせい', 'Teacher', vocabularyPeople),
  VocabularyWord('学生', 'がくせい', 'Student', vocabularyPeople),
  VocabularyWord('子供', 'こども', 'Child', vocabularyPeople),
  VocabularyWord('家族', 'かぞく', 'Family', vocabularyPeople),
  VocabularyWord('水', 'みず', 'Water', vocabularyFood),
  VocabularyWord('お茶', 'おちゃ', 'Tea', vocabularyFood),
  VocabularyWord('ご飯', 'ごはん', 'Cooked rice / meal', vocabularyFood),
  VocabularyWord('パン', 'パン', 'Bread', vocabularyFood),
  VocabularyWord('魚', 'さかな', 'Fish', vocabularyFood),
  VocabularyWord('卵', 'たまご', 'Egg', vocabularyFood),
  VocabularyWord('学校', 'がっこう', 'School', vocabularyPlaces),
  VocabularyWord('駅', 'えき', 'Station', vocabularyPlaces),
  VocabularyWord('店', 'みせ', 'Shop', vocabularyPlaces),
  VocabularyWord('病院', 'びょういん', 'Hospital', vocabularyPlaces),
  VocabularyWord('図書館', 'としょかん', 'Library', vocabularyPlaces),
  VocabularyWord('公園', 'こうえん', 'Park', vocabularyPlaces),
  VocabularyWord('本', 'ほん', 'Book', vocabularyObjects),
  VocabularyWord('かばん', 'かばん', 'Bag', vocabularyObjects),
  VocabularyWord('電話', 'でんわ', 'Telephone', vocabularyObjects),
  VocabularyWord('鍵', 'かぎ', 'Key', vocabularyObjects),
  VocabularyWord('時計', 'とけい', 'Clock / watch', vocabularyObjects),
  VocabularyWord('傘', 'かさ', 'Umbrella', vocabularyObjects),
  VocabularyWord('今日', 'きょう', 'Today', vocabularyTime),
  VocabularyWord('明日', 'あした', 'Tomorrow', vocabularyTime),
  VocabularyWord('昨日', 'きのう', 'Yesterday', vocabularyTime),
  VocabularyWord('朝', 'あさ', 'Morning', vocabularyTime),
  VocabularyWord('午後', 'ごご', 'Afternoon / p.m.', vocabularyTime),
  VocabularyWord('夜', 'よる', 'Night', vocabularyTime),
  VocabularyWord('電車', 'でんしゃ', 'Train', vocabularyTransport),
  VocabularyWord('バス', 'バス', 'Bus', vocabularyTransport),
  VocabularyWord('タクシー', 'タクシー', 'Taxi', vocabularyTransport),
  VocabularyWord('自転車', 'じてんしゃ', 'Bicycle', vocabularyTransport),
  VocabularyWord('車', 'くるま', 'Car', vocabularyTransport),
  VocabularyWord('飛行機', 'ひこうき', 'Airplane', vocabularyTransport),
  VocabularyWord('赤', 'あか', 'Red', vocabularyColours),
  VocabularyWord('青', 'あお', 'Blue', vocabularyColours),
  VocabularyWord('白', 'しろ', 'White', vocabularyColours),
  VocabularyWord('黒', 'くろ', 'Black', vocabularyColours),
  VocabularyWord('黄色', 'きいろ', 'Yellow', vocabularyColours),
  VocabularyWord('緑', 'みどり', 'Green', vocabularyColours),
  VocabularyWord('食べる', 'たべる', 'To eat', vocabularyActions),
  VocabularyWord('飲む', 'のむ', 'To drink', vocabularyActions),
  VocabularyWord('行く', 'いく', 'To go', vocabularyActions),
  VocabularyWord('来る', 'くる', 'To come', vocabularyActions),
  VocabularyWord('見る', 'みる', 'To see / watch', vocabularyActions),
  VocabularyWord('読む', 'よむ', 'To read', vocabularyActions),
];

String _normalise(String value) {
  // Accept either full-width kana script when looking up a reading.
  return String.fromCharCodes(value.trim().toLowerCase().runes.map(
    (rune) => rune >= 0x30A1 && rune <= 0x30F6 ? rune - 0x60 : rune,
  ));
}

List<VocabularyWord> searchVocabulary(String query, {String? lessonId}) {
  final terms = _normalise(query).split(RegExp(r'\s+'))
      .where((term) => term.isNotEmpty);
  return vocabularyWords.where((word) {
    if (lessonId != null && word.lesson.id != lessonId) return false;
    final text = _normalise('${word.japanese} ${word.reading} ${word.meaning}');
    return terms.every(text.contains);
  }).toList(growable: false);
}
