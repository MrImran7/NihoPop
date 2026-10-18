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

const hiraganaK = Lesson(
  'hiragana-k-v1',
  'Hiragana: ka to ko',
  'か → ka\nき → ki\nく → ku\nけ → ke\nこ → ko\n\nAdd k before each vowel sound: ka, ki, ku, ke, ko. Learn these five shapes before practising.',
  [
    Exercise('Which romaji matches か?', ['ka', 'ki', 'ke'], 0, 'か represents ka.'),
    Exercise('Which romaji matches き?', ['ku', 'ki', 'ko'], 1, 'き represents ki.'),
    Exercise('Which romaji matches く?', ['ke', 'ka', 'ku'], 2, 'く represents ku.'),
    Exercise('Which romaji matches け?', ['ke', 'ko', 'ki'], 0, 'け represents ke.'),
    Exercise('Which romaji matches こ?', ['ka', 'ko', 'ku'], 1, 'こ represents ko.'),
    Exercise('Choose the hiragana for ka.', ['か', 'き', 'け'], 0, 'か represents ka.'),
    Exercise('Choose the hiragana for ki.', ['く', 'き', 'こ'], 1, 'き represents ki.'),
    Exercise('Choose the hiragana for ku.', ['け', 'か', 'く'], 2, 'く represents ku.'),
    Exercise('Choose the hiragana for ke.', ['け', 'こ', 'き'], 0, 'け represents ke.'),
    Exercise('Choose the hiragana for ko.', ['か', 'こ', 'く'], 1, 'こ represents ko.'),
  ],
);

const hiraganaS = Lesson(
  'hiragana-s-v1',
  'Hiragana: sa to so',
  'さ → sa\nし → shi\nす → su\nせ → se\nそ → so\n\nNotice し: this lesson uses shi, not si, in romaji. The row is sa, shi, su, se, so.',
  [
    Exercise('Which romaji matches さ?', ['sa', 'shi', 'se'], 0, 'さ represents sa.'),
    Exercise('Which romaji matches し?', ['su', 'shi', 'so'], 1, 'し represents shi.'),
    Exercise('Which romaji matches す?', ['se', 'sa', 'su'], 2, 'す represents su.'),
    Exercise('Which romaji matches せ?', ['se', 'so', 'shi'], 0, 'せ represents se.'),
    Exercise('Which romaji matches そ?', ['sa', 'so', 'su'], 1, 'そ represents so.'),
    Exercise('Choose the hiragana for sa.', ['さ', 'し', 'せ'], 0, 'さ represents sa.'),
    Exercise('Choose the hiragana for shi.', ['す', 'し', 'そ'], 1, 'し represents shi.'),
    Exercise('Choose the hiragana for su.', ['せ', 'さ', 'す'], 2, 'す represents su.'),
    Exercise('Choose the hiragana for se.', ['せ', 'そ', 'し'], 0, 'せ represents se.'),
    Exercise('Choose the hiragana for so.', ['さ', 'そ', 'す'], 1, 'そ represents so.'),
  ],
);

const hiraganaT = Lesson(
  'hiragana-t-v1',
  'Hiragana: ta to to',
  'た → ta\nち → chi\nつ → tsu\nて → te\nと → to\n\nThis row is ta, chi, tsu, te, to. We use chi for ち and tsu for つ in this course. Learn these two spellings along with the shapes.',
  [
    Exercise('Which romaji matches た?', ['chi', 'ta', 'te'], 1, 'た represents ta in this exercise.'),
    Exercise('Which romaji matches ち?', ['tsu', 'to', 'chi'], 2, 'ち represents chi in this exercise.'),
    Exercise('Which romaji matches つ?', ['tsu', 'te', 'ta'], 0, 'つ represents tsu in this exercise.'),
    Exercise('Which romaji matches て?', ['to', 'te', 'chi'], 1, 'て represents te in this exercise.'),
    Exercise('Which romaji matches と?', ['ta', 'tsu', 'to'], 2, 'と represents to in this exercise.'),
    Exercise('Choose the hiragana for ta.', ['ち', 'て', 'た'], 2, 'た represents ta in this exercise.'),
    Exercise('Choose the hiragana for chi.', ['ち', 'つ', 'と'], 0, 'ち represents chi in this exercise.'),
    Exercise('Choose the hiragana for tsu.', ['て', 'つ', 'た'], 1, 'つ represents tsu in this exercise.'),
    Exercise('Choose the hiragana for te.', ['と', 'ち', 'て'], 2, 'て represents te in this exercise.'),
    Exercise('Choose the hiragana for to.', ['と', 'た', 'つ'], 0, 'と represents to in this exercise.'),
  ],
);

