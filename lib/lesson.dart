class Exercise {
  final String prompt;
  final List<String> choices;
  final int answer;
  final String explanation;
  const Exercise(this.prompt, this.choices, this.answer, this.explanation);
}

class Lesson {
  final String id;
  final String title;
  final String introduction;
  final List<Exercise> exercises;
  const Lesson(this.id, this.title, this.introduction, this.exercises);
}

const greetings = Lesson(
  'greetings-v1',
  'Your first greetings',
  'こんにちは means hello during the day. ありがとう means thank you in a casual setting. '
  'Use ありがとうございます for a polite thank-you. おはようございます is a polite morning greeting.',
  [
    Exercise('こんにちは', ['Hello', 'Thank you', 'Good morning'], 0,
        'こんにちは is a daytime greeting. Its final は is pronounced wa.'),
    Exercise('Choose the polite way to say “Thank you”.',
        ['こんにちは', 'ありがとうございます', 'おはようございます'], 1,
        'ありがとうございます is polite. ありがとう is the casual form.'),
    Exercise('おはようございます',
        ['Good evening', 'Thank you', 'Good morning'], 2,
        'おはようございます is a polite greeting used in the morning.'),
    Exercise('Choose the casual way to say “Thank you”.',
        ['ありがとう', 'こんにちは', 'おはようございます'], 0,
        'ありがとう is a casual thank-you. Use the polite form with people you do not know well.'),
  ],
);


const hiraganaVowels = Lesson(
  'hiragana-vowels-v1',
  'Hiragana: the five vowels',
  'Hiragana is a Japanese writing system. Start with these five characters:\n\n'
  'あ → a\nい → i\nう → u\nえ → e\nお → o\n\n'
  'The Latin letters are romaji: a way to represent Japanese sounds. '
  'These characters represent sounds, not English words. '
  'Learn each shape, then practise matching hiragana and romaji in both directions.',
  [
    Exercise('Which romaji matches あ?', ['i', 'a', 'o'], 1, 'あ represents a.'),
    Exercise('Which romaji matches い?', ['i', 'e', 'u'], 0, 'い represents i.'),
    Exercise('Which romaji matches う?', ['o', 'a', 'u'], 2, 'う represents u.'),
    Exercise('Which romaji matches え?', ['a', 'e', 'i'], 1, 'え represents e.'),
    Exercise('Which romaji matches お?', ['o', 'u', 'e'], 0, 'お represents o.'),
    Exercise('Choose the hiragana for a.', ['お', 'う', 'あ'], 2, 'a is written あ.'),
    Exercise('Choose the hiragana for i.', ['え', 'い', 'あ'], 1, 'i is written い.'),
    Exercise('Choose the hiragana for u.', ['う', 'お', 'い'], 0, 'u is written う.'),
    Exercise('Choose the hiragana for e.', ['い', 'あ', 'え'], 2, 'e is written え.'),
    Exercise('Choose the hiragana for o.', ['う', 'お', 'え'], 1, 'o is written お.'),
  ],
);

const lessons = [greetings, hiraganaVowels];

class LessonSession {
  final Lesson lesson;
  int index = 0;
  int correct = 0;
  bool answered = false;
  bool? lastCorrect;
  LessonSession(this.lesson);
  bool get finished => index >= lesson.exercises.length;
  Exercise get current => lesson.exercises[index];

  void submit(int choice) {
    if (finished || answered) return;
    if (choice < 0 || choice >= current.choices.length) {
      throw RangeError.index(choice, current.choices);
    }
    lastCorrect = choice == current.answer;
    if (lastCorrect!) correct++;
    answered = true;
  }

  void next() {
    if (!answered || finished) return;
    index++;
    answered = false;
    lastCorrect = null;
  }
}
