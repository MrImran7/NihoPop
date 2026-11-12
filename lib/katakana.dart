part of 'lesson.dart';

// Original katakana teaching content; see docs/KATAKANA.md for conventions.

const katakanaVowels = Lesson(
  'katakana-vowels-v1',
  'Katakana: the five vowels',
  'ア → a\nイ → i\nウ → u\nエ → e\nオ → o\n\nKatakana is used for many loanwords, names and emphasis. These five shapes represent vowel sounds, not English words. Romaji shows their readings.',
  [
    Exercise('Which romaji matches ア?', ['i', 'a', 'u'], 1, 'ア → a.'),
    Exercise('Which romaji matches イ?', ['u', 'e', 'i'], 2, 'イ → i.'),
    Exercise('Which romaji matches ウ?', ['u', 'e', 'o'], 0, 'ウ → u.'),
    Exercise('Which romaji matches エ?', ['o', 'e', 'a'], 1, 'エ → e.'),
    Exercise('Which romaji matches オ?', ['a', 'i', 'o'], 2, 'オ → o.'),
    Exercise('Choose the katakana for a in this lesson.', ['イ', 'ウ', 'ア'], 2, 'ア → a.'),
    Exercise('Choose the katakana for i in this lesson.', ['イ', 'ウ', 'エ'], 0, 'イ → i.'),
    Exercise('Choose the katakana for u in this lesson.', ['エ', 'ウ', 'オ'], 1, 'ウ → u.'),
    Exercise('Choose the katakana for e in this lesson.', ['オ', 'ア', 'エ'], 2, 'エ → e.'),
    Exercise('Choose the katakana for o in this lesson.', ['オ', 'ア', 'イ'], 0, 'オ → o.'),
  ],
  section: 'Katakana basics',
);

const katakanaK = Lesson(
  'katakana-k-v1',
  'Katakana: ka to ko',
  'カ → ka\nキ → ki\nク → ku\nケ → ke\nコ → ko\n\nRead this row as ka, ki, ku, ke, ko. カ and ケ are different shapes.',
  [
    Exercise('Which romaji matches カ?', ['ki', 'ka', 'ku'], 1, 'カ → ka.'),
    Exercise('Which romaji matches キ?', ['ku', 'ke', 'ki'], 2, 'キ → ki.'),
    Exercise('Which romaji matches ク?', ['ku', 'ke', 'ko'], 0, 'ク → ku.'),
    Exercise('Which romaji matches ケ?', ['ko', 'ke', 'ka'], 1, 'ケ → ke.'),
    Exercise('Which romaji matches コ?', ['ka', 'ki', 'ko'], 2, 'コ → ko.'),
    Exercise('Choose the katakana for ka in this lesson.', ['キ', 'ク', 'カ'], 2, 'カ → ka.'),
    Exercise('Choose the katakana for ki in this lesson.', ['キ', 'ク', 'ケ'], 0, 'キ → ki.'),
    Exercise('Choose the katakana for ku in this lesson.', ['ケ', 'ク', 'コ'], 1, 'ク → ku.'),
    Exercise('Choose the katakana for ke in this lesson.', ['コ', 'カ', 'ケ'], 2, 'ケ → ke.'),
    Exercise('Choose the katakana for ko in this lesson.', ['コ', 'カ', 'キ'], 0, 'コ → ko.'),
  ],
  section: 'Katakana basics',
);

const katakanaS = Lesson(
  'katakana-s-v1',
  'Katakana: sa to so',
  'サ → sa\nシ → shi\nス → su\nセ → se\nソ → so\n\nUse shi for シ. Compare シ with ツ in the next row, and ソ with ン later.',
  [
    Exercise('Which romaji matches サ?', ['shi', 'sa', 'su'], 1, 'サ → sa.'),
    Exercise('Which romaji matches シ?', ['su', 'se', 'shi'], 2, 'シ → shi.'),
    Exercise('Which romaji matches ス?', ['su', 'se', 'so'], 0, 'ス → su.'),
    Exercise('Which romaji matches セ?', ['so', 'se', 'sa'], 1, 'セ → se.'),
    Exercise('Which romaji matches ソ?', ['sa', 'shi', 'so'], 2, 'ソ → so.'),
    Exercise('Choose the katakana for sa in this lesson.', ['シ', 'ス', 'サ'], 2, 'サ → sa.'),
    Exercise('Choose the katakana for shi in this lesson.', ['シ', 'ス', 'セ'], 0, 'シ → shi.'),
    Exercise('Choose the katakana for su in this lesson.', ['セ', 'ス', 'ソ'], 1, 'ス → su.'),
    Exercise('Choose the katakana for se in this lesson.', ['ソ', 'サ', 'セ'], 2, 'セ → se.'),
    Exercise('Choose the katakana for so in this lesson.', ['ソ', 'サ', 'シ'], 0, 'ソ → so.'),
  ],
  section: 'Katakana basics',
);

const katakanaT = Lesson(
  'katakana-t-v1',
  'Katakana: ta to to',
  'タ → ta\nチ → chi\nツ → tsu\nテ → te\nト → to\n\nUse chi for チ and tsu for ツ. Full-sized ツ is different from small ッ.',
  [
    Exercise('Which romaji matches タ?', ['chi', 'ta', 'tsu'], 1, 'タ → ta.'),
    Exercise('Which romaji matches チ?', ['tsu', 'te', 'chi'], 2, 'チ → chi.'),
    Exercise('Which romaji matches ツ?', ['tsu', 'te', 'to'], 0, 'ツ → tsu.'),
    Exercise('Which romaji matches テ?', ['to', 'te', 'ta'], 1, 'テ → te.'),
    Exercise('Which romaji matches ト?', ['ta', 'chi', 'to'], 2, 'ト → to.'),
    Exercise('Choose the katakana for ta in this lesson.', ['チ', 'ツ', 'タ'], 2, 'タ → ta.'),
    Exercise('Choose the katakana for chi in this lesson.', ['チ', 'ツ', 'テ'], 0, 'チ → chi.'),
    Exercise('Choose the katakana for tsu in this lesson.', ['テ', 'ツ', 'ト'], 1, 'ツ → tsu.'),
    Exercise('Choose the katakana for te in this lesson.', ['ト', 'タ', 'テ'], 2, 'テ → te.'),
    Exercise('Choose the katakana for to in this lesson.', ['ト', 'タ', 'チ'], 0, 'ト → to.'),
  ],
  section: 'Katakana basics',
);