const hiraganaN = Lesson(
  'hiragana-n-v1',
  'Hiragana: na to no',
  'な → na\nに → ni\nぬ → nu\nね → ne\nの → no\n\nAdd n before each vowel sound: na, ni, nu, ne, no. Compare ぬ and ね carefully: they are different characters.',
  [
    Exercise('Which romaji matches な?', ['ni', 'na', 'ne'], 1, 'な represents na in this exercise.'),
    Exercise('Which romaji matches に?', ['nu', 'no', 'ni'], 2, 'に represents ni in this exercise.'),
    Exercise('Which romaji matches ぬ?', ['nu', 'ne', 'na'], 0, 'ぬ represents nu in this exercise.'),
    Exercise('Which romaji matches ね?', ['no', 'ne', 'ni'], 1, 'ね represents ne in this exercise.'),
    Exercise('Which romaji matches の?', ['na', 'nu', 'no'], 2, 'の represents no in this exercise.'),
    Exercise('Choose the hiragana for na.', ['に', 'ね', 'な'], 2, 'な represents na in this exercise.'),
    Exercise('Choose the hiragana for ni.', ['に', 'ぬ', 'の'], 0, 'に represents ni in this exercise.'),
    Exercise('Choose the hiragana for nu.', ['ね', 'ぬ', 'な'], 1, 'ぬ represents nu in this exercise.'),
    Exercise('Choose the hiragana for ne.', ['の', 'に', 'ね'], 2, 'ね represents ne in this exercise.'),
    Exercise('Choose the hiragana for no.', ['の', 'な', 'ぬ'], 0, 'の represents no in this exercise.'),
  ],
);

const hiraganaH = Lesson(
  'hiragana-h-v1',
  'Hiragana: ha to ho',
  'は → ha\nひ → hi\nふ → fu\nへ → he\nほ → ho\n\nThis row is ha, hi, fu, he, ho. We use fu for ふ. Here we practise the basic readings ha and he. When は and へ are used as grammatical particles, they are pronounced wa and e.',
  [
    Exercise('Which romaji matches は?', ['hi', 'ha', 'he'], 1, 'は represents ha in this exercise.'),
    Exercise('Which romaji matches ひ?', ['fu', 'ho', 'hi'], 2, 'ひ represents hi in this exercise.'),
    Exercise('Which romaji matches ふ?', ['fu', 'he', 'ha'], 0, 'ふ represents fu in this exercise.'),
    Exercise('Which romaji matches へ?', ['ho', 'he', 'hi'], 1, 'へ represents he in this exercise.'),
    Exercise('Which romaji matches ほ?', ['ha', 'fu', 'ho'], 2, 'ほ represents ho in this exercise.'),
    Exercise('Choose the hiragana for ha.', ['ひ', 'へ', 'は'], 2, 'は represents ha in this exercise.'),
    Exercise('Choose the hiragana for hi.', ['ひ', 'ふ', 'ほ'], 0, 'ひ represents hi in this exercise.'),
    Exercise('Choose the hiragana for fu.', ['へ', 'ふ', 'は'], 1, 'ふ represents fu in this exercise.'),
    Exercise('Choose the hiragana for he.', ['ほ', 'ひ', 'へ'], 2, 'へ represents he in this exercise.'),
    Exercise('Choose the hiragana for ho.', ['ほ', 'は', 'ふ'], 0, 'ほ represents ho in this exercise.'),
  ],
);

const lessons = [
  greetings, hiraganaVowels, hiraganaK, hiraganaS,
  hiraganaT, hiraganaN, hiraganaH,
];

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
