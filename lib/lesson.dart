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
  final String section;
  const Lesson(this.id, this.title, this.introduction, this.exercises,
      {this.section = 'Basic hiragana'});
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
  section: 'Greetings',
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

const hiraganaM = Lesson(
  'hiragana-m-v1',
  'Hiragana: ma to mo',
  'ま → ma\nみ → mi\nむ → mu\nめ → me\nも → mo\n\nRead the five shapes as ma, mi, mu, me, mo.',
  [
    Exercise('Which romaji matches ま?', ['mi', 'ma', 'mu'], 1, 'ま → ma.'),
    Exercise('Which romaji matches み?', ['mu', 'me', 'mi'], 2, 'み → mi.'),
    Exercise('Which romaji matches む?', ['mu', 'me', 'mo'], 0, 'む → mu.'),
    Exercise('Which romaji matches め?', ['mo', 'me', 'ma'], 1, 'め → me.'),
    Exercise('Which romaji matches も?', ['ma', 'mi', 'mo'], 2, 'も → mo.'),
    Exercise('Choose the hiragana for ma in this lesson.', ['み', 'む', 'ま'], 2, 'ま → ma.'),
    Exercise('Choose the hiragana for mi in this lesson.', ['み', 'む', 'め'], 0, 'み → mi.'),
    Exercise('Choose the hiragana for mu in this lesson.', ['め', 'む', 'も'], 1, 'む → mu.'),
    Exercise('Choose the hiragana for me in this lesson.', ['も', 'ま', 'め'], 2, 'め → me.'),
    Exercise('Choose the hiragana for mo in this lesson.', ['も', 'ま', 'み'], 0, 'も → mo.'),
  ],
  section: 'Basic hiragana',
);

const hiraganaY = Lesson(
  'hiragana-y-v1',
  'Hiragana: ya, yu, yo',
  'や → ya\nゆ → yu\nよ → yo\n\nThis row has three modern basic characters. These full-sized characters each take one beat. Small ゃ, ゅ and ょ are introduced later.',
  [
    Exercise('Which romaji matches や?', ['yu', 'ya', 'yo'], 1, 'や → ya.'),
    Exercise('Which romaji matches ゆ?', ['yo', 'ya', 'yu'], 2, 'ゆ → yu.'),
    Exercise('Which romaji matches よ?', ['yo', 'ya', 'yu'], 0, 'よ → yo.'),
    Exercise('Choose the hiragana for ya in this lesson.', ['ゆ', 'よ', 'や'], 2, 'や → ya.'),
    Exercise('Choose the hiragana for yu in this lesson.', ['ゆ', 'よ', 'や'], 0, 'ゆ → yu.'),
    Exercise('Choose the hiragana for yo in this lesson.', ['や', 'よ', 'ゆ'], 1, 'よ → yo.'),
  ],
  section: 'Basic hiragana',
);

const hiraganaR = Lesson(
  'hiragana-r-v1',
  'Hiragana: ra to ro',
  'ら → ra\nり → ri\nる → ru\nれ → re\nろ → ro\n\nCompare る and ろ carefully. Their similar shapes represent different sounds.',
  [
    Exercise('Which romaji matches ら?', ['ri', 'ra', 'ru'], 1, 'ら → ra.'),
    Exercise('Which romaji matches り?', ['ru', 're', 'ri'], 2, 'り → ri.'),
    Exercise('Which romaji matches る?', ['ru', 're', 'ro'], 0, 'る → ru.'),
    Exercise('Which romaji matches れ?', ['ro', 're', 'ra'], 1, 'れ → re.'),
    Exercise('Which romaji matches ろ?', ['ra', 'ri', 'ro'], 2, 'ろ → ro.'),
    Exercise('Choose the hiragana for ra in this lesson.', ['り', 'る', 'ら'], 2, 'ら → ra.'),
    Exercise('Choose the hiragana for ri in this lesson.', ['り', 'る', 'れ'], 0, 'り → ri.'),
    Exercise('Choose the hiragana for ru in this lesson.', ['れ', 'る', 'ろ'], 1, 'る → ru.'),
    Exercise('Choose the hiragana for re in this lesson.', ['ろ', 'ら', 'れ'], 2, 'れ → re.'),
    Exercise('Choose the hiragana for ro in this lesson.', ['ろ', 'ら', 'り'], 0, 'ろ → ro.'),
  ],
  section: 'Basic hiragana',
);

