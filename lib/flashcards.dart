import 'package:flutter/material.dart';
import 'vocabulary_words.dart';

class FlashcardsPage extends StatefulWidget {
  final List<VocabularyWord> words;
  FlashcardsPage({super.key, required List<VocabularyWord> words})
      : words = List.unmodifiable(words);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  final scroll = ScrollController();
  int index = 0;
  bool revealed = false;
  bool japaneseFirst = true;

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  void next() {
    if (!revealed || index >= widget.words.length) return;
    scroll.jumpTo(0);
    setState(() {
      index++;
      revealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final finished = index >= widget.words.length;
    final word = finished ? null : widget.words[index];
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: SafeArea(child: ListView(
        controller: scroll,
        padding: const EdgeInsets.all(24),
        children: [
          if (widget.words.isEmpty) ...[
            const Text('No words to practise. Change your word-bank filters.'),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back to word bank'),
            ),
          ] else if (finished) ...[
            const Text('Practice complete!', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 16),
            Text('You reviewed ${widget.words.length} ${widget.words.length == 1 ? 'card' : 'cards'}.'),
            const Text('This practice does not change lesson scores or completion.'),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                scroll.jumpTo(0);
                setState(() { index = 0; revealed = false; });
              },
              child: const Text('Practise again'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back to word bank'),
            ),
          ] else ...[
            DropdownButtonFormField<bool>(
              key: const ValueKey('flashcard-direction'),
              value: japaneseFirst,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Direction', border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: true, child: Text('Japanese → English')),
                DropdownMenuItem(value: false, child: Text('English → Japanese')),
              ],
              onChanged: (value) {
                if (value != null && value != japaneseFirst) {
                  setState(() { japaneseFirst = value; revealed = false; });
                }
              },
            ),
            const SizedBox(height: 24),
            Text('Card ${index + 1} of ${widget.words.length}'),
            const SizedBox(height: 12),
            Text(word!.topic),
            const SizedBox(height: 16),
            Text(
              japaneseFirst ? word.label : word.meaning,
              key: const ValueKey('flashcard-prompt'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            if (!revealed)
              const Text('Try to recall the answer, then reveal it.')
            else
              Semantics(
                liveRegion: true,
                child: Text(
                  japaneseFirst ? word.meaning : word.label,
                  key: const ValueKey('flashcard-answer'),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: revealed ? null : () => setState(() { revealed = true; }),
              child: const Text('Reveal answer'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: revealed ? next : null,
              child: Text(index == widget.words.length - 1 ? 'Finish practice' : 'Next card'),
            ),
          ],
        ],
      )),
    );
  }
}
