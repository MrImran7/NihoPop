part of 'lesson.dart';

// Original introductory vocabulary; readings stay visible in both directions.

const vocabularyPeople = Lesson(
  'vocabulary-people-v1',
  'Vocabulary: people',
  '人（ひと） — Person\n友達（ともだち） — Friend\n先生（せんせい） — Teacher\n学生（がくせい） — Student\n子供（こども） — Child\n家族（かぞく） — Family\n\nThese nouns name people and relationships. The readings in parentheses help you read the kanji. Japanese nouns do not usually change form for plural: context tells you whether there is one or more.',
  [
    Exercise('What does 人（ひと） mean?', ['Friend', 'Person', 'Student'], 1, '人（ひと） means person. 人 is read ひと when it stands alone meaning a person.'),
    Exercise('What does 友達（ともだち） mean?', ['Teacher', 'Child', 'Friend'], 2, '友達（ともだち） means friend. 友達 means a friend or friends; context supplies the number.'),
    Exercise('What does 先生（せんせい） mean?', ['Teacher', 'Student', 'Family'], 0, '先生（せんせい） means teacher. 先生 means teacher here. It is also a respectful title for professionals such as doctors.'),
    Exercise('What does 学生（がくせい） mean?', ['Child', 'Student', 'Person'], 1, '学生（がくせい） means student. 学生 means a student.'),
    Exercise('What does 子供（こども） mean?', ['Family', 'Friend', 'Child'], 2, '子供（こども） means child. 子供 means a child or children; you may also see 子ども.'),
    Exercise('What does 家族（かぞく） mean?', ['Family', 'Person', 'Teacher'], 0, '家族（かぞく） means family. 家族 refers to a family, not the building they live in.'),
    Exercise('Choose the Japanese for “Person”.', ['友達（ともだち）', '学生（がくせい）', '人（ひと）'], 2, '人（ひと） means person. 人 is read ひと when it stands alone meaning a person.'),
    Exercise('Choose the Japanese for “Friend”.', ['友達（ともだち）', '先生（せんせい）', '子供（こども）'], 0, '友達（ともだち） means friend. 友達 means a friend or friends; context supplies the number.'),
    Exercise('Choose the Japanese for “Teacher”.', ['学生（がくせい）', '先生（せんせい）', '家族（かぞく）'], 1, '先生（せんせい） means teacher. 先生 means teacher here. It is also a respectful title for professionals such as doctors.'),
    Exercise('Choose the Japanese for “Student”.', ['子供（こども）', '人（ひと）', '学生（がくせい）'], 2, '学生（がくせい） means student. 学生 means a student.'),
    Exercise('Choose the Japanese for “Child”.', ['子供（こども）', '家族（かぞく）', '友達（ともだち）'], 0, '子供（こども） means child. 子供 means a child or children; you may also see 子ども.'),
    Exercise('Choose the Japanese for “Family”.', ['人（ひと）', '家族（かぞく）', '先生（せんせい）'], 1, '家族（かぞく） means family. 家族 refers to a family, not the building they live in.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyFood = Lesson(
  'vocabulary-food-v1',
  'Vocabulary: food and drink',
  '水（みず） — Water\nお茶（おちゃ） — Tea\nご飯（ごはん） — Cooked rice / meal\nパン — Bread\n魚（さかな） — Fish\n卵（たまご） — Egg\n\nLearn common food and drink words. The English labels give the meanings used in these exercises; some Japanese words have more than one meaning.',
  [
    Exercise('What does 水（みず） mean?', ['Tea', 'Water', 'Bread'], 1, '水（みず） means water. 水 means water. Hot water is commonly called お湯（おゆ）.'),
    Exercise('What does お茶（おちゃ） mean?', ['Cooked rice / meal', 'Fish', 'Tea'], 2, 'お茶（おちゃ） means tea. お茶 means tea; the type depends on context.'),
    Exercise('What does ご飯（ごはん） mean?', ['Cooked rice / meal', 'Bread', 'Egg'], 0, 'ご飯（ごはん） means cooked rice / meal. ご飯 can mean cooked rice or a meal. Uncooked rice is 米（こめ）.'),
    Exercise('What does パン mean?', ['Fish', 'Bread', 'Water'], 1, 'パン means bread. パン means bread and is written in katakana.'),
    Exercise('What does 魚（さかな） mean?', ['Egg', 'Tea', 'Fish'], 2, '魚（さかな） means fish. 魚 means fish, including fish as food in this lesson.'),
    Exercise('What does 卵（たまご） mean?', ['Egg', 'Water', 'Cooked rice / meal'], 0, '卵（たまご） means egg. 卵 means egg. You may also see 玉子, particularly in food contexts.'),
    Exercise('Choose the Japanese for “Water”.', ['お茶（おちゃ）', 'パン', '水（みず）'], 2, '水（みず） means water. 水 means water. Hot water is commonly called お湯（おゆ）.'),
    Exercise('Choose the Japanese for “Tea”.', ['お茶（おちゃ）', 'ご飯（ごはん）', '魚（さかな）'], 0, 'お茶（おちゃ） means tea. お茶 means tea; the type depends on context.'),
    Exercise('Choose the Japanese for “Cooked rice / meal”.', ['パン', 'ご飯（ごはん）', '卵（たまご）'], 1, 'ご飯（ごはん） means cooked rice / meal. ご飯 can mean cooked rice or a meal. Uncooked rice is 米（こめ）.'),
    Exercise('Choose the Japanese for “Bread”.', ['魚（さかな）', '水（みず）', 'パン'], 2, 'パン means bread. パン means bread and is written in katakana.'),
    Exercise('Choose the Japanese for “Fish”.', ['魚（さかな）', '卵（たまご）', 'お茶（おちゃ）'], 0, '魚（さかな） means fish. 魚 means fish, including fish as food in this lesson.'),
    Exercise('Choose the Japanese for “Egg”.', ['水（みず）', '卵（たまご）', 'ご飯（ごはん）'], 1, '卵（たまご） means egg. 卵 means egg. You may also see 玉子, particularly in food contexts.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyPlaces = Lesson(
  'vocabulary-places-v1',
  'Vocabulary: places',
  '学校（がっこう） — School\n駅（えき） — Station\n店（みせ） — Shop\n病院（びょういん） — Hospital\n図書館（としょかん） — Library\n公園（こうえん） — Park\n\nLearn six places you may see on signs or hear in everyday conversation. Notice small っ in がっこう and small ょ in としょかん.',
  [
    Exercise('What does 学校（がっこう） mean?', ['Station', 'School', 'Hospital'], 1, '学校（がっこう） means school. 学校 is read がっこう: keep the small っ and the long final vowel.'),
    Exercise('What does 駅（えき） mean?', ['Shop', 'Library', 'Station'], 2, '駅（えき） means station. 駅 means a railway station.'),
    Exercise('What does 店（みせ） mean?', ['Shop', 'Hospital', 'Park'], 0, '店（みせ） means shop. 店 is read みせ when it stands alone meaning a shop or store.'),
    Exercise('What does 病院（びょういん） mean?', ['Library', 'Hospital', 'School'], 1, '病院（びょういん） means hospital. 病院 is びょういん, hospital. Small ょ makes びょ; 美容院（びよういん）, a hair salon, has full-sized よ.'),
    Exercise('What does 図書館（としょかん） mean?', ['Park', 'Station', 'Library'], 2, '図書館（としょかん） means library. 図書館 means library. しょ uses a small ょ.'),
    Exercise('What does 公園（こうえん） mean?', ['Park', 'School', 'Shop'], 0, '公園（こうえん） means park. 公園 means a public park.'),
    Exercise('Choose the Japanese for “School”.', ['駅（えき）', '病院（びょういん）', '学校（がっこう）'], 2, '学校（がっこう） means school. 学校 is read がっこう: keep the small っ and the long final vowel.'),
    Exercise('Choose the Japanese for “Station”.', ['駅（えき）', '店（みせ）', '図書館（としょかん）'], 0, '駅（えき） means station. 駅 means a railway station.'),
    Exercise('Choose the Japanese for “Shop”.', ['病院（びょういん）', '店（みせ）', '公園（こうえん）'], 1, '店（みせ） means shop. 店 is read みせ when it stands alone meaning a shop or store.'),
    Exercise('Choose the Japanese for “Hospital”.', ['図書館（としょかん）', '学校（がっこう）', '病院（びょういん）'], 2, '病院（びょういん） means hospital. 病院 is びょういん, hospital. Small ょ makes びょ; 美容院（びよういん）, a hair salon, has full-sized よ.'),
    Exercise('Choose the Japanese for “Library”.', ['図書館（としょかん）', '公園（こうえん）', '駅（えき）'], 0, '図書館（としょかん） means library. 図書館 means library. しょ uses a small ょ.'),
    Exercise('Choose the Japanese for “Park”.', ['学校（がっこう）', '公園（こうえん）', '店（みせ）'], 1, '公園（こうえん） means park. 公園 means a public park.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyObjects = Lesson(
  'vocabulary-objects-v1',
  'Vocabulary: everyday objects',
  '本（ほん） — Book\nかばん — Bag\n電話（でんわ） — Telephone\n鍵（かぎ） — Key\n時計（とけい） — Clock / watch\n傘（かさ） — Umbrella\n\nLearn everyday things you can point to. Kana readings stay visible during practice so this lesson tests meaning rather than kanji recall.',
  [
    Exercise('What does 本（ほん） mean?', ['Bag', 'Book', 'Key'], 1, '本（ほん） means book. 本 is read ほん when it stands alone meaning a book.'),
    Exercise('What does かばん mean?', ['Telephone', 'Clock / watch', 'Bag'], 2, 'かばん means bag. かばん means bag. It can also be written 鞄.'),
    Exercise('What does 電話（でんわ） mean?', ['Telephone', 'Key', 'Umbrella'], 0, '電話（でんわ） means telephone. 電話 means telephone; it can also refer to a phone call in context.'),
    Exercise('What does 鍵（かぎ） mean?', ['Clock / watch', 'Key', 'Book'], 1, '鍵（かぎ） means key. 鍵 is read かぎ and means a key in this lesson.'),
    Exercise('What does 時計（とけい） mean?', ['Umbrella', 'Bag', 'Clock / watch'], 2, '時計（とけい） means clock / watch. 時計 can refer to a clock or a watch.'),
    Exercise('What does 傘（かさ） mean?', ['Umbrella', 'Book', 'Telephone'], 0, '傘（かさ） means umbrella. 傘 is read かさ and means umbrella.'),
    Exercise('Choose the Japanese for “Book”.', ['かばん', '鍵（かぎ）', '本（ほん）'], 2, '本（ほん） means book. 本 is read ほん when it stands alone meaning a book.'),
    Exercise('Choose the Japanese for “Bag”.', ['かばん', '電話（でんわ）', '時計（とけい）'], 0, 'かばん means bag. かばん means bag. It can also be written 鞄.'),
    Exercise('Choose the Japanese for “Telephone”.', ['鍵（かぎ）', '電話（でんわ）', '傘（かさ）'], 1, '電話（でんわ） means telephone. 電話 means telephone; it can also refer to a phone call in context.'),
    Exercise('Choose the Japanese for “Key”.', ['時計（とけい）', '本（ほん）', '鍵（かぎ）'], 2, '鍵（かぎ） means key. 鍵 is read かぎ and means a key in this lesson.'),
    Exercise('Choose the Japanese for “Clock / watch”.', ['時計（とけい）', '傘（かさ）', 'かばん'], 0, '時計（とけい） means clock / watch. 時計 can refer to a clock or a watch.'),
    Exercise('Choose the Japanese for “Umbrella”.', ['本（ほん）', '傘（かさ）', '電話（でんわ）'], 1, '傘（かさ） means umbrella. 傘 is read かさ and means umbrella.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyLessons = [
  vocabularyPeople,
  vocabularyFood,
  vocabularyPlaces,
  vocabularyObjects,
];