const hiraganaWN = Lesson(
  'hiragana-wn-v1',
  'Hiragana: wa, wo and n',
  'わ → wa\nを → wo\nん → n\n\nを is normally pronounced o as the object particle. We label it wo here to distinguish its spelling from お. ん is a separate beat, not na, ni or nu. Before a vowel or y sound, an apostrophe can separate n in romaji: しんよう is shin\'you.',
  [
    Exercise('Which romaji matches わ?', ['wo', 'wa', 'n'], 1, 'わ → wa.'),
    Exercise('Which romaji matches を?', ['n', 'wa', 'wo'], 2, 'を is labelled wo here to identify its spelling; the object particle is pronounced o.'),
    Exercise('Which romaji matches ん?', ['n', 'wa', 'wo'], 0, 'ん → n.'),
    Exercise('Choose the hiragana for wa in this lesson.', ['を', 'ん', 'わ'], 2, 'わ → wa.'),
    Exercise('Choose the hiragana for wo in this lesson.', ['を', 'ん', 'わ'], 0, 'を is labelled wo here to identify its spelling; the object particle is pronounced o.'),
    Exercise('Choose the hiragana for n in this lesson.', ['わ', 'ん', 'を'], 1, 'ん → n.'),
  ],
  section: 'Basic hiragana',
);

const hiraganaG = Lesson(
  'hiragana-g-v1',
  'Dakuten: ga to go',
  'が → ga\nぎ → gi\nぐ → gu\nげ → ge\nご → go\n\nDakuten are the two small marks ゛. On the K row they change k to g: か becomes が.',
  [
    Exercise('Which romaji matches が?', ['gi', 'ga', 'gu'], 1, 'が → ga.'),
    Exercise('Which romaji matches ぎ?', ['gu', 'ge', 'gi'], 2, 'ぎ → gi.'),
    Exercise('Which romaji matches ぐ?', ['gu', 'ge', 'go'], 0, 'ぐ → gu.'),
    Exercise('Which romaji matches げ?', ['go', 'ge', 'ga'], 1, 'げ → ge.'),
    Exercise('Which romaji matches ご?', ['ga', 'gi', 'go'], 2, 'ご → go.'),
    Exercise('Choose the hiragana for ga in this lesson.', ['ぎ', 'ぐ', 'が'], 2, 'が → ga.'),
    Exercise('Choose the hiragana for gi in this lesson.', ['ぎ', 'ぐ', 'げ'], 0, 'ぎ → gi.'),
    Exercise('Choose the hiragana for gu in this lesson.', ['げ', 'ぐ', 'ご'], 1, 'ぐ → gu.'),
    Exercise('Choose the hiragana for ge in this lesson.', ['ご', 'が', 'げ'], 2, 'げ → ge.'),
    Exercise('Choose the hiragana for go in this lesson.', ['ご', 'が', 'ぎ'], 0, 'ご → go.'),
  ],
  section: 'Voiced sounds',
);

const hiraganaZ = Lesson(
  'hiragana-z-v1',
  'Dakuten: za to zo',
  'ざ → za\nじ → ji\nず → zu\nぜ → ze\nぞ → zo\n\nDakuten change the S row. This course uses ji for じ and zu for ず.',
  [
    Exercise('Which romaji matches ざ?', ['ji', 'za', 'zu'], 1, 'ざ → za.'),
    Exercise('Which romaji matches じ?', ['zu', 'ze', 'ji'], 2, 'じ → ji.'),
    Exercise('Which romaji matches ず?', ['zu', 'ze', 'zo'], 0, 'ず → zu.'),
    Exercise('Which romaji matches ぜ?', ['zo', 'ze', 'za'], 1, 'ぜ → ze.'),
    Exercise('Which romaji matches ぞ?', ['za', 'ji', 'zo'], 2, 'ぞ → zo.'),
    Exercise('Choose the hiragana for za in this lesson.', ['じ', 'ず', 'ざ'], 2, 'ざ → za.'),
    Exercise('Choose the hiragana for ji in this lesson.', ['じ', 'ず', 'ぜ'], 0, 'じ → ji.'),
    Exercise('Choose the hiragana for zu in this lesson.', ['ぜ', 'ず', 'ぞ'], 1, 'ず → zu.'),
    Exercise('Choose the hiragana for ze in this lesson.', ['ぞ', 'ざ', 'ぜ'], 2, 'ぜ → ze.'),
    Exercise('Choose the hiragana for zo in this lesson.', ['ぞ', 'ざ', 'じ'], 0, 'ぞ → zo.'),
  ],
  section: 'Voiced sounds',
);