const katakanaN = Lesson(
  'katakana-n-v1',
  'Katakana: na to no',
  'ナ → na\nニ → ni\nヌ → nu\nネ → ne\nノ → no\n\nRead na, ni, nu, ne, no. Notice the crossing strokes in ヌ.',
  [
    Exercise('Which romaji matches ナ?', ['ni', 'na', 'nu'], 1, 'ナ → na.'),
    Exercise('Which romaji matches ニ?', ['nu', 'ne', 'ni'], 2, 'ニ → ni.'),
    Exercise('Which romaji matches ヌ?', ['nu', 'ne', 'no'], 0, 'ヌ → nu.'),
    Exercise('Which romaji matches ネ?', ['no', 'ne', 'na'], 1, 'ネ → ne.'),
    Exercise('Which romaji matches ノ?', ['na', 'ni', 'no'], 2, 'ノ → no.'),
    Exercise('Choose the katakana for na in this lesson.', ['ニ', 'ヌ', 'ナ'], 2, 'ナ → na.'),
    Exercise('Choose the katakana for ni in this lesson.', ['ニ', 'ヌ', 'ネ'], 0, 'ニ → ni.'),
    Exercise('Choose the katakana for nu in this lesson.', ['ネ', 'ヌ', 'ノ'], 1, 'ヌ → nu.'),
    Exercise('Choose the katakana for ne in this lesson.', ['ノ', 'ナ', 'ネ'], 2, 'ネ → ne.'),
    Exercise('Choose the katakana for no in this lesson.', ['ノ', 'ナ', 'ニ'], 0, 'ノ → no.'),
  ],
  section: 'Katakana basics',
);

const katakanaH = Lesson(
  'katakana-h-v1',
  'Katakana: ha to ho',
  'ハ → ha\nヒ → hi\nフ → fu\nヘ → he\nホ → ho\n\nUse fu for フ. These exercises use the basic character readings.',
  [
    Exercise('Which romaji matches ハ?', ['hi', 'ha', 'fu'], 1, 'ハ → ha.'),
    Exercise('Which romaji matches ヒ?', ['fu', 'he', 'hi'], 2, 'ヒ → hi.'),
    Exercise('Which romaji matches フ?', ['fu', 'he', 'ho'], 0, 'フ → fu.'),
    Exercise('Which romaji matches ヘ?', ['ho', 'he', 'ha'], 1, 'ヘ → he.'),
    Exercise('Which romaji matches ホ?', ['ha', 'hi', 'ho'], 2, 'ホ → ho.'),
    Exercise('Choose the katakana for ha in this lesson.', ['ヒ', 'フ', 'ハ'], 2, 'ハ → ha.'),
    Exercise('Choose the katakana for hi in this lesson.', ['ヒ', 'フ', 'ヘ'], 0, 'ヒ → hi.'),
    Exercise('Choose the katakana for fu in this lesson.', ['ヘ', 'フ', 'ホ'], 1, 'フ → fu.'),
    Exercise('Choose the katakana for he in this lesson.', ['ホ', 'ハ', 'ヘ'], 2, 'ヘ → he.'),
    Exercise('Choose the katakana for ho in this lesson.', ['ホ', 'ハ', 'ヒ'], 0, 'ホ → ho.'),
  ],
  section: 'Katakana basics',
);

const katakanaM = Lesson(
  'katakana-m-v1',
  'Katakana: ma to mo',
  'マ → ma\nミ → mi\nム → mu\nメ → me\nモ → mo\n\nCompare マ and ム carefully; these characters have different readings.',
  [
    Exercise('Which romaji matches マ?', ['mi', 'ma', 'mu'], 1, 'マ → ma.'),
    Exercise('Which romaji matches ミ?', ['mu', 'me', 'mi'], 2, 'ミ → mi.'),
    Exercise('Which romaji matches ム?', ['mu', 'me', 'mo'], 0, 'ム → mu.'),
    Exercise('Which romaji matches メ?', ['mo', 'me', 'ma'], 1, 'メ → me.'),
    Exercise('Which romaji matches モ?', ['ma', 'mi', 'mo'], 2, 'モ → mo.'),
    Exercise('Choose the katakana for ma in this lesson.', ['ミ', 'ム', 'マ'], 2, 'マ → ma.'),
    Exercise('Choose the katakana for mi in this lesson.', ['ミ', 'ム', 'メ'], 0, 'ミ → mi.'),
    Exercise('Choose the katakana for mu in this lesson.', ['メ', 'ム', 'モ'], 1, 'ム → mu.'),
    Exercise('Choose the katakana for me in this lesson.', ['モ', 'マ', 'メ'], 2, 'メ → me.'),
    Exercise('Choose the katakana for mo in this lesson.', ['モ', 'マ', 'ミ'], 0, 'モ → mo.'),
  ],
  section: 'Katakana basics',
);

