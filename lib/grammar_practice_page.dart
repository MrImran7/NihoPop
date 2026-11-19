import 'package:flutter/material.dart';
import 'grammar_practice.dart';
import 'lesson.dart';

class GrammarPracticePage extends StatefulWidget {
  final GrammarPracticeStore store;
  final Future<void> Function(List<GrammarQuestion>, bool) onStart;
  const GrammarPracticePage({super.key, required this.store, required this.onStart});

  @override
  State<GrammarPracticePage> createState() => _GrammarPracticePageState();
}

class _GrammarPracticePageState extends State<GrammarPracticePage> {
  bool opening = false;
  Set<String>? selectedTopics;

  Future<void> chooseTopics() async {
    final lessons = widget.store.available.map((q) => q.lesson).toSet().toList();
    final result = await Navigator.of(context).push<Set<String>>(MaterialPageRoute(
      builder: (_) => GrammarTopicPicker(
        lessons: lessons,
        selected: selectedTopics ?? lessons.map((l) => l.id).toSet(),
      ),
    ));
    if (result != null && mounted) {
      setState(() {
        selectedTopics = result.length == lessons.length ? null : result;
      });
    }
  }

  Future<void> start(bool review) async {
    if (opening) return;
    final questions = review ? widget.store.review(lessonIds: selectedTopics)
        : widget.store.mixed(lessonIds: selectedTopics);
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
    final selectedQuestions = widget.store.questionsFor(selectedTopics);
    final reviewCount = widget.store.mistakesFor(selectedTopics).length;
    final selectedCount = selectedQuestions.map((q) => q.lesson.id).toSet().length;
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
          Text(selectedTopics == null ? 'All completed topics' : '$selectedCount of $topics topics selected'),
          OutlinedButton(
            key: const ValueKey('choose-grammar-topics'),
            onPressed: available.isEmpty || opening ? null : chooseTopics,
            child: const Text('Choose topics'),
          ),
          const Text('Topic selection applies to mixed practice and saved-mistake review. '
              'It stays while this practice page is open; reopening starts with all completed topics.'),
          const SizedBox(height: 12),
          if (available.isNotEmpty && selectedQuestions.isEmpty)
            const Text('Select at least one topic to start practice.'),
          if (available.isEmpty)
            const Text('Complete a grammar lesson first, then return here to practise.'),
          FilledButton(
            key: const ValueKey('start-grammar-mix'),
            onPressed: selectedQuestions.isEmpty || opening ? null : () => start(false),
            child: const Text('Start mixed practice'),
          ),
          const SizedBox(height: 32),
          Text('Saved mistakes: $count', style: Theme.of(context).textTheme.titleLarge),
          if (selectedTopics != null)
            Text('$reviewCount in selected topics. Other saved mistakes are kept.'),
          const SizedBox(height: 12),
          const Text('Missed questions from completed practice sessions stay on this device. '
              'Correct them in a later completed session to remove them. '
              'Mistakes from regular lessons are reviewed within those lessons.'),
          const SizedBox(height: 12),
          OutlinedButton(
            key: const ValueKey('review-grammar-mistakes'),
            onPressed: reviewCount == 0 || opening ? null : () => start(true),
            child: const Text('Review saved mistakes'),
          ),
          if (count == 0) const Text('No saved practice mistakes to review.'),
          if (count > 0 && reviewCount == 0)
            const Text('No saved mistakes in these topics. Choose other topics to review them.'),
          const SizedBox(height: 24),
          const Text('Leaving a session early keeps your previous saved mistakes unchanged. '
              'Uninstalling or clearing app data removes local practice history.'),
        ],
      )),
    );
  }
}

class GrammarTopicPicker extends StatefulWidget {
  final List<Lesson> lessons;
  final Set<String> selected;
  const GrammarTopicPicker({super.key, required this.lessons, required this.selected});
  @override
  State<GrammarTopicPicker> createState() => _GrammarTopicPickerState();
}

class _GrammarTopicPickerState extends State<GrammarTopicPicker> {
  late final Set<String> selected = {...widget.selected};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose topics')),
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Text('${selected.length} topics selected'),
            Wrap(spacing: 16, children: [
              TextButton(
                key: const ValueKey('select-all-topics'),
                onPressed: () => setState(() {
                  selected.addAll(widget.lessons.map((l) => l.id));
                }),
                child: const Text('Select all'),
              ),
              TextButton(
                key: const ValueKey('clear-topics'),
                onPressed: () => setState(selected.clear),
                child: const Text('Clear selection'),
              ),
            ]),
          ]),
        ),
        Expanded(child: ListView(children: [
          for (final lesson in widget.lessons)
            CheckboxListTile(
              key: ValueKey('practice-topic-${lesson.id}'),
              title: Text(lesson.title),
              value: selected.contains(lesson.id),
              onChanged: (value) => setState(() {
                if (value == true) { selected.add(lesson.id); }
                else { selected.remove(lesson.id); }
              }),
            ),
        ])),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            key: const ValueKey('apply-grammar-topics'),
            onPressed: () => Navigator.of(context).pop(Set<String>.from(selected)),
            child: const Text('Apply topics'),
          ),
        ),
      ])),
    );
  }
}
