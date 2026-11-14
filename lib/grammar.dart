part of 'lesson.dart';

// Original beginner noun-pattern lessons. Kana keeps the focus on grammar.

const grammarStatements = Lesson(
  'grammar-statements-v1',
  'Grammar: statements with は and です',
  'Build a polite statement: topic + は + noun + です。\nは marks what you are talking about and is pronounced wa here; write は, not わ. です ends this polite noun statement. It does not mean “is” in every Japanese construction.\n\nわたし = I / me\nがくせい = student\nともだち = friend\nせんせい = teacher\n\nわたしはがくせいです。 = I am a student.\nともだちはせんせいです。 = My friend is a teacher (in this context).\n\nJapanese has no direct equivalent of English a/an here. Kana spelling keeps the focus on grammar. Topics can be omitted when understood, but we include them for practice.',
  [
    Exercise('Choose “I am a student.”', ['わたしはともだちです。', 'わたしはがくせいです。', 'ともだちはせんせいです。'], 1, 'Put わたし first, mark it with は, then add がくせいです.'),
    Exercise('What does わたしはがくせいです。 mean?', ['My friend is a student.', 'I am a teacher.', 'I am a student.'], 2, 'わたし is I; がくせい is student.'),
    Exercise('Fill the topic marker: わたし ___ がくせいです。', ['は', 'わ', 'の'], 0, 'The topic particle is written は even though it is pronounced wa.'),
    Exercise('Complete the polite statement: わたしはがくせい ___ 。', ['の', 'です', 'は'], 1, 'です follows the noun in this polite statement.'),
    Exercise('How is は pronounced in わたしはがくせいです。?', ['ha', 'wo', 'wa'], 2, 'As a topic particle, は is pronounced wa.'),
    Exercise('Your friend is a teacher. Choose the matching statement.', ['ともだちはせんせいです。', 'ともだちはがくせいです。', 'わたしはがくせいです。'], 0, 'ともだち names the friend; せんせい identifies their role.'),
    Exercise('In ともだちはせんせいです。, which word names the topic?', ['せんせい', 'ともだち', 'です'], 1, 'The topic comes before は: ともだち.'),
    Exercise('Which order matches the pattern taught here?', ['です + topic + は + noun', 'Topic + noun + の + は', 'Topic + は + noun + です'], 2, 'Introduce the topic, add は, then the noun and です.'),
  ],
  section: 'Grammar basics',
);

const grammarNegatives = Lesson(
  'grammar-negatives-v1',
  'Grammar: saying “is not”',
  'For a negative noun statement, replace です with じゃないです。\n\nわたしはがくせいです。 = I am a student.\nわたしはがくせいじゃないです。 = I am not a student.\nともだちはせんせいじゃないです。 = My friend is not a teacher (in this context).\n\nじゃないです is common in polite conversation. ではありません is another polite negative form; this lesson practises じゃないです. These are noun statements, not a general rule for making verbs or all adjectives negative.',
  [
    Exercise('Choose “I am not a student.”', ['わたしはがくせいです。', 'わたしはがくせいじゃないです。', 'ともだちはがくせいです。'], 1, 'Replace です after がくせい with じゃないです.'),
    Exercise('What does わたしはがくせいじゃないです。 mean?', ['I am a student.', 'My friend is a teacher.', 'I am not a student.'], 2, 'じゃないです makes this noun statement negative.'),
    Exercise('Fill the negative ending: ともだちはせんせい ___ 。', ['じゃないです', 'です', 'の'], 0, 'Use じゃないです to say the friend is not a teacher.'),
    Exercise('Which sentence says your friend IS a teacher?', ['ともだちはせんせいじゃないです。', 'ともだちはせんせいです。', 'わたしはがくせいじゃないです。'], 1, 'です is affirmative here; じゃないです is negative.'),
    Exercise('Change わたしはがくせいです。 to a negative statement.', ['わたしはともだちじゃないです。', 'ともだちはがくせいじゃないです。', 'わたしはがくせいじゃないです。'], 2, 'Keep the topic and noun; change only the ending.'),
    Exercise('Choose “My friend is not a student.”', ['ともだちはがくせいじゃないです。', 'ともだちはがくせいです。', 'わたしはがくせいじゃないです。'], 0, 'ともだち is the topic, がくせい is the noun, and じゃないです negates it.'),
    Exercise('Does わたしはがくせいじゃないです。 tell you the speaker is a teacher?', ['Yes; it says they are a teacher.', 'No; it only says they are not a student.', 'Yes; it says they are a friend.'], 1, 'Saying someone is not a student does not identify their occupation.'),
    Exercise('Which ending is also a polite negative for a noun?', ['です', 'は', 'ではありません'], 2, 'ではありません is another polite negative; it is not an incorrect alternative to じゃないです.'),
  ],
  section: 'Grammar basics',
);

