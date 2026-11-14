import 'package:flutter/material.dart';
import 'grammar_practice.dart';

class GrammarPracticePage extends StatefulWidget {
  final GrammarPracticeStore store;
  final Future<void> Function(List<GrammarQuestion>, bool) onStart;
  const GrammarPracticePage({super.key, required this.store, required this.onStart});

  @override
  State<GrammarPracticePage> createState() => _GrammarPracticePageState();
}

class _GrammarPracticePageState extends State<GrammarPracticePage> {
  bool opening = false;

  Future<void> start(bool review) async {
    if (opening) return;
    final questions = review ? widget.store.review() : widget.store.mixed();
    if (questions.isEmpty) return;
    setState(() { opening = true; });
    try {
      await widget.onStart(questions, review);
    } finally {
      if (mounted) setState(() { opening = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final available = widget.store.available;
    final count = widget.store.mistakes.length;
    final topics = available.map((q) => q.lesson.id).toSet().length;
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar practice')),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Mix what you have learned', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Text('$topics completed grammar lessons available'),
          const SizedBox(height: 12),
          const Text('Practise up to 10 questions from completed grammar lessons. '
              'Mixed sessions spread questions across topics. Lesson best scores and completion stay unchanged.'),
          const SizedBox(height: 20),
          if (available.isEmpty)
            const Text('Complete a grammar lesson first, then return here to practise.'),
          FilledButton(
            key: const ValueKey('start-grammar-mix'),
            onPressed: available.isEmpty || opening ? null : () => start(false),
            child: const Text('Start mixed practice'),
          ),
          const SizedBox(height: 32),
          Text('Saved mistakes: $count', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          const Text('Missed questions from completed practice sessions stay on this device. '
              'Correct them in a later completed session to remove them. '
              'Mistakes from regular lessons are reviewed within those lessons.'),
          const SizedBox(height: 12),
          OutlinedButton(
            key: const ValueKey('review-grammar-mistakes'),
            onPressed: count == 0 || opening ? null : () => start(true),
            child: const Text('Review saved mistakes'),
          ),
          if (count == 0) const Text('No saved practice mistakes to review.'),
          const SizedBox(height: 24),
          const Text('Leaving a session early keeps your previous saved mistakes unchanged. '
              'Uninstalling or clearing app data removes local practice history.'),
        ],
      )),
    );
  }
}