const hiraganaD = Lesson(
  'hiragana-d-v1',
  'Dakuten: da, ji, zu, de, do',
  'だ → da\nぢ → ji\nづ → zu\nで → de\nど → do\n\nぢ and づ are usually pronounced like じ and ず in standard Japanese, but their spellings are different. In this lesson the ji and zu choices refer to the T-row forms ぢ and づ. Keyboard input often uses di and du. Learn the spelling of each word.',
  [
    Exercise('Which romaji matches だ?', ['ji', 'da', 'zu'], 1, 'だ → da.'),
    Exercise('Which romaji matches ぢ?', ['zu', 'de', 'ji'], 2, 'ぢ → ji.'),
    Exercise('Which romaji matches づ?', ['zu', 'de', 'do'], 0, 'づ → zu.'),
    Exercise('Which romaji matches で?', ['do', 'de', 'da'], 1, 'で → de.'),
    Exercise('Which romaji matches ど?', ['da', 'ji', 'do'], 2, 'ど → do.'),
    Exercise('Choose the hiragana for da in this lesson.', ['ぢ', 'づ', 'だ'], 2, 'だ → da.'),
    Exercise('Choose the hiragana for ji in this lesson.', ['ぢ', 'づ', 'で'], 0, 'ぢ → ji.'),
    Exercise('Choose the hiragana for zu in this lesson.', ['で', 'づ', 'ど'], 1, 'づ → zu.'),
    Exercise('Choose the hiragana for de in this lesson.', ['ど', 'だ', 'で'], 2, 'で → de.'),
    Exercise('Choose the hiragana for do in this lesson.', ['ど', 'だ', 'ぢ'], 0, 'ど → do.'),
  ],
  section: 'Voiced sounds',
);

const hiraganaB = Lesson(
  'hiragana-b-v1',
  'Dakuten: ba to bo',
  'ば → ba\nび → bi\nぶ → bu\nべ → be\nぼ → bo\n\nDakuten change the H row to b sounds: は becomes ば. Notice the two small marks.',
  [
    Exercise('Which romaji matches ば?', ['bi', 'ba', 'bu'], 1, 'ば → ba.'),
    Exercise('Which romaji matches び?', ['bu', 'be', 'bi'], 2, 'び → bi.'),
    Exercise('Which romaji matches ぶ?', ['bu', 'be', 'bo'], 0, 'ぶ → bu.'),
    Exercise('Which romaji matches べ?', ['bo', 'be', 'ba'], 1, 'べ → be.'),
    Exercise('Which romaji matches ぼ?', ['ba', 'bi', 'bo'], 2, 'ぼ → bo.'),
    Exercise('Choose the hiragana for ba in this lesson.', ['び', 'ぶ', 'ば'], 2, 'ば → ba.'),
    Exercise('Choose the hiragana for bi in this lesson.', ['び', 'ぶ', 'べ'], 0, 'び → bi.'),
    Exercise('Choose the hiragana for bu in this lesson.', ['べ', 'ぶ', 'ぼ'], 1, 'ぶ → bu.'),
    Exercise('Choose the hiragana for be in this lesson.', ['ぼ', 'ば', 'べ'], 2, 'べ → be.'),
    Exercise('Choose the hiragana for bo in this lesson.', ['ぼ', 'ば', 'び'], 0, 'ぼ → bo.'),
  ],
  section: 'Voiced sounds',
);