const grammarPossession = Lesson(
  'grammar-possession-v1',
  'Grammar: possession with の',
  'Use owner + の + thing to show possession.\n\nわたしのほん = my book\nせんせいのかばん = the teacher’s bag\nともだちのかさ = my friend’s umbrella\n\nほん = book; かばん = bag; かさ = umbrella; かぎ = key.\nの connects the owner to the thing; the thing comes last. These examples are noun phrases, not complete sentences ending in です. の has other uses too; here we practise ownership.',
  [
    Exercise('Choose “my book”.', ['せんせいのほん', 'わたしのほん', 'わたしのかばん'], 1, 'わたし + の + ほん means my book.'),
    Exercise('What does せんせいのかばん mean?', ['The teacher’s book', 'My bag', 'The teacher’s bag'], 2, 'せんせい is the owner and かばん is the thing owned.'),
    Exercise('Fill the ownership particle: わたし ___ かぎ', ['の', 'は', 'か'], 0, 'の links わたし to かぎ: my key.'),
    Exercise('Choose “my friend’s umbrella”.', ['ともだちのほん', 'ともだちのかさ', 'わたしのかさ'], 1, 'Put ともだち before の and かさ after it.'),
    Exercise('In せんせいのほん, who is the owner?', ['The friend', 'The speaker', 'The teacher'], 2, 'The owner appears before の: せんせい.'),
    Exercise('Choose “my bag”.', ['わたしのかばん', 'わたしのかさ', 'せんせいのかばん'], 0, 'かばん is bag; わたしの marks it as mine.'),
    Exercise('What does ともだちのかぎ mean?', ['My key', 'My friend’s key', 'My friend’s umbrella'], 1, 'ともだちの identifies the owner and かぎ means key.'),
    Exercise('Which order shows ownership in these examples?', ['Thing + は + owner', 'Owner + か + thing', 'Owner + の + thing'], 2, 'The owner modifies the following noun using の.'),
  ],
  section: 'Grammar basics',
);

const grammarDemonstratives = Lesson(
  'grammar-demonstratives-v1',
  'Grammar: this and that',
  'When pointing to objects:\nこれ = this, near the speaker\nそれ = that, near the listener\nあれ = that over there, far from both\n\nこれはほんです。 = This is a book.\nそれはかばんです。 = That is a bag (near the listener).\nあれはかさです。 = That over there is an umbrella.\nこれはわたしのほんです。 = This is my book.\n\nほん = book; かばん = bag; かさ = umbrella.\nThese words stand for the thing itself. They are different from この／その／あの, which must go before a noun. The position clues refer to the person speaking.',
  [
    Exercise('You are holding a book. Choose “This is a book.”', ['それはほんです。', 'これはほんです。', 'あれはほんです。'], 1, 'The book is near you, the speaker, so use これ.'),
    Exercise('A bag is next to the listener. Choose the matching sentence.', ['これはかばんです。', 'あれはかばんです。', 'それはかばんです。'], 2, 'それ points to the object near the listener.'),
    Exercise('An umbrella is far from both of you. Choose the matching sentence.', ['あれはかさです。', 'これはかさです。', 'それはかさです。'], 0, 'あれ points to an object far from both speaker and listener.'),
    Exercise('What does これはわたしのほんです。 mean?', ['That over there is my book.', 'This is my book.', 'This is my bag.'], 1, 'これ means this; わたしのほん means my book.'),
    Exercise('Fill the pointer for a bag beside you, the speaker: ___ はかばんです。', ['それ', 'あれ', 'これ'], 2, 'Use これ for an object near the speaker.'),
    Exercise('Which pointer refers to an object near the listener?', ['それ', 'これ', 'あれ'], 0, 'In the pointing situation taught here, それ is near the listener.'),
    Exercise('Which pointer refers to an object far from both people?', ['これ', 'あれ', 'それ'], 1, 'あれ is used for that object over there.'),
    Exercise('You hold your own umbrella. Choose “This is my umbrella.”', ['これはせんせいのかさです。', 'あれはわたしのかさです。', 'これはわたしのかさです。'], 2, 'これ selects the nearby object; わたしの marks you as its owner.'),
  ],
  section: 'Grammar basics',
);

