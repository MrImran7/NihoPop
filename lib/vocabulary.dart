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

const vocabularyTime = Lesson(
  'vocabulary-time-v1',
  'Vocabulary: time',
  '今日（きょう） — Today\n明日（あした） — Tomorrow\n昨日（きのう） — Yesterday\n朝（あさ） — Morning\n午後（ごご） — Afternoon / p.m.\n夜（よる） — Night\n\nLearn words for days and parts of the day. 今日, 明日 and 昨日 have whole-word readings; do not try to read each kanji separately here.',
  [
    Exercise('What does 今日（きょう） mean?', ['Tomorrow', 'Today', 'Morning'], 1, '今日（きょう） means today. 今日 is read きょう in this lesson.'),
    Exercise('What does 明日（あした） mean?', ['Yesterday', 'Afternoon / p.m.', 'Tomorrow'], 2, '明日（あした） means tomorrow. あした is a common everyday reading of 明日.'),
    Exercise('What does 昨日（きのう） mean?', ['Yesterday', 'Morning', 'Night'], 0, '昨日（きのう） means yesterday. 昨日 is read きのう in everyday conversation.'),
    Exercise('What does 朝（あさ） mean?', ['Afternoon / p.m.', 'Morning', 'Today'], 1, '朝（あさ） means morning. 朝 names the morning.'),
    Exercise('What does 午後（ごご） mean?', ['Night', 'Tomorrow', 'Afternoon / p.m.'], 2, '午後（ごご） means afternoon / p.m.. 午後 means after noon; it also marks p.m. in clock times.'),
    Exercise('What does 夜（よる） mean?', ['Night', 'Today', 'Yesterday'], 0, '夜（よる） means night. 夜 is read よる when naming the night here.'),
    Exercise('Choose the Japanese for “Today”.', ['明日（あした）', '朝（あさ）', '今日（きょう）'], 2, '今日（きょう） means today. 今日 is read きょう in this lesson.'),
    Exercise('Choose the Japanese for “Tomorrow”.', ['明日（あした）', '昨日（きのう）', '午後（ごご）'], 0, '明日（あした） means tomorrow. あした is a common everyday reading of 明日.'),
    Exercise('Choose the Japanese for “Yesterday”.', ['朝（あさ）', '昨日（きのう）', '夜（よる）'], 1, '昨日（きのう） means yesterday. 昨日 is read きのう in everyday conversation.'),
    Exercise('Choose the Japanese for “Morning”.', ['午後（ごご）', '今日（きょう）', '朝（あさ）'], 2, '朝（あさ） means morning. 朝 names the morning.'),
    Exercise('Choose the Japanese for “Afternoon / p.m.”.', ['午後（ごご）', '夜（よる）', '明日（あした）'], 0, '午後（ごご） means afternoon / p.m.. 午後 means after noon; it also marks p.m. in clock times.'),
    Exercise('Choose the Japanese for “Night”.', ['今日（きょう）', '夜（よる）', '昨日（きのう）'], 1, '夜（よる） means night. 夜 is read よる when naming the night here.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyTransport = Lesson(
  'vocabulary-transport-v1',
  'Vocabulary: transport',
  '電車（でんしゃ） — Train\nバス — Bus\nタクシー — Taxi\n自転車（じてんしゃ） — Bicycle\n車（くるま） — Car\n飛行機（ひこうき） — Airplane\n\nLearn six ways to travel. Pay attention to the long-vowel mark ー in タクシー and the small ゃ in 電車 and 自転車.',
  [
    Exercise('What does 電車（でんしゃ） mean?', ['Bus', 'Train', 'Bicycle'], 1, '電車（でんしゃ） means train. 電車 means an electric train.'),
    Exercise('What does バス mean?', ['Taxi', 'Car', 'Bus'], 2, 'バス means bus. バス is written in katakana.'),
    Exercise('What does タクシー mean?', ['Taxi', 'Bicycle', 'Airplane'], 0, 'タクシー means taxi. The ー in タクシー lengthens the final vowel.'),
    Exercise('What does 自転車（じてんしゃ） mean?', ['Car', 'Bicycle', 'Train'], 1, '自転車（じてんしゃ） means bicycle. 自転車 has small ゃ in しゃ.'),
    Exercise('What does 車（くるま） mean?', ['Airplane', 'Bus', 'Car'], 2, '車（くるま） means car. 車 is read くるま when it means a car here.'),
    Exercise('What does 飛行機（ひこうき） mean?', ['Airplane', 'Train', 'Taxi'], 0, '飛行機（ひこうき） means airplane. 飛行機 is read ひこうき; keep the long vowel in こう.'),
    Exercise('Choose the Japanese for “Train”.', ['バス', '自転車（じてんしゃ）', '電車（でんしゃ）'], 2, '電車（でんしゃ） means train. 電車 means an electric train.'),
    Exercise('Choose the Japanese for “Bus”.', ['バス', 'タクシー', '車（くるま）'], 0, 'バス means bus. バス is written in katakana.'),
    Exercise('Choose the Japanese for “Taxi”.', ['自転車（じてんしゃ）', 'タクシー', '飛行機（ひこうき）'], 1, 'タクシー means taxi. The ー in タクシー lengthens the final vowel.'),
    Exercise('Choose the Japanese for “Bicycle”.', ['車（くるま）', '電車（でんしゃ）', '自転車（じてんしゃ）'], 2, '自転車（じてんしゃ） means bicycle. 自転車 has small ゃ in しゃ.'),
    Exercise('Choose the Japanese for “Car”.', ['車（くるま）', '飛行機（ひこうき）', 'バス'], 0, '車（くるま） means car. 車 is read くるま when it means a car here.'),
    Exercise('Choose the Japanese for “Airplane”.', ['電車（でんしゃ）', '飛行機（ひこうき）', 'タクシー'], 1, '飛行機（ひこうき） means airplane. 飛行機 is read ひこうき; keep the long vowel in こう.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyColours = Lesson(
  'vocabulary-colours-v1',
  'Vocabulary: colours',
  '赤（あか） — Red\n青（あお） — Blue\n白（しろ） — White\n黒（くろ） — Black\n黄色（きいろ） — Yellow\n緑（みどり） — Green\n\nThese are colour names used as nouns. Red is 赤（あか） here; the adjective 赤い（あかい） is a different form. This lesson practises the names only.',
  [
    Exercise('What does 赤（あか） mean?', ['Blue', 'Red', 'Black'], 1, '赤（あか） means red. 赤 is the noun naming the colour red.'),
    Exercise('What does 青（あお） mean?', ['White', 'Yellow', 'Blue'], 2, '青（あお） means blue. 青 means blue here; some fixed expressions also use 青 for things described as green in English.'),
    Exercise('What does 白（しろ） mean?', ['White', 'Black', 'Green'], 0, '白（しろ） means white. 白 is the noun naming the colour white.'),
    Exercise('What does 黒（くろ） mean?', ['Yellow', 'Black', 'Red'], 1, '黒（くろ） means black. 黒 is the noun naming the colour black.'),
    Exercise('What does 黄色（きいろ） mean?', ['Green', 'Blue', 'Yellow'], 2, '黄色（きいろ） means yellow. 黄色 is read きいろ, with two consecutive い sounds.'),
    Exercise('What does 緑（みどり） mean?', ['Green', 'Red', 'White'], 0, '緑（みどり） means green. 緑 names the colour green.'),
    Exercise('Choose the Japanese for “Red”.', ['青（あお）', '黒（くろ）', '赤（あか）'], 2, '赤（あか） means red. 赤 is the noun naming the colour red.'),
    Exercise('Choose the Japanese for “Blue”.', ['青（あお）', '白（しろ）', '黄色（きいろ）'], 0, '青（あお） means blue. 青 means blue here; some fixed expressions also use 青 for things described as green in English.'),
    Exercise('Choose the Japanese for “White”.', ['黒（くろ）', '白（しろ）', '緑（みどり）'], 1, '白（しろ） means white. 白 is the noun naming the colour white.'),
    Exercise('Choose the Japanese for “Black”.', ['黄色（きいろ）', '赤（あか）', '黒（くろ）'], 2, '黒（くろ） means black. 黒 is the noun naming the colour black.'),
    Exercise('Choose the Japanese for “Yellow”.', ['黄色（きいろ）', '緑（みどり）', '青（あお）'], 0, '黄色（きいろ） means yellow. 黄色 is read きいろ, with two consecutive い sounds.'),
    Exercise('Choose the Japanese for “Green”.', ['赤（あか）', '緑（みどり）', '白（しろ）'], 1, '緑（みどり） means green. 緑 names the colour green.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyActions = Lesson(
  'vocabulary-actions-v1',
  'Vocabulary: everyday actions',
  '食べる（たべる） — To eat\n飲む（のむ） — To drink\n行く（いく） — To go\n来る（くる） — To come\n見る（みる） — To see / watch\n読む（よむ） — To read\n\nThese verbs are shown in dictionary form, the form used as a dictionary heading. English labels use “to”: 食べる means “to eat”. Polite forms such as 食べます are not practised here; this lesson does not teach conjugation.',
  [
    Exercise('What does 食べる（たべる） mean?', ['To drink', 'To eat', 'To come'], 1, '食べる（たべる） means to eat. 食べる is the dictionary form meaning to eat.'),
    Exercise('What does 飲む（のむ） mean?', ['To go', 'To see / watch', 'To drink'], 2, '飲む（のむ） means to drink. 飲む means to drink in this lesson.'),
    Exercise('What does 行く（いく） mean?', ['To go', 'To come', 'To read'], 0, '行く（いく） means to go. 行く is read いく here and means to go.'),
    Exercise('What does 来る（くる） mean?', ['To see / watch', 'To come', 'To eat'], 1, '来る（くる） means to come. 来る is read くる in dictionary form.'),
    Exercise('What does 見る（みる） mean?', ['To read', 'To drink', 'To see / watch'], 2, '見る（みる） means to see / watch. 見る can mean to see or to watch, depending on context.'),
    Exercise('What does 読む（よむ） mean?', ['To read', 'To eat', 'To go'], 0, '読む（よむ） means to read. 読む is the dictionary form meaning to read.'),
    Exercise('Choose the Japanese for “To eat”.', ['飲む（のむ）', '来る（くる）', '食べる（たべる）'], 2, '食べる（たべる） means to eat. 食べる is the dictionary form meaning to eat.'),
    Exercise('Choose the Japanese for “To drink”.', ['飲む（のむ）', '行く（いく）', '見る（みる）'], 0, '飲む（のむ） means to drink. 飲む means to drink in this lesson.'),
    Exercise('Choose the Japanese for “To go”.', ['来る（くる）', '行く（いく）', '読む（よむ）'], 1, '行く（いく） means to go. 行く is read いく here and means to go.'),
    Exercise('Choose the Japanese for “To come”.', ['見る（みる）', '食べる（たべる）', '来る（くる）'], 2, '来る（くる） means to come. 来る is read くる in dictionary form.'),
    Exercise('Choose the Japanese for “To see / watch”.', ['見る（みる）', '読む（よむ）', '飲む（のむ）'], 0, '見る（みる） means to see / watch. 見る can mean to see or to watch, depending on context.'),
    Exercise('Choose the Japanese for “To read”.', ['食べる（たべる）', '読む（よむ）', '行く（いく）'], 1, '読む（よむ） means to read. 読む is the dictionary form meaning to read.'),
  ],
  section: 'Vocabulary basics',
);

const vocabularyLessons = [
  vocabularyPeople,
  vocabularyFood,
  vocabularyPlaces,
  vocabularyObjects,
  vocabularyTime,
  vocabularyTransport,
  vocabularyColours,
  vocabularyActions,
];