const hiraganaP = Lesson(
  'hiragana-p-v1',
  'Handakuten: pa to po',
  'ぱ → pa\nぴ → pi\nぷ → pu\nぺ → pe\nぽ → po\n\nThe small circle ゜ is handakuten. It changes the H row to p sounds: は becomes ぱ. Compare ば and ぱ.',
  [
    Exercise('Which romaji matches ぱ?', ['pi', 'pa', 'pu'], 1, 'ぱ → pa.'),
    Exercise('Which romaji matches ぴ?', ['pu', 'pe', 'pi'], 2, 'ぴ → pi.'),
    Exercise('Which romaji matches ぷ?', ['pu', 'pe', 'po'], 0, 'ぷ → pu.'),
    Exercise('Which romaji matches ぺ?', ['po', 'pe', 'pa'], 1, 'ぺ → pe.'),
    Exercise('Which romaji matches ぽ?', ['pa', 'pi', 'po'], 2, 'ぽ → po.'),
    Exercise('Choose the hiragana for pa in this lesson.', ['ぴ', 'ぷ', 'ぱ'], 2, 'ぱ → pa.'),
    Exercise('Choose the hiragana for pi in this lesson.', ['ぴ', 'ぷ', 'ぺ'], 0, 'ぴ → pi.'),
    Exercise('Choose the hiragana for pu in this lesson.', ['ぺ', 'ぷ', 'ぽ'], 1, 'ぷ → pu.'),
    Exercise('Choose the hiragana for pe in this lesson.', ['ぽ', 'ぱ', 'ぺ'], 2, 'ぺ → pe.'),
    Exercise('Choose the hiragana for po in this lesson.', ['ぽ', 'ぱ', 'ぴ'], 0, 'ぽ → po.'),
  ],
  section: 'Voiced sounds',
);

const yoonKG = Lesson(
  'hiragana-yoon-kg-v1',
  'Small kana: kya and gya',
  'きゃ → kya\nきゅ → kyu\nきょ → kyo\nぎゃ → gya\nぎゅ → gyu\nぎょ → gyo\n\nAn i-row kana plus small ゃ, ゅ or ょ forms one beat. きゃ is kya, while full-sized きや is ki-ya (two beats). Dakuten stay on the first character.',
  [
    Exercise('Which romaji matches きゃ?', ['kyu', 'kya', 'kyo'], 1, 'きゃ → kya.'),
    Exercise('Which romaji matches きゅ?', ['kyo', 'gya', 'kyu'], 2, 'きゅ → kyu.'),
    Exercise('Which romaji matches きょ?', ['kyo', 'gya', 'gyu'], 0, 'きょ → kyo.'),
    Exercise('Which romaji matches ぎゃ?', ['gyu', 'gya', 'gyo'], 1, 'ぎゃ → gya.'),
    Exercise('Which romaji matches ぎゅ?', ['gyo', 'kya', 'gyu'], 2, 'ぎゅ → gyu.'),
    Exercise('Which romaji matches ぎょ?', ['gyo', 'kya', 'kyu'], 0, 'ぎょ → gyo.'),
    Exercise('Choose the hiragana for kya in this lesson.', ['きゅ', 'きょ', 'きゃ'], 2, 'きゃ → kya.'),
    Exercise('Choose the hiragana for kyu in this lesson.', ['きゅ', 'きょ', 'ぎゃ'], 0, 'きゅ → kyu.'),
    Exercise('Choose the hiragana for kyo in this lesson.', ['ぎゃ', 'きょ', 'ぎゅ'], 1, 'きょ → kyo.'),
    Exercise('Choose the hiragana for gya in this lesson.', ['ぎゅ', 'ぎょ', 'ぎゃ'], 2, 'ぎゃ → gya.'),
    Exercise('Choose the hiragana for gyu in this lesson.', ['ぎゅ', 'ぎょ', 'きゃ'], 0, 'ぎゅ → gyu.'),
    Exercise('Choose the hiragana for gyo in this lesson.', ['きゃ', 'ぎょ', 'きゅ'], 1, 'ぎょ → gyo.'),
  ],
  section: 'Combined sounds',
);