const katakanaY = Lesson(
  'katakana-y-v1',
  'Katakana: ya, yu, yo',
  'ヤ → ya\nユ → yu\nヨ → yo\n\nThese are full-sized characters. Small ャ, ュ and ョ form combined sounds in later lessons.',
  [
    Exercise('Which romaji matches ヤ?', ['yu', 'ya', 'yo'], 1, 'ヤ → ya.'),
    Exercise('Which romaji matches ユ?', ['yo', 'ya', 'yu'], 2, 'ユ → yu.'),
    Exercise('Which romaji matches ヨ?', ['yo', 'ya', 'yu'], 0, 'ヨ → yo.'),
    Exercise('Choose the katakana for ya in this lesson.', ['ユ', 'ヨ', 'ヤ'], 2, 'ヤ → ya.'),
    Exercise('Choose the katakana for yu in this lesson.', ['ユ', 'ヨ', 'ヤ'], 0, 'ユ → yu.'),
    Exercise('Choose the katakana for yo in this lesson.', ['ヤ', 'ヨ', 'ユ'], 1, 'ヨ → yo.'),
  ],
  section: 'Katakana basics',
);

const katakanaR = Lesson(
  'katakana-r-v1',
  'Katakana: ra to ro',
  'ラ → ra\nリ → ri\nル → ru\nレ → re\nロ → ro\n\nCompare ル and レ. Both begin similarly but end differently.',
  [
    Exercise('Which romaji matches ラ?', ['ri', 'ra', 'ru'], 1, 'ラ → ra.'),
    Exercise('Which romaji matches リ?', ['ru', 're', 'ri'], 2, 'リ → ri.'),
    Exercise('Which romaji matches ル?', ['ru', 're', 'ro'], 0, 'ル → ru.'),
    Exercise('Which romaji matches レ?', ['ro', 're', 'ra'], 1, 'レ → re.'),
    Exercise('Which romaji matches ロ?', ['ra', 'ri', 'ro'], 2, 'ロ → ro.'),
    Exercise('Choose the katakana for ra in this lesson.', ['リ', 'ル', 'ラ'], 2, 'ラ → ra.'),
    Exercise('Choose the katakana for ri in this lesson.', ['リ', 'ル', 'レ'], 0, 'リ → ri.'),
    Exercise('Choose the katakana for ru in this lesson.', ['レ', 'ル', 'ロ'], 1, 'ル → ru.'),
    Exercise('Choose the katakana for re in this lesson.', ['ロ', 'ラ', 'レ'], 2, 'レ → re.'),
    Exercise('Choose the katakana for ro in this lesson.', ['ロ', 'ラ', 'リ'], 0, 'ロ → ro.'),
  ],
  section: 'Katakana basics',
);

const katakanaWN = Lesson(
  'katakana-wn-v1',
  'Katakana: wa, wo and n',
  'ワ → wa\nヲ → wo\nン → n\n\nヲ is labelled wo here to distinguish its spelling from オ; it is usually read o. It is uncommon in everyday loanwords. ン represents n and has its own beat. Compare ン and ソ.',
  [
    Exercise('Which romaji matches ワ?', ['wo', 'wa', 'n'], 1, 'ワ → wa.'),
    Exercise('Which romaji matches ヲ?', ['n', 'wa', 'wo'], 2, 'ヲ is labelled wo to identify its spelling; it is usually pronounced o.'),
    Exercise('Which romaji matches ン?', ['n', 'wa', 'wo'], 0, 'ン → n.'),
    Exercise('Choose the katakana for wa in this lesson.', ['ヲ', 'ン', 'ワ'], 2, 'ワ → wa.'),
    Exercise('Choose the katakana for wo in this lesson.', ['ヲ', 'ン', 'ワ'], 0, 'ヲ is labelled wo to identify its spelling; it is usually pronounced o.'),
    Exercise('Choose the katakana for n in this lesson.', ['ワ', 'ン', 'ヲ'], 1, 'ン → n.'),
  ],
  section: 'Katakana basics',
);

const katakanaG = Lesson(
  'katakana-g-v1',
  'Katakana: ga to go',
  'ガ → ga\nギ → gi\nグ → gu\nゲ → ge\nゴ → go\n\nTwo small dakuten marks change the K row to g sounds: カ becomes ガ.',
  [
    Exercise('Which romaji matches ガ?', ['gi', 'ga', 'gu'], 1, 'ガ → ga.'),
    Exercise('Which romaji matches ギ?', ['gu', 'ge', 'gi'], 2, 'ギ → gi.'),
    Exercise('Which romaji matches グ?', ['gu', 'ge', 'go'], 0, 'グ → gu.'),
    Exercise('Which romaji matches ゲ?', ['go', 'ge', 'ga'], 1, 'ゲ → ge.'),
    Exercise('Which romaji matches ゴ?', ['ga', 'gi', 'go'], 2, 'ゴ → go.'),
    Exercise('Choose the katakana for ga in this lesson.', ['ギ', 'グ', 'ガ'], 2, 'ガ → ga.'),
    Exercise('Choose the katakana for gi in this lesson.', ['ギ', 'グ', 'ゲ'], 0, 'ギ → gi.'),
    Exercise('Choose the katakana for gu in this lesson.', ['ゲ', 'グ', 'ゴ'], 1, 'グ → gu.'),
    Exercise('Choose the katakana for ge in this lesson.', ['ゴ', 'ガ', 'ゲ'], 2, 'ゲ → ge.'),
    Exercise('Choose the katakana for go in this lesson.', ['ゴ', 'ガ', 'ギ'], 0, 'ゴ → go.'),
  ],
  section: 'Katakana voiced',
);

