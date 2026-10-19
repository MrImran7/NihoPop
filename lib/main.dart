import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lesson.dart';
import 'progress.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final preferences = await SharedPreferences.getInstance();
    runApp(NihoPopApp(store: ProgressStore(preferences)));
  } catch (_) {
    runApp(const MaterialApp(
      home: Scaffold(body: Center(child: Text(
        'Could not open local progress. Please close and reopen NihoPop.',
        textAlign: TextAlign.center,
      ))),
    ));
  }
}

class NihoPopApp extends StatelessWidget {
  final ProgressStore store;
  const NihoPopApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NihoPop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6350B7)),
        scaffoldBackgroundColor: const Color(0xFFFAF8FF),
      ),
      home: HomePage(store: store),
    );
  }
}

class HomePage extends StatefulWidget {
  final ProgressStore store;
  const HomePage({super.key, required this.store});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String section = 'All lessons';

  @override
  Widget build(BuildContext context) {
    final visible = lessons.where((lesson) =>
        section == 'All lessons' || lesson.section == section).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('NihoPop')),
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 8),
          child: DropdownButtonFormField<String>(
            key: const ValueKey('lesson-group'),
            value: section,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Lesson group', border: OutlineInputBorder()),
            items: [
              for (final group in lessonSections)
                DropdownMenuItem(value: group, child: Text(group)),
            ],
            onChanged: (value) {
              if (value != null) setState(() { section = value; });
            },
          ),
        ),
        Expanded(child: ListView(
          key: ValueKey(section),
          padding: const EdgeInsets.all(24),
          children: [
            const Text('A little Japanese, every day.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Learn through English • Practice offline'),
            const SizedBox(height: 24),
            for (final lesson in visible)
              Card(key: ValueKey('lesson-${lesson.id}'), child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('LESSON ${lessons.indexOf(lesson) + 1}'),
                  const SizedBox(height: 12),
                  Text(lesson.title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 12),
                  Text(widget.store.completed(lesson.id)
                      ? 'Completed • Best: ${widget.store.best(lesson.id)}/${lesson.exercises.length}'
                      : '${lesson.exercises.length} questions • ${lesson == greetings ? "Japanese ↔ English" : lesson.section == "Reading rules" ? "Reading practice" : "Hiragana ↔ Romaji"}'),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () async {
                      await Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (_) => LessonPage(store: widget.store, lesson: lesson),
                      ));
                      if (mounted) setState(() {});
                    },
                    child: Text(widget.store.completed(lesson.id) ? 'Practice again' : 'Start lesson'),
                  ),
                ]),
              )),
            const SizedBox(height: 24),
            const Text('Your progress stays on this device. Uninstalling or clearing app data removes it.'),
          ],
        )),
      ])),
    );
  }
}

class LessonPage extends StatefulWidget {
  final ProgressStore store;
  final Lesson lesson;
  const LessonPage({super.key, required this.store, required this.lesson});
  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late LessonSession session;
  bool reviewing = false;
  int? lessonScore;
  final scroll = ScrollController();

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    session = LessonSession(widget.lesson);
  }
  bool started = false;
  int? selected;
  bool saving = false;
  bool saved = false;
  String? saveError;

  void reviewMistakes() {
    if (!saved || session.mistakes.isEmpty) return;
    final missed = session.mistakes;
    scroll.jumpTo(0);
    setState(() {
      lessonScore ??= session.correct;
      reviewing = true;
      selected = null;
      session = LessonSession(Lesson(
        widget.lesson.id, widget.lesson.title, '', missed,
        section: widget.lesson.section,
      ));
    });
  }

  Future<void> save() async {
    setState(() { saving = true; saveError = null; });
    try {
      await widget.store.record(widget.lesson.id, session.correct);
      if (mounted) setState(() { saved = true; });
    } catch (_) {
      if (mounted) setState(() {
        saveError = 'Progress could not be saved. Please try again.';
      });
    } finally {
      if (mounted) setState(() { saving = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: SafeArea(child: ListView(
        controller: scroll,
        padding: const EdgeInsets.all(24),
        children: [
          if (!started) ...[
            const Text('Before you begin', style: TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            Text(widget.lesson.introduction, style: const TextStyle(fontSize: 20, height: 1.6)),
            const SizedBox(height: 28),
            FilledButton(
              onPressed: () {
                scroll.jumpTo(0);
                setState(() { started = true; });
              },
              child: const Text('Let’s practice'),
            ),
          ] else if (session.finished) ...[
            const Icon(Icons.celebration_outlined, size: 64),
            const SizedBox(height: 20),
            Text(reviewing ? 'Review complete!' : 'Lesson complete!', style: const TextStyle(fontSize: 28)),
            Text('${session.correct} of ${session.lesson.exercises.length} correct'),
            const SizedBox(height: 20),
            if (reviewing)
              Text('Lesson score: $lessonScore/${widget.lesson.exercises.length}. Review does not change your saved best.')
            else
              Text(saved ? 'Progress saved on this device.' : saving ? 'Saving progress…' : saveError ?? ''),
            if (saved && session.mistakes.isNotEmpty) ...[
              const SizedBox(height: 16),
              FilledButton(
                onPressed: reviewMistakes,
                child: Text(reviewing ? 'Review remaining mistakes' : 'Review mistakes'),
              ),
            ],
            if (reviewing && session.mistakes.isEmpty)
              const Text('You corrected every question in this review.'),
            if (saveError != null)
              FilledButton(onPressed: saving ? null : save, child: const Text('Retry saving')),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: saving ? null : () => Navigator.of(context).pop(),
              child: const Text('Back to lessons'),
            ),
          ] else ...[
            LinearProgressIndicator(value: session.index / session.lesson.exercises.length),
            const SizedBox(height: 12),
            if (reviewing) const Text('Mistake review'),
            Text('Question ${session.index + 1} of ${session.lesson.exercises.length}'),
            const SizedBox(height: 28),
            Text(session.current.prompt, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 24),
            for (var i = 0; i < session.current.choices.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: selected == i ? const Color(0xFFE7DFFF) : null,
                    padding: const EdgeInsets.all(18),
                  ),
                  onPressed: session.answered ? null : () => setState(() { selected = i; }),
                  child: Text(session.current.choices[i], style: const TextStyle(fontSize: 20)),
                ),
              ),
            if (session.answered) ...[
              Semantics(liveRegion: true, child: Text(
                session.lastCorrect! ? 'Correct!' : 'Keep learning — here’s why:',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 8),
              Text(session.current.explanation),
              const SizedBox(height: 20),
            ],
            FilledButton(
              onPressed: selected == null ? null : () {
                if (!session.answered) {
                  setState(() { session.submit(selected!); });
                } else {
                  scroll.jumpTo(0);
                  setState(() { session.next(); selected = null; });
                  if (session.finished && !reviewing) save();
                }
              },
              child: Text(session.answered ? 'Continue' : 'Check answer'),
            ),
          ],
        ],
      )),
    );
  }
}