const yoonSJ = Lesson(
  'hiragana-yoon-sj-v1',
  'Small kana: sha and ja',
  'しゃ → sha\nしゅ → shu\nしょ → sho\nじゃ → ja\nじゅ → ju\nじょ → jo\n\nRead these as sha, shu, sho and ja, ju, jo. The small second character joins the sound into one beat.',
  [
    Exercise('Which romaji matches しゃ?', ['shu', 'sha', 'sho'], 1, 'しゃ → sha.'),
    Exercise('Which romaji matches しゅ?', ['sho', 'ja', 'shu'], 2, 'しゅ → shu.'),
    Exercise('Which romaji matches しょ?', ['sho', 'ja', 'ju'], 0, 'しょ → sho.'),
    Exercise('Which romaji matches じゃ?', ['ju', 'ja', 'jo'], 1, 'じゃ → ja.'),
    Exercise('Which romaji matches じゅ?', ['jo', 'sha', 'ju'], 2, 'じゅ → ju.'),
    Exercise('Which romaji matches じょ?', ['jo', 'sha', 'shu'], 0, 'じょ → jo.'),
    Exercise('Choose the hiragana for sha in this lesson.', ['しゅ', 'しょ', 'しゃ'], 2, 'しゃ → sha.'),
    Exercise('Choose the hiragana for shu in this lesson.', ['しゅ', 'しょ', 'じゃ'], 0, 'しゅ → shu.'),
    Exercise('Choose the hiragana for sho in this lesson.', ['じゃ', 'しょ', 'じゅ'], 1, 'しょ → sho.'),
    Exercise('Choose the hiragana for ja in this lesson.', ['じゅ', 'じょ', 'じゃ'], 2, 'じゃ → ja.'),
    Exercise('Choose the hiragana for ju in this lesson.', ['じゅ', 'じょ', 'しゃ'], 0, 'じゅ → ju.'),
    Exercise('Choose the hiragana for jo in this lesson.', ['しゃ', 'じょ', 'しゅ'], 1, 'じょ → jo.'),
  ],
  section: 'Combined sounds',
);

const yoonCD = Lesson(
  'hiragana-yoon-cd-v1',
  'Small kana: cha and rare d forms',
  'ちゃ → cha\nちゅ → chu\nちょ → cho\nぢゃ → ja\nぢゅ → ju\nぢょ → jo\n\nちゃ, ちゅ and ちょ read cha, chu and cho. The rare spellings ぢゃ, ぢゅ and ぢょ read ja, ju and jo in standard Japanese. In this lesson ja/ju/jo refer to these rare forms; じゃ/じゅ/じょ are the usual spellings in most words.',
  [
    Exercise('Which romaji matches ちゃ?', ['chu', 'cha', 'cho'], 1, 'ちゃ → cha.'),
    Exercise('Which romaji matches ちゅ?', ['cho', 'ja', 'chu'], 2, 'ちゅ → chu.'),
    Exercise('Which romaji matches ちょ?', ['cho', 'ja', 'ju'], 0, 'ちょ → cho.'),
    Exercise('Which romaji matches ぢゃ?', ['ju', 'ja', 'jo'], 1, 'ぢゃ → ja.'),
    Exercise('Which romaji matches ぢゅ?', ['jo', 'cha', 'ju'], 2, 'ぢゅ → ju.'),
    Exercise('Which romaji matches ぢょ?', ['jo', 'cha', 'chu'], 0, 'ぢょ → jo.'),
    Exercise('Choose the hiragana for cha in this lesson.', ['ちゅ', 'ちょ', 'ちゃ'], 2, 'ちゃ → cha.'),
    Exercise('Choose the hiragana for chu in this lesson.', ['ちゅ', 'ちょ', 'ぢゃ'], 0, 'ちゅ → chu.'),
    Exercise('Choose the hiragana for cho in this lesson.', ['ぢゃ', 'ちょ', 'ぢゅ'], 1, 'ちょ → cho.'),
    Exercise('Choose the hiragana for ja in this lesson.', ['ぢゅ', 'ぢょ', 'ぢゃ'], 2, 'ぢゃ → ja.'),
    Exercise('Choose the hiragana for ju in this lesson.', ['ぢゅ', 'ぢょ', 'ちゃ'], 0, 'ぢゅ → ju.'),
    Exercise('Choose the hiragana for jo in this lesson.', ['ちゃ', 'ぢょ', 'ちゅ'], 1, 'ぢょ → jo.'),
  ],
  section: 'Combined sounds',
);

