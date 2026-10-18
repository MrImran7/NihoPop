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
  @override
  Widget build(BuildContext context) {
    final done = widget.store.completed(greetings.id);
    return Scaffold(
      appBar: AppBar(title: const Text('NihoPop')),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('A little Japanese, every day.',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Learn through English • Practice offline'),
          const SizedBox(height: 32),
          Card(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('LESSON 01'),
              const SizedBox(height: 12),
              Text(greetings.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(done
                  ? 'Completed • Best: ${widget.store.best(greetings.id)}/${greetings.exercises.length}'
                  : 'Four questions • Japanese ↔ English'),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) => LessonPage(store: widget.store),
                  ));
                  if (mounted) setState(() {});
                },
                child: Text(done ? 'Practice again' : 'Start lesson'),
              ),
            ]),
          )),
          const SizedBox(height: 24),
          const Text('Your progress stays on this device. Uninstalling or clearing app data removes it.'),
        ],
      )),
    );
  }
}

class LessonPage extends StatefulWidget {
  final ProgressStore store;
  const LessonPage({super.key, required this.store});
  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final session = LessonSession(greetings);
  bool started = false;
  int? selected;
  bool saving = false;
  bool saved = false;
  String? saveError;

  Future<void> save() async {
    setState(() { saving = true; saveError = null; });
    try {
      await widget.store.record(greetings.id, session.correct);
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
      appBar: AppBar(title: Text(greetings.title)),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          if (!started) ...[
            const Text('Before you begin', style: TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            Text(greetings.introduction, style: const TextStyle(fontSize: 20, height: 1.6)),
            const SizedBox(height: 28),
            FilledButton(
              onPressed: () => setState(() { started = true; }),
              child: const Text('Let’s practice'),
            ),
          ] else if (session.finished) ...[
            const Icon(Icons.celebration_outlined, size: 64),
            const SizedBox(height: 20),
            const Text('Lesson complete!', style: TextStyle(fontSize: 28)),
            Text('${session.correct} of ${greetings.exercises.length} correct'),
            const SizedBox(height: 20),
            Text(saved ? 'Progress saved on this device.' : saving ? 'Saving progress…' : saveError ?? ''),
            if (saveError != null)
              FilledButton(onPressed: saving ? null : save, child: const Text('Retry saving')),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: saving ? null : () => Navigator.of(context).pop(),
              child: const Text('Back to lessons'),
            ),
          ] else ...[
            LinearProgressIndicator(value: session.index / greetings.exercises.length),
            const SizedBox(height: 12),
            Text('Question ${session.index + 1} of ${greetings.exercises.length}'),
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
                  setState(() { session.next(); selected = null; });
                  if (session.finished) save();
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