const grammarQuestions = Lesson(
  'grammar-questions-v1',
  'Grammar: polite questions with か',
  'In these polite noun questions, add か after です. You do not need English-style word order changes.\n\nこれはほんです。 = This is a book.\nこれはほんですか。 = Is this a book?\nこれはわたしのかぎですか。 = Is this my key?\n\nはい = yes; いいえ = no.\nはい、ほんです。 = Yes, it is a book.\nいいえ、ほんじゃないです。 = No, it is not a book.\n\nほん = book; かばん = bag; かぎ = key; かさ = umbrella.\nAn understood topic can be left out of the answer. The sentence-ending か makes these examples questions. Other styles of questions exist; not every Japanese question needs か.',
  [
    Exercise('Choose “Is this a book?”', ['これはほんです。', 'これはほんですか。', 'これはほんじゃないです。'], 1, 'Add か after です to ask a polite question.'),
    Exercise('What does これはほんですか。 mean?', ['This is a book.', 'This is not a book.', 'Is this a book?'], 2, 'The final か turns the statement into a question.'),
    Exercise('Fill the question ending: これはかばんです ___ 。', ['か', 'の', 'は'], 0, 'か comes at the end of this polite question.'),
    Exercise('Someone asks ほんですか。 It is a book. Choose the reply.', ['いいえ、ほんじゃないです。', 'はい、ほんです。', 'はい、かばんです。'], 1, 'はい confirms the question; ほんです gives the affirmative answer.'),
    Exercise('Someone asks ほんですか。 It is not a book. Choose the reply.', ['はい、ほんです。', 'はい、ほんじゃないです。', 'いいえ、ほんじゃないです。'], 2, 'いいえ rejects the affirmative question; じゃないです gives the negative answer.'),
    Exercise('Choose “Is this my key?”', ['これはわたしのかぎですか。', 'これはわたしのかぎです。', 'これはせんせいのかぎですか。'], 0, 'Combine これ, わたしのかぎ, and the question ending ですか.'),
    Exercise('Which sentence asks about an umbrella rather than stating a fact?', ['これはかさです。', 'これはかさですか。', 'これはかさじゃないです。'], 1, 'Only the sentence with final か asks a question here.'),
    Exercise('Turn これはわたしのほんです。 into a polite question.', ['これはわたしのかばんですか。', 'あれはわたしのほんですか。', 'これはわたしのほんですか。'], 2, 'Keep the words and their order; add か after です.'),
  ],
  section: 'Grammar basics',
);

const grammarPoliteVerbs = Lesson(
  'grammar-polite-verbs-v1',
  'Grammar: polite actions with ます',
  'The word bank shows dictionary forms. Here are six polite non-past forms:\n\nたべる → たべます (eat)\nのむ → のみます (drink)\nよむ → よみます (read)\nみる → みます (see / watch)\nいく → いきます (go)\nくる → きます (come)\n\nLearn these pairs; simply adding ます to a dictionary form does not work. In particular, くる changes to きます. Full verb-group rules come later.\n\nTo make these polite forms negative, replace ます with ません: よみます → よみません.\nNon-past forms can describe habits or future actions, depending on context. あした means tomorrow: あしたいきます。 = I will go tomorrow (when the speaker is the understood subject).\nDo not add です after these ます forms. They already form a polite predicate.',
  [
    Exercise('Choose the polite non-past form of たべる (eat).', ['のみます', 'たべます', 'よみます'], 1, 'たべる becomes たべます; the other choices mean drink and read.'),
    Exercise('Choose the polite non-past form of のむ (drink).', ['みます', 'たべます', 'のみます'], 2, 'のむ becomes のみます. It is not formed by adding ます after のむ.'),
    Exercise('Choose the polite non-past form of よむ (read).', ['よみます', 'きます', 'のみます'], 0, 'よむ becomes よみます.'),
    Exercise('Choose the polite non-past form of みる (see / watch).', ['よみます', 'みます', 'いきます'], 1, 'みる becomes みます.'),
    Exercise('Choose the polite non-past form of いく (go).', ['きます', 'みます', 'いきます'], 2, 'いく becomes いきます; きます means come.'),
    Exercise('Choose the polite non-past form of くる (come).', ['きます', 'いきます', 'くるます'], 0, 'くる has the irregular polite form きます.'),
    Exercise('Make よみます negative using the form taught here.', ['よむません', 'よみません', 'よみますです'], 1, 'Replace the ending ます with ません: よみません.'),
    Exercise('The speaker is describing their own plan. What does あしたいきます。 mean?', ['I will not go tomorrow.', 'I went yesterday.', 'I will go tomorrow.'], 2, 'あした sets a future context; いきます is affirmative non-past.'),
  ],
  section: 'Grammar basics',
);