const yoonNH = Lesson(
  'hiragana-yoon-nh-v1',
  'Small kana: nya and hya',
  'にゃ → nya\nにゅ → nyu\nにょ → nyo\nひゃ → hya\nひゅ → hyu\nひょ → hyo\n\nCombine に or ひ with small ゃ, ゅ or ょ. Keep the second character small: にゃ is nya, while にや is ni-ya.',
  [
    Exercise('Which romaji matches にゃ?', ['nyu', 'nya', 'nyo'], 1, 'にゃ → nya.'),
    Exercise('Which romaji matches にゅ?', ['nyo', 'hya', 'nyu'], 2, 'にゅ → nyu.'),
    Exercise('Which romaji matches にょ?', ['nyo', 'hya', 'hyu'], 0, 'にょ → nyo.'),
    Exercise('Which romaji matches ひゃ?', ['hyu', 'hya', 'hyo'], 1, 'ひゃ → hya.'),
    Exercise('Which romaji matches ひゅ?', ['hyo', 'nya', 'hyu'], 2, 'ひゅ → hyu.'),
    Exercise('Which romaji matches ひょ?', ['hyo', 'nya', 'nyu'], 0, 'ひょ → hyo.'),
    Exercise('Choose the hiragana for nya in this lesson.', ['にゅ', 'にょ', 'にゃ'], 2, 'にゃ → nya.'),
    Exercise('Choose the hiragana for nyu in this lesson.', ['にゅ', 'にょ', 'ひゃ'], 0, 'にゅ → nyu.'),
    Exercise('Choose the hiragana for nyo in this lesson.', ['ひゃ', 'にょ', 'ひゅ'], 1, 'にょ → nyo.'),
    Exercise('Choose the hiragana for hya in this lesson.', ['ひゅ', 'ひょ', 'ひゃ'], 2, 'ひゃ → hya.'),
    Exercise('Choose the hiragana for hyu in this lesson.', ['ひゅ', 'ひょ', 'にゃ'], 0, 'ひゅ → hyu.'),
    Exercise('Choose the hiragana for hyo in this lesson.', ['にゃ', 'ひょ', 'にゅ'], 1, 'ひょ → hyo.'),
  ],
  section: 'Combined sounds',
);

const yoonMR = Lesson(
  'hiragana-yoon-mr-v1',
  'Small kana: mya and rya',
  'みゃ → mya\nみゅ → myu\nみょ → myo\nりゃ → rya\nりゅ → ryu\nりょ → ryo\n\nCombine み or り with small ゃ, ゅ or ょ. Each combination takes one beat.',
  [
    Exercise('Which romaji matches みゃ?', ['myu', 'mya', 'myo'], 1, 'みゃ → mya.'),
    Exercise('Which romaji matches みゅ?', ['myo', 'rya', 'myu'], 2, 'みゅ → myu.'),
    Exercise('Which romaji matches みょ?', ['myo', 'rya', 'ryu'], 0, 'みょ → myo.'),
    Exercise('Which romaji matches りゃ?', ['ryu', 'rya', 'ryo'], 1, 'りゃ → rya.'),
    Exercise('Which romaji matches りゅ?', ['ryo', 'mya', 'ryu'], 2, 'りゅ → ryu.'),
    Exercise('Which romaji matches りょ?', ['ryo', 'mya', 'myu'], 0, 'りょ → ryo.'),
    Exercise('Choose the hiragana for mya in this lesson.', ['みゅ', 'みょ', 'みゃ'], 2, 'みゃ → mya.'),
    Exercise('Choose the hiragana for myu in this lesson.', ['みゅ', 'みょ', 'りゃ'], 0, 'みゅ → myu.'),
    Exercise('Choose the hiragana for myo in this lesson.', ['りゃ', 'みょ', 'りゅ'], 1, 'みょ → myo.'),
    Exercise('Choose the hiragana for rya in this lesson.', ['りゅ', 'りょ', 'りゃ'], 2, 'りゃ → rya.'),
    Exercise('Choose the hiragana for ryu in this lesson.', ['りゅ', 'りょ', 'みゃ'], 0, 'りゅ → ryu.'),
    Exercise('Choose the hiragana for ryo in this lesson.', ['みゃ', 'りょ', 'みゅ'], 1, 'りょ → ryo.'),
  ],
  section: 'Combined sounds',
);