const katakanaZ = Lesson(
  'katakana-z-v1',
  'Katakana: za to zo',
  'ザ → za\nジ → ji\nズ → zu\nゼ → ze\nゾ → zo\n\nUse ji for ジ and zu for ズ. Notice the two dakuten marks.',
  [
    Exercise('Which romaji matches ザ?', ['ji', 'za', 'zu'], 1, 'ザ → za.'),
    Exercise('Which romaji matches ジ?', ['zu', 'ze', 'ji'], 2, 'ジ → ji.'),
    Exercise('Which romaji matches ズ?', ['zu', 'ze', 'zo'], 0, 'ズ → zu.'),
    Exercise('Which romaji matches ゼ?', ['zo', 'ze', 'za'], 1, 'ゼ → ze.'),
    Exercise('Which romaji matches ゾ?', ['za', 'ji', 'zo'], 2, 'ゾ → zo.'),
    Exercise('Choose the katakana for za in this lesson.', ['ジ', 'ズ', 'ザ'], 2, 'ザ → za.'),
    Exercise('Choose the katakana for ji in this lesson.', ['ジ', 'ズ', 'ゼ'], 0, 'ジ → ji.'),
    Exercise('Choose the katakana for zu in this lesson.', ['ゼ', 'ズ', 'ゾ'], 1, 'ズ → zu.'),
    Exercise('Choose the katakana for ze in this lesson.', ['ゾ', 'ザ', 'ゼ'], 2, 'ゼ → ze.'),
    Exercise('Choose the katakana for zo in this lesson.', ['ゾ', 'ザ', 'ジ'], 0, 'ゾ → zo.'),
  ],
  section: 'Katakana voiced',
);

const katakanaD = Lesson(
  'katakana-d-v1',
  'Katakana: da, ji, zu, de, do',
  'ダ → da\nヂ → ji\nヅ → zu\nデ → de\nド → do\n\nヂ and ヅ usually sound like ジ and ズ in standard Japanese. Their spellings differ. In this lesson ji and zu refer to the T-row forms ヂ and ヅ. Keyboard spellings di/du are not their usual spoken readings.',
  [
    Exercise('Which romaji matches ダ?', ['ji', 'da', 'zu'], 1, 'ダ → da.'),
    Exercise('Which romaji matches ヂ?', ['zu', 'de', 'ji'], 2, 'ヂ → ji.'),
    Exercise('Which romaji matches ヅ?', ['zu', 'de', 'do'], 0, 'ヅ → zu.'),
    Exercise('Which romaji matches デ?', ['do', 'de', 'da'], 1, 'デ → de.'),
    Exercise('Which romaji matches ド?', ['da', 'ji', 'do'], 2, 'ド → do.'),
    Exercise('Choose the katakana for da in this lesson.', ['ヂ', 'ヅ', 'ダ'], 2, 'ダ → da.'),
    Exercise('Choose the katakana for ji in this lesson.', ['ヂ', 'ヅ', 'デ'], 0, 'ヂ → ji.'),
    Exercise('Choose the katakana for zu in this lesson.', ['デ', 'ヅ', 'ド'], 1, 'ヅ → zu.'),
    Exercise('Choose the katakana for de in this lesson.', ['ド', 'ダ', 'デ'], 2, 'デ → de.'),
    Exercise('Choose the katakana for do in this lesson.', ['ド', 'ダ', 'ヂ'], 0, 'ド → do.'),
  ],
  section: 'Katakana voiced',
);

const katakanaB = Lesson(
  'katakana-b-v1',
  'Katakana: ba to bo',
  'バ → ba\nビ → bi\nブ → bu\nベ → be\nボ → bo\n\nDakuten change the H row to b sounds. ハ becomes バ.',
  [
    Exercise('Which romaji matches バ?', ['bi', 'ba', 'bu'], 1, 'バ → ba.'),
    Exercise('Which romaji matches ビ?', ['bu', 'be', 'bi'], 2, 'ビ → bi.'),
    Exercise('Which romaji matches ブ?', ['bu', 'be', 'bo'], 0, 'ブ → bu.'),
    Exercise('Which romaji matches ベ?', ['bo', 'be', 'ba'], 1, 'ベ → be.'),
    Exercise('Which romaji matches ボ?', ['ba', 'bi', 'bo'], 2, 'ボ → bo.'),
    Exercise('Choose the katakana for ba in this lesson.', ['ビ', 'ブ', 'バ'], 2, 'バ → ba.'),
    Exercise('Choose the katakana for bi in this lesson.', ['ビ', 'ブ', 'ベ'], 0, 'ビ → bi.'),
    Exercise('Choose the katakana for bu in this lesson.', ['ベ', 'ブ', 'ボ'], 1, 'ブ → bu.'),
    Exercise('Choose the katakana for be in this lesson.', ['ボ', 'バ', 'ベ'], 2, 'ベ → be.'),
    Exercise('Choose the katakana for bo in this lesson.', ['ボ', 'バ', 'ビ'], 0, 'ボ → bo.'),
  ],
  section: 'Katakana voiced',
);

const katakanaP = Lesson(
  'katakana-p-v1',
  'Katakana: pa to po',
  'パ → pa\nピ → pi\nプ → pu\nペ → pe\nポ → po\n\nThe handakuten circle changes the H row to p sounds. Compare バ and パ.',
  [
    Exercise('Which romaji matches パ?', ['pi', 'pa', 'pu'], 1, 'パ → pa.'),
    Exercise('Which romaji matches ピ?', ['pu', 'pe', 'pi'], 2, 'ピ → pi.'),
    Exercise('Which romaji matches プ?', ['pu', 'pe', 'po'], 0, 'プ → pu.'),
    Exercise('Which romaji matches ペ?', ['po', 'pe', 'pa'], 1, 'ペ → pe.'),
    Exercise('Which romaji matches ポ?', ['pa', 'pi', 'po'], 2, 'ポ → po.'),
    Exercise('Choose the katakana for pa in this lesson.', ['ピ', 'プ', 'パ'], 2, 'パ → pa.'),
    Exercise('Choose the katakana for pi in this lesson.', ['ピ', 'プ', 'ペ'], 0, 'ピ → pi.'),
    Exercise('Choose the katakana for pu in this lesson.', ['ペ', 'プ', 'ポ'], 1, 'プ → pu.'),
    Exercise('Choose the katakana for pe in this lesson.', ['ポ', 'パ', 'ペ'], 2, 'ペ → pe.'),
    Exercise('Choose the katakana for po in this lesson.', ['ポ', 'パ', 'ピ'], 0, 'ポ → po.'),
  ],
  section: 'Katakana voiced',
);

