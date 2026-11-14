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

const grammarLessons = [
  grammarStatements,
  grammarNegatives,
  grammarPossession,
  grammarDemonstratives,
  grammarQuestions,
];