const yoonBP = Lesson(
  'hiragana-yoon-bp-v1',
  'Small kana: bya and pya',
  'びゃ → bya\nびゅ → byu\nびょ → byo\nぴゃ → pya\nぴゅ → pyu\nぴょ → pyo\n\nCompare dakuten in び and the handakuten circle in ぴ. Keep small ゃ, ゅ or ょ after the first kana.',
  [
    Exercise('Which romaji matches びゃ?', ['byu', 'bya', 'byo'], 1, 'びゃ → bya.'),
    Exercise('Which romaji matches びゅ?', ['byo', 'pya', 'byu'], 2, 'びゅ → byu.'),
    Exercise('Which romaji matches びょ?', ['byo', 'pya', 'pyu'], 0, 'びょ → byo.'),
    Exercise('Which romaji matches ぴゃ?', ['pyu', 'pya', 'pyo'], 1, 'ぴゃ → pya.'),
    Exercise('Which romaji matches ぴゅ?', ['pyo', 'bya', 'pyu'], 2, 'ぴゅ → pyu.'),
    Exercise('Which romaji matches ぴょ?', ['pyo', 'bya', 'byu'], 0, 'ぴょ → pyo.'),
    Exercise('Choose the hiragana for bya in this lesson.', ['びゅ', 'びょ', 'びゃ'], 2, 'びゃ → bya.'),
    Exercise('Choose the hiragana for byu in this lesson.', ['びゅ', 'びょ', 'ぴゃ'], 0, 'びゅ → byu.'),
    Exercise('Choose the hiragana for byo in this lesson.', ['ぴゃ', 'びょ', 'ぴゅ'], 1, 'びょ → byo.'),
    Exercise('Choose the hiragana for pya in this lesson.', ['ぴゅ', 'ぴょ', 'ぴゃ'], 2, 'ぴゃ → pya.'),
    Exercise('Choose the hiragana for pyu in this lesson.', ['ぴゅ', 'ぴょ', 'びゃ'], 0, 'ぴゅ → pyu.'),
    Exercise('Choose the hiragana for pyo in this lesson.', ['びゃ', 'ぴょ', 'びゅ'], 1, 'ぴょ → pyo.'),
  ],
  section: 'Combined sounds',
);

const smallTsu = Lesson(
  'hiragana-small-tsu-v1',
  'Small っ: consonant length',
  'Small っ adds one beat before the following consonant. It is not read tsu here. In romaji, examples include kitte (きって) and gakkou (がっこう). Full-sized つ is tsu. The extra beat can change the word.',
  [
    Exercise('Which spelling contains small っ?', ['きつて', 'きって', 'きて'], 1, 'きって has small っ; きつて has full-sized つ.'),
    Exercise('Read きって.', ['kite', 'kitsute', 'kitte'], 2, 'Small っ doubles the t in kitte.'),
    Exercise('Choose the spelling for gakkou.', ['がっこう', 'がこう', 'がつこう'], 0, 'がっこう includes the extra consonant beat before k.'),
    Exercise('How many beats are in きって?', ['Two', 'Three', 'Four'], 1, 'き・っ・て has three beats.'),
    Exercise('Read いっぱい.', ['ippai', 'ipai', 'itsupai'], 0, 'い・っ・ぱ・い is ippai.'),
    Exercise('Which character is full-sized tsu?', ['っ', 'ゃ', 'つ'], 2, 'つ is full-sized. Small っ marks consonant length in these examples.'),
  ],
  section: 'Reading rules',
);

const longVowels = Lesson(
  'hiragana-long-vowels-v1',
  'Long vowels: spelling and length',
  'A long vowel lasts two beats. Hiragana writes the extra length with vowel kana: ああ, いい and うう. A long e can be written ええ or えい, and a long o can be おお or おう, depending on the word. Learn the actual spelling. Here romaji keeps the kana spelling (ei/ou); these are often pronounced as long ee/oo.',
  [
    Exercise('Which spelling is okaasan (mother)?', ['おかさん', 'おかあさん', 'おかっさん'], 1, 'おかあさん includes the extra あ for the long a.'),
    Exercise('Which spelling is oniisan (older brother)?', ['おにさん', 'おにっさん', 'おにいさん'], 2, 'おにいさん includes the extra い.'),
    Exercise('Which spelling is kuuki (air)?', ['くうき', 'くき', 'くっき'], 0, 'くうき has a long u, written う after く.'),
    Exercise('Which spelling is sensei (teacher)?', ['せんせえ', 'せんせい', 'せんせ'], 1, 'せんせい is spelled with い, even when the ending sounds like a long e.'),
    Exercise('Which spelling is tooi (far)?', ['とおい', 'とい', 'とっい'], 0, 'とおい spells its long o with お, not う.'),
    Exercise('How many beats are in こうこう?', ['Two', 'Three', 'Four'], 2, 'こ・う・こ・う has four beats. Each ou is a long o in this word.'),
  ],
  section: 'Reading rules',
);