const katakanaYoonKG = Lesson(
  'katakana-yoon-kg-v1',
  'Katakana: kya and gya',
  'キャ → kya\nキュ → kyu\nキョ → kyo\nギャ → gya\nギュ → gyu\nギョ → gyo\n\nSmall ャ, ュ and ョ combine with an i-row character into one beat. キャ is kya; full-sized キヤ is ki-ya, two beats.',
  [
    Exercise('Which romaji matches キャ?', ['kyu', 'kya', 'kyo'], 1, 'キャ → kya.'),
    Exercise('Which romaji matches キュ?', ['kyo', 'gya', 'kyu'], 2, 'キュ → kyu.'),
    Exercise('Which romaji matches キョ?', ['kyo', 'gya', 'gyu'], 0, 'キョ → kyo.'),
    Exercise('Which romaji matches ギャ?', ['gyu', 'gya', 'gyo'], 1, 'ギャ → gya.'),
    Exercise('Which romaji matches ギュ?', ['gyo', 'kya', 'gyu'], 2, 'ギュ → gyu.'),
    Exercise('Which romaji matches ギョ?', ['gyo', 'kya', 'kyu'], 0, 'ギョ → gyo.'),
    Exercise('Choose the katakana for kya in this lesson.', ['キュ', 'キョ', 'キャ'], 2, 'キャ → kya.'),
    Exercise('Choose the katakana for kyu in this lesson.', ['キュ', 'キョ', 'ギャ'], 0, 'キュ → kyu.'),
    Exercise('Choose the katakana for kyo in this lesson.', ['ギャ', 'キョ', 'ギュ'], 1, 'キョ → kyo.'),
    Exercise('Choose the katakana for gya in this lesson.', ['ギュ', 'ギョ', 'ギャ'], 2, 'ギャ → gya.'),
    Exercise('Choose the katakana for gyu in this lesson.', ['ギュ', 'ギョ', 'キャ'], 0, 'ギュ → gyu.'),
    Exercise('Choose the katakana for gyo in this lesson.', ['キャ', 'ギョ', 'キュ'], 1, 'ギョ → gyo.'),
  ],
  section: 'Katakana combinations',
);

const katakanaYoonSJ = Lesson(
  'katakana-yoon-sj-v1',
  'Katakana: sha and ja',
  'シャ → sha\nシュ → shu\nショ → sho\nジャ → ja\nジュ → ju\nジョ → jo\n\nRead sha, shu, sho and ja, ju, jo. The second character must be small.',
  [
    Exercise('Which romaji matches シャ?', ['shu', 'sha', 'sho'], 1, 'シャ → sha.'),
    Exercise('Which romaji matches シュ?', ['sho', 'ja', 'shu'], 2, 'シュ → shu.'),
    Exercise('Which romaji matches ショ?', ['sho', 'ja', 'ju'], 0, 'ショ → sho.'),
    Exercise('Which romaji matches ジャ?', ['ju', 'ja', 'jo'], 1, 'ジャ → ja.'),
    Exercise('Which romaji matches ジュ?', ['jo', 'sha', 'ju'], 2, 'ジュ → ju.'),
    Exercise('Which romaji matches ジョ?', ['jo', 'sha', 'shu'], 0, 'ジョ → jo.'),
    Exercise('Choose the katakana for sha in this lesson.', ['シュ', 'ショ', 'シャ'], 2, 'シャ → sha.'),
    Exercise('Choose the katakana for shu in this lesson.', ['シュ', 'ショ', 'ジャ'], 0, 'シュ → shu.'),
    Exercise('Choose the katakana for sho in this lesson.', ['ジャ', 'ショ', 'ジュ'], 1, 'ショ → sho.'),
    Exercise('Choose the katakana for ja in this lesson.', ['ジュ', 'ジョ', 'ジャ'], 2, 'ジャ → ja.'),
    Exercise('Choose the katakana for ju in this lesson.', ['ジュ', 'ジョ', 'シャ'], 0, 'ジュ → ju.'),
    Exercise('Choose the katakana for jo in this lesson.', ['シャ', 'ジョ', 'シュ'], 1, 'ジョ → jo.'),
  ],
  section: 'Katakana combinations',
);