const grammarObjects = Lesson(
  'grammar-objects-v1',
  'Grammar: objects with を',
  'Use object + を + action to say what someone eats, drinks or reads. The particle を is pronounced o in ordinary modern speech, but write を, not お.\n\nパンをたべます。 = I eat bread.\nみずをのみます。 = I drink water.\nほんをよみます。 = I read a book.\n\nパン = bread; みず = water; ほん = book; さかな = fish; おちゃ = tea.\nThese translations assume the speaker is the understood subject. The Japanese sentences can refer to another person when context supplies that person.\n\nパンをたべません。 = I do not eat bread.\nほんをよみますか。 = Do you read books?\nAdd か after the polite verb to ask a question. The noun does not itself mark singular/plural. This lesson teaches direct objects; not every verb uses を.',
  [
    Exercise('The speaker means “I eat bread.” Choose the matching sentence.', ['みずをのみます。', 'パンをたべます。', 'ほんをよみます。'], 1, 'パン is bread and たべます is eat; を marks the object.'),
    Exercise('Choose the direct-object particle: ほん ___ よみます。', ['で', 'に', 'を'], 2, 'を marks ほん as what is read.'),
    Exercise('How is を normally pronounced as an object particle?', ['o', 'wo with a distinct w', 'wa'], 0, 'The object particle を is ordinarily pronounced o.'),
    Exercise('The speaker means “I drink water.” Choose the matching sentence.', ['おちゃをのみます。', 'みずをのみます。', 'さかなをたべます。'], 1, 'みず is water; のみます is drink.'),
    Exercise('Change パンをたべます。 to a polite negative.', ['パンをたべますか。', 'さかなをたべません。', 'パンをたべません。'], 2, 'Keep パンを and replace たべます with たべません.'),
    Exercise('Ask “Do you read books?” with the listener understood as the subject.', ['ほんをよみますか。', 'ほんをよみます。', 'ほんをよみません。'], 0, 'Put か after よみます to ask the affirmative question.'),
    Exercise('In さかなをたべます。, what is being eaten?', ['Bread', 'Fish', 'A book'], 1, 'さかな, immediately before を, is the object: fish.'),
    Exercise('The speaker is talking about their habits. What does おちゃをのみません。 mean?', ['I drink tea.', 'I do not drink water.', 'I do not drink tea.'], 2, 'おちゃ is tea; のみません is the polite negative of drink.'),
  ],
  section: 'Grammar basics',
);

const grammarActionPlaces = Lesson(
  'grammar-action-places-v1',
  'Grammar: where actions happen with で',
  'Place + で marks where an action happens in these examples. Then use object + を + verb.\n\nこうえんでパンをたべます。 = I eat bread in the park.\nとしょかんでほんをよみます。 = I read a book at the library.\nがっこうでみずをのみます。 = I drink water at school.\n\nこうえん = park; としょかん = library; がっこう = school.\nパン = bread; ほん = book; みず = water; おちゃ = tea.\nTranslations assume the speaker is the subject. で marks the action location; を marks the object. The verb comes at the end of this pattern.\n\nとしょかんでほんをよみません。 = I do not read books at the library.\nがっこうでみずをのみますか。 = Do you drink water at school?\nThis use of で is not a general translation of “at”: destinations and existence sentences use other patterns, and で has other uses too.',
  [
    Exercise('Choose the action-location particle: としょかん ___ ほんをよみます。', ['を', 'で', 'の'], 1, 'で marks the library as the place where reading happens.'),
    Exercise('Choose “I eat bread in the park.”', ['がっこうでパンをたべます。', 'こうえんでおちゃをのみます。', 'こうえんでパンをたべます。'], 2, 'こうえんで locates the action in the park; パンをたべます means eat bread.'),
    Exercise('In としょかんでほんをよみます。, where does reading happen?', ['At the library', 'At school', 'In the park'], 0, 'としょかん before で gives the action location.'),
    Exercise('In がっこうでみずをのみます。, what is being drunk?', ['Tea', 'Water', 'Bread'], 1, 'みず before を is the object; がっこうで gives the location.'),
    Exercise('Choose “I do not read books at the library.”', ['としょかんでほんをよみます。', 'こうえんでほんをよみません。', 'としょかんでほんをよみません。'], 2, 'Keep the library and book; use よみません for the negative.'),
    Exercise('Ask whether the listener drinks water at school.', ['がっこうでみずをのみますか。', 'がっこうでみずをのみます。', 'こうえんでみずをのみますか。'], 0, 'がっこうで means at school; final か makes this a question.'),
    Exercise('Which pair marks the action place, then the direct object?', ['を, then で', 'で, then を', 'の, then か'], 1, 'Use place + で and object + を in the pattern taught here.'),
    Exercise('Change only the location in こうえんでパンをたべます。 to school.', ['こうえんでほんをよみます。', 'がっこうでみずをのみます。', 'がっこうでパンをたべます。'], 2, 'Replace こうえん with がっこう; keep eating bread unchanged.'),
  ],
  section: 'Grammar basics',
);

const grammarLessons = [
  grammarStatements,
  grammarNegatives,
  grammarPossession,
  grammarDemonstratives,
  grammarQuestions,
  grammarPoliteVerbs,
  grammarObjects,
  grammarActionPlaces,
];