const particles = Lesson(
  'hiragana-particles-v1',
  'Particles and ん',
  'Some grammatical particles have special readings: は is wa, へ is e, and を is o. In other positions, は and へ have their basic readings ha and he. ん keeps its own beat; it does not add a vowel. The examples here focus on reading, not a complete grammar lesson.',
  [
    Exercise('Read the particle は in わたしは.', ['ha', 'wa', 'he'], 1, 'The topic particle は is pronounced wa.'),
    Exercise('Read the particle へ in がっこうへ.', ['he', 'ha', 'e'], 2, 'The direction particle へ is pronounced e.'),
    Exercise('Read the particle を in みずを.', ['o', 'wo with a strong w', 'wa'], 0, 'The object particle を is normally pronounced o.'),
    Exercise('Read は at the start of はな (flower).', ['wa', 'ha', 'e'], 1, 'This は is part of a word, not the topic particle.'),
    Exercise('How many beats are in ほん?', ['Two', 'One', 'Three'], 0, 'ほ・ん has two beats; ん has its own beat.'),
    Exercise('Which romaji separates ん from よ in しんよう?', ['shinyou', 'shin\'you', 'shinyu'], 1, 'The apostrophe in shin\'you shows n followed by yo, not the combination nyo.'),
  ],
  section: 'Reading rules',
);

const readingReview = Lesson(
  'hiragana-reading-review-v1',
  'Hiragana reading checkpoint',
  'Combine what you have learned: basic kana, marks, small kana, consonant length and long vowels. Read the whole word before choosing. We keep ou and uu in romaji to show spelling. Completing this quiz records practice; it does not certify pronunciation or handwriting.',
  [
    Exercise('Read ねこ.', ['neko', 'nuko', 'neki'], 0, 'ね is ne and こ is ko: neko.'),
    Exercise('Read でんわ.', ['tenwa', 'denwa', 'denya'], 1, 'で has dakuten and ん has its own beat: denwa.'),
    Exercise('Read びょういん.', ['biyouin', 'byoin', 'byouin'], 2, 'びょ combines with small ょ; う adds vowel length: byouin.'),
    Exercise('Read りょこう.', ['ryokou', 'riyokou', 'ryoko'], 0, 'りょ is ryo and こう is kou: ryokou.'),
    Exercise('Choose the spelling for zasshi.', ['ざし', 'ざっし', 'さっし'], 1, 'ざ has dakuten; small っ adds the consonant beat: zasshi.'),
    Exercise('Read きゅう.', ['kiyu', 'kyu', 'kyuu'], 2, 'きゅ forms kyu and the final う adds vowel length.'),
  ],
  section: 'Reading rules',
);

const lessons = [
  greetings, hiraganaVowels, hiraganaK, hiraganaS,
  hiraganaT, hiraganaN, hiraganaH,
  hiraganaM,
  hiraganaY,
  hiraganaR,
  hiraganaWN,
  hiraganaG,
  hiraganaZ,
  hiraganaD,
  hiraganaB,
  hiraganaP,
  yoonKG,
  yoonSJ,
  yoonCD,
  yoonNH,
  yoonMR,
  yoonBP,
  smallTsu,
  longVowels,
  particles,
  readingReview,
];

const lessonSections = [
  'All lessons', 'Greetings', 'Basic hiragana',
  'Voiced sounds', 'Combined sounds', 'Reading rules',
];

class LessonSession {
  final Lesson lesson;
  int index = 0;
  int correct = 0;
  final List<Exercise> _mistakes = [];
  List<Exercise> get mistakes => List.unmodifiable(_mistakes);
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
    if (lastCorrect!) {
      correct++;
    } else {
      _mistakes.add(current);
    }
    answered = true;
  }

  void next() {
    if (!answered || finished) return;
    index++;
    answered = false;
    lastCorrect = null;
  }
}