const katakanaYoonCD = Lesson(
  'katakana-yoon-cd-v1',
  'Katakana: cha and rare d forms',
  'チャ → cha\nチュ → chu\nチョ → cho\nヂャ → ja\nヂュ → ju\nヂョ → jo\n\nチャ, チュ and チョ are cha, chu and cho. ヂャ, ヂュ and ヂョ are rare spellings read ja, ju and jo. In this lesson ja/ju/jo refer to these rare forms; ジャ/ジュ/ジョ are normally used instead.',
  [
    Exercise('Which romaji matches チャ?', ['chu', 'cha', 'cho'], 1, 'チャ → cha.'),
    Exercise('Which romaji matches チュ?', ['cho', 'ja', 'chu'], 2, 'チュ → chu.'),
    Exercise('Which romaji matches チョ?', ['cho', 'ja', 'ju'], 0, 'チョ → cho.'),
    Exercise('Which romaji matches ヂャ?', ['ju', 'ja', 'jo'], 1, 'ヂャ → ja.'),
    Exercise('Which romaji matches ヂュ?', ['jo', 'cha', 'ju'], 2, 'ヂュ → ju.'),
    Exercise('Which romaji matches ヂョ?', ['jo', 'cha', 'chu'], 0, 'ヂョ → jo.'),
    Exercise('Choose the katakana for cha in this lesson.', ['チュ', 'チョ', 'チャ'], 2, 'チャ → cha.'),
    Exercise('Choose the katakana for chu in this lesson.', ['チュ', 'チョ', 'ヂャ'], 0, 'チュ → chu.'),
    Exercise('Choose the katakana for cho in this lesson.', ['ヂャ', 'チョ', 'ヂュ'], 1, 'チョ → cho.'),
    Exercise('Choose the katakana for ja in this lesson.', ['ヂュ', 'ヂョ', 'ヂャ'], 2, 'ヂャ → ja.'),
    Exercise('Choose the katakana for ju in this lesson.', ['ヂュ', 'ヂョ', 'チャ'], 0, 'ヂュ → ju.'),
    Exercise('Choose the katakana for jo in this lesson.', ['チャ', 'ヂョ', 'チュ'], 1, 'ヂョ → jo.'),
  ],
  section: 'Katakana combinations',
);

const katakanaYoonNH = Lesson(
  'katakana-yoon-nh-v1',
  'Katakana: nya and hya',
  'ニャ → nya\nニュ → nyu\nニョ → nyo\nヒャ → hya\nヒュ → hyu\nヒョ → hyo\n\nCombine ニ or ヒ with small ャ, ュ or ョ. Each combination has one beat.',
  [
    Exercise('Which romaji matches ニャ?', ['nyu', 'nya', 'nyo'], 1, 'ニャ → nya.'),
    Exercise('Which romaji matches ニュ?', ['nyo', 'hya', 'nyu'], 2, 'ニュ → nyu.'),
    Exercise('Which romaji matches ニョ?', ['nyo', 'hya', 'hyu'], 0, 'ニョ → nyo.'),
    Exercise('Which romaji matches ヒャ?', ['hyu', 'hya', 'hyo'], 1, 'ヒャ → hya.'),
    Exercise('Which romaji matches ヒュ?', ['hyo', 'nya', 'hyu'], 2, 'ヒュ → hyu.'),
    Exercise('Which romaji matches ヒョ?', ['hyo', 'nya', 'nyu'], 0, 'ヒョ → hyo.'),
    Exercise('Choose the katakana for nya in this lesson.', ['ニュ', 'ニョ', 'ニャ'], 2, 'ニャ → nya.'),
    Exercise('Choose the katakana for nyu in this lesson.', ['ニュ', 'ニョ', 'ヒャ'], 0, 'ニュ → nyu.'),
    Exercise('Choose the katakana for nyo in this lesson.', ['ヒャ', 'ニョ', 'ヒュ'], 1, 'ニョ → nyo.'),
    Exercise('Choose the katakana for hya in this lesson.', ['ヒュ', 'ヒョ', 'ヒャ'], 2, 'ヒャ → hya.'),
    Exercise('Choose the katakana for hyu in this lesson.', ['ヒュ', 'ヒョ', 'ニャ'], 0, 'ヒュ → hyu.'),
    Exercise('Choose the katakana for hyo in this lesson.', ['ニャ', 'ヒョ', 'ニュ'], 1, 'ヒョ → hyo.'),
  ],
  section: 'Katakana combinations',
);

const katakanaYoonMR = Lesson(
  'katakana-yoon-mr-v1',
  'Katakana: mya and rya',
  'ミャ → mya\nミュ → myu\nミョ → myo\nリャ → rya\nリュ → ryu\nリョ → ryo\n\nCombine ミ or リ with small ャ, ュ or ョ. Keep the second character small.',
  [
    Exercise('Which romaji matches ミャ?', ['myu', 'mya', 'myo'], 1, 'ミャ → mya.'),
    Exercise('Which romaji matches ミュ?', ['myo', 'rya', 'myu'], 2, 'ミュ → myu.'),
    Exercise('Which romaji matches ミョ?', ['myo', 'rya', 'ryu'], 0, 'ミョ → myo.'),
    Exercise('Which romaji matches リャ?', ['ryu', 'rya', 'ryo'], 1, 'リャ → rya.'),
    Exercise('Which romaji matches リュ?', ['ryo', 'mya', 'ryu'], 2, 'リュ → ryu.'),
    Exercise('Which romaji matches リョ?', ['ryo', 'mya', 'myu'], 0, 'リョ → ryo.'),
    Exercise('Choose the katakana for mya in this lesson.', ['ミュ', 'ミョ', 'ミャ'], 2, 'ミャ → mya.'),
    Exercise('Choose the katakana for myu in this lesson.', ['ミュ', 'ミョ', 'リャ'], 0, 'ミュ → myu.'),
    Exercise('Choose the katakana for myo in this lesson.', ['リャ', 'ミョ', 'リュ'], 1, 'ミョ → myo.'),
    Exercise('Choose the katakana for rya in this lesson.', ['リュ', 'リョ', 'リャ'], 2, 'リャ → rya.'),
    Exercise('Choose the katakana for ryu in this lesson.', ['リュ', 'リョ', 'ミャ'], 0, 'リュ → ryu.'),
    Exercise('Choose the katakana for ryo in this lesson.', ['ミャ', 'リョ', 'ミュ'], 1, 'リョ → ryo.'),
  ],
  section: 'Katakana combinations',
);

