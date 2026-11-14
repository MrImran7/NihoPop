import 'package:flutter/material.dart';
import 'lesson.dart';
import 'flashcards.dart';
import 'vocabulary_words.dart';
import 'saved_words.dart';

class WordBankPage extends StatefulWidget {
  final ValueChanged<Lesson> onOpenLesson;
  final SavedWordsStore savedWords;
  const WordBankPage({super.key, required this.onOpenLesson, required this.savedWords});

  @override
  State<WordBankPage> createState() => _WordBankPageState();
}

class _WordBankPageState extends State<WordBankPage> {
  final search = TextEditingController();
  String? lessonId;
  bool savedOnly = false;
  String? savingId;

  Future<void> toggleSaved(VocabularyWord word) async {
    if (savingId != null) return;
    setState(() { savingId = word.id; });
    try {
      await widget.savedWords.setSaved(word, !widget.savedWords.contains(word));
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Could not update saved words. Please try again.'),
        ));
      }
    } finally {
      if (mounted) setState(() { savingId = null; });
    }
  }


  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final words = searchVocabulary(search.text, lessonId: lessonId)
        .where((word) => !savedOnly || widget.savedWords.contains(word)).toList();
    final filtered = search.text.isNotEmpty || lessonId != null || savedOnly;
    return Scaffold(
      appBar: AppBar(title: const Text('Word bank')),
      body: SafeArea(child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Look up the words you learn in NihoPop.'),
          const SizedBox(height: 16),
          TextField(
            key: const ValueKey('word-search'),
            controller: search,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Search words',
              hintText: 'Kanji, kana or English',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: search.text.isEmpty ? null : IconButton(
                tooltip: 'Clear search',
                onPressed: () => setState(search.clear),
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            key: const ValueKey('word-topic'),
            value: lessonId ?? '',
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Topic', border: OutlineInputBorder()),
            items: [
              const DropdownMenuItem(value: '', child: Text('All topics')),
              for (final lesson in vocabularyLessons)
                DropdownMenuItem(
                  value: lesson.id,
                  child: Text(lesson.title.replaceFirst('Vocabulary: ', '')),
                ),
            ],
            onChanged: (value) => setState(() {
              lessonId = value == '' ? null : value;
            }),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: FilterChip(
              key: const ValueKey('saved-only'),
              label: const Text('Saved words only'),
              selected: savedOnly,
              onSelected: (value) => setState(() { savedOnly = value; }),
            ),
          ),
          Semantics(liveRegion: true, child: Text(
            '${words.length} ${words.length == 1 ? 'word' : 'words'}',
            key: const ValueKey('word-count'),
          )),
          const SizedBox(height: 12),
          FilledButton.icon(
            key: const ValueKey('start-flashcards'),
            onPressed: words.isEmpty ? null : () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (_) => FlashcardsPage(words: words),
              ));
            },
            icon: const Icon(Icons.style_outlined),
            label: const Text('Practise flashcards'),
          ),
          if (filtered)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => setState(() {
                  search.clear();
                  lessonId = null;
                  savedOnly = false;
                }),
                child: const Text('Reset filters'),
              ),
            ),
          if (words.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(savedOnly
                  ? 'No saved words match these filters. Reset filters to find and save words.'
                  : 'No matching words. Try another spelling or reset the filters.'),
            ),
          for (final word in words)
            Card(
              key: ValueKey('word-${word.lesson.id}-${word.japanese}'),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(word.label,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text(word.meaning,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(word.topic),
                    TextButton.icon(
                      key: ValueKey('save-${word.id}'),
                      onPressed: savingId != null ? null : () => toggleSaved(word),
                      icon: Icon(widget.savedWords.contains(word)
                          ? Icons.bookmark : Icons.bookmark_border),
                      label: Text(savingId == word.id ? 'Saving…'
                          : widget.savedWords.contains(word) ? 'Remove saved word' : 'Save word'),
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        widget.onOpenLesson(word.lesson);
                      },
                      icon: const Icon(Icons.school_outlined),
                      label: const Text('Open lesson'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      )),
    );
  }
}