const katakanaYoonBP = Lesson(
  'katakana-yoon-bp-v1',
  'Katakana: bya and pya',
  'ビャ → bya\nビュ → byu\nビョ → byo\nピャ → pya\nピュ → pyu\nピョ → pyo\n\nDakuten in ビ and the circle in ピ distinguish b from p. Add small ャ, ュ or ョ.',
  [
    Exercise('Which romaji matches ビャ?', ['byu', 'bya', 'byo'], 1, 'ビャ → bya.'),
    Exercise('Which romaji matches ビュ?', ['byo', 'pya', 'byu'], 2, 'ビュ → byu.'),
    Exercise('Which romaji matches ビョ?', ['byo', 'pya', 'pyu'], 0, 'ビョ → byo.'),
    Exercise('Which romaji matches ピャ?', ['pyu', 'pya', 'pyo'], 1, 'ピャ → pya.'),
    Exercise('Which romaji matches ピュ?', ['pyo', 'bya', 'pyu'], 2, 'ピュ → pyu.'),
    Exercise('Which romaji matches ピョ?', ['pyo', 'bya', 'byu'], 0, 'ピョ → pyo.'),
    Exercise('Choose the katakana for bya in this lesson.', ['ビュ', 'ビョ', 'ビャ'], 2, 'ビャ → bya.'),
    Exercise('Choose the katakana for byu in this lesson.', ['ビュ', 'ビョ', 'ピャ'], 0, 'ビュ → byu.'),
    Exercise('Choose the katakana for byo in this lesson.', ['ピャ', 'ビョ', 'ピュ'], 1, 'ビョ → byo.'),
    Exercise('Choose the katakana for pya in this lesson.', ['ピュ', 'ピョ', 'ピャ'], 2, 'ピャ → pya.'),
    Exercise('Choose the katakana for pyu in this lesson.', ['ピュ', 'ピョ', 'ビャ'], 0, 'ピュ → pyu.'),
    Exercise('Choose the katakana for pyo in this lesson.', ['ビャ', 'ピョ', 'ビュ'], 1, 'ピョ → pyo.'),
  ],
  section: 'Katakana combinations',
);

const katakanaF = Lesson(
  'katakana-loan-f-v1',
  'Loanwords: fa, fi, fe, fo',
  'ファ → fa\nフィ → fi\nフェ → fe\nフォ → fo\n\nSmall vowels combine with フ: ファ, フィ, フェ, フォ. These are fa, fi, fe, fo, not two full-sized sounds. フ alone remains fu.',
  [
    Exercise('Which romaji matches ファ?', ['fi', 'fa', 'fe'], 1, 'ファ → fa.'),
    Exercise('Which romaji matches フィ?', ['fe', 'fo', 'fi'], 2, 'フィ → fi.'),
    Exercise('Which romaji matches フェ?', ['fe', 'fo', 'fa'], 0, 'フェ → fe.'),
    Exercise('Which romaji matches フォ?', ['fa', 'fo', 'fi'], 1, 'フォ → fo.'),
    Exercise('Choose the katakana for fa in this lesson.', ['フィ', 'フェ', 'ファ'], 2, 'ファ → fa.'),
    Exercise('Choose the katakana for fi in this lesson.', ['フィ', 'フェ', 'フォ'], 0, 'フィ → fi.'),
    Exercise('Choose the katakana for fe in this lesson.', ['フォ', 'フェ', 'ファ'], 1, 'フェ → fe.'),
    Exercise('Choose the katakana for fo in this lesson.', ['ファ', 'フィ', 'フォ'], 2, 'フォ → fo.'),
  ],
  section: 'Katakana loanwords',
);

const katakanaTD = Lesson(
  'katakana-loan-td-v1',
  'Loanwords: ti, di, tu, du',
  'ティ → ti\nディ → di\nトゥ → tu\nドゥ → du\n\nSmall ィ and ゥ form these loanword combinations. ティ is ti, while チ is chi. トゥ is tu, while ツ is tsu. Spoken readings and keyboard input sequences are not always the same.',
  [
    Exercise('Which romaji matches ティ?', ['di', 'ti', 'tu'], 1, 'ティ → ti.'),
    Exercise('Which romaji matches ディ?', ['tu', 'du', 'di'], 2, 'ディ → di.'),
    Exercise('Which romaji matches トゥ?', ['tu', 'du', 'ti'], 0, 'トゥ → tu.'),
    Exercise('Which romaji matches ドゥ?', ['ti', 'du', 'di'], 1, 'ドゥ → du.'),
    Exercise('Choose the katakana for ti in this lesson.', ['ディ', 'トゥ', 'ティ'], 2, 'ティ → ti.'),
    Exercise('Choose the katakana for di in this lesson.', ['ディ', 'トゥ', 'ドゥ'], 0, 'ディ → di.'),
    Exercise('Choose the katakana for tu in this lesson.', ['ドゥ', 'トゥ', 'ティ'], 1, 'トゥ → tu.'),
    Exercise('Choose the katakana for du in this lesson.', ['ティ', 'ディ', 'ドゥ'], 2, 'ドゥ → du.'),
  ],
  section: 'Katakana loanwords',
);

const katakanaE = Lesson(
  'katakana-loan-e-v1',
  'Loanwords: she, je, che, ye',
  'シェ → she\nジェ → je\nチェ → che\nイェ → ye\n\nSmall ェ changes these combinations to she, je, che and ye. シェ is different from シ and シャ.',
  [
    Exercise('Which romaji matches シェ?', ['je', 'she', 'che'], 1, 'シェ → she.'),
    Exercise('Which romaji matches ジェ?', ['che', 'ye', 'je'], 2, 'ジェ → je.'),
    Exercise('Which romaji matches チェ?', ['che', 'ye', 'she'], 0, 'チェ → che.'),
    Exercise('Which romaji matches イェ?', ['she', 'ye', 'je'], 1, 'イェ → ye.'),
    Exercise('Choose the katakana for she in this lesson.', ['ジェ', 'チェ', 'シェ'], 2, 'シェ → she.'),
    Exercise('Choose the katakana for je in this lesson.', ['ジェ', 'チェ', 'イェ'], 0, 'ジェ → je.'),
    Exercise('Choose the katakana for che in this lesson.', ['イェ', 'チェ', 'シェ'], 1, 'チェ → che.'),
    Exercise('Choose the katakana for ye in this lesson.', ['シェ', 'ジェ', 'イェ'], 2, 'イェ → ye.'),
  ],
  section: 'Katakana loanwords',
);

const katakanaShapes = Lesson(
  'katakana-shapes-v1',
  'Katakana: similar shapes',
  'Compare シ (shi) with ツ (tsu), and ソ (so) with ン (n). Look carefully at how the short strokes and long stroke are arranged. Also compare ク (ku) with ケ (ke). Fonts can change their appearance; this lesson practises recognition, not handwriting.',
  [
    Exercise('Choose shi.', ['シ', 'ツ', 'ソ'], 0, 'シ is shi; ツ is tsu.'),
    Exercise('Choose tsu.', ['シ', 'ン', 'ツ'], 2, 'ツ is full-sized tsu.'),
    Exercise('Choose so.', ['ン', 'ソ', 'シ'], 1, 'ソ is so; ン is n.'),
    Exercise('Choose n.', ['ン', 'ソ', 'ツ'], 0, 'ン is n and has its own beat.'),
    Exercise('Choose ku.', ['ケ', 'ク', 'ワ'], 1, 'ク is ku; ケ is ke.'),
    Exercise('Choose ke.', ['ク', 'ワ', 'ケ'], 2, 'ケ is ke. Compare it with ク.'),
  ],
  section: 'Katakana reading rules',
);

const katakanaLength = Lesson(
  'katakana-length-v1',
  'Katakana: ー and small ッ',
  'The mark ー usually lengthens the preceding vowel by one beat: カー is kaa and キー is kii. Small ッ adds a consonant beat: カップ is kappu. It is different from full-sized ツ (tsu). We write long vowels as aa, ii, uu, ee and oo in these exercises.',
  [
    Exercise('Read カー.', ['ka', 'kaa', 'katsu'], 1, 'ー lengthens the a sound: kaa.'),
    Exercise('Read キー.', ['kii', 'ki', 'kitsu'], 0, 'ー lengthens the i sound: kii.'),
    Exercise('Read クー.', ['ku', 'kutsu', 'kuu'], 2, 'ー lengthens the u sound: kuu.'),
    Exercise('Read ケー.', ['ke', 'kee', 'kei as two separate vowels'], 1, 'ー lengthens the e sound: kee.'),
    Exercise('Read コー.', ['koo', 'ko', 'kotsu'], 0, 'ー lengthens the o sound: koo.'),
    Exercise('Read カップ.', ['kapu', 'katsupu', 'kappu'], 2, 'Small ッ gives the extra p beat in kappu.'),
    Exercise('Which spelling is kitto?', ['キット', 'キツト', 'キト'], 0, 'キット contains small ッ. Full-sized ツ would be tsu.'),
    Exercise('How many beats are in カップ?', ['Two', 'Three', 'Four'], 1, 'カ・ッ・プ has three beats.'),
  ],
  section: 'Katakana reading rules',
);

const katakanaReading = Lesson(
  'katakana-reading-v1',
  'Katakana reading checkpoint',
  'Read familiar loanwords using marks, small characters and vowel length. Read the Japanese spelling rather than guessing from English. Romaji doubles vowels to show ー in this checkpoint.',
  [
    Exercise('Read カメラ.', ['kamura', 'kamera', 'kemara'], 1, 'カ・メ・ラ is kamera.'),
    Exercise('Read テレビ.', ['terebi', 'terepi', 'terabi'], 0, 'ビ has dakuten: terebi.'),
    Exercise('Read コーヒー.', ['kohi', 'koohii', 'koohi'], 1, 'Both ー marks lengthen a vowel: koohii.'),
    Exercise('Read バッグ.', ['bagu', 'bakku', 'baggu'], 2, 'Small ッ and dakuten in グ produce baggu.'),
    Exercise('Read シャツ.', ['shatsu', 'shiyatsu', 'satsu'], 0, 'シャ is sha and ツ is tsu: shatsu.'),
    Exercise('Read フィルム.', ['furumu', 'firumu', 'fuirumu'], 1, 'フィ is the loanword combination fi.'),
    Exercise('Read パーティー.', ['patii', 'paatii', 'baatii'], 1, 'パ has a circle; ー marks length; ティ is ti: paatii.'),
    Exercise('Choose the spelling for chokoreeto.', ['チョコレト', 'チヨコレート', 'チョコレート'], 2, 'チョ is cho and レー is ree: chokoreeto.'),
  ],
  section: 'Katakana reading rules',
);

const katakanaLessons = [
  katakanaVowels,
  katakanaK,
  katakanaS,
  katakanaT,
  katakanaN,
  katakanaH,
  katakanaM,
  katakanaY,
  katakanaR,
  katakanaWN,
  katakanaG,
  katakanaZ,
  katakanaD,
  katakanaB,
  katakanaP,
  katakanaYoonKG,
  katakanaYoonSJ,
  katakanaYoonCD,
  katakanaYoonNH,
  katakanaYoonMR,
  katakanaYoonBP,
  katakanaF,
  katakanaTD,
  katakanaE,
  katakanaShapes,
  katakanaLength,
  katakanaReading,
];
