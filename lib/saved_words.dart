import 'package:shared_preferences/shared_preferences.dart';
import 'vocabulary_words.dart';

class SavedWordsStore {
  final SharedPreferences preferences;
  final Set<String> _saved;

  SavedWordsStore(this.preferences)
      : _saved = {
          for (final word in vocabularyWords)
            if (preferences.getBool('saved-word.v1.${word.id}') == true) word.id,
        };

  bool contains(VocabularyWord word) => _saved.contains(word.id);

  Future<void> setSaved(VocabularyWord word, bool saved) async {
    // One key per word avoids losing other bookmarks during independent writes.
    final success = await preferences.setBool('saved-word.v1.${word.id}', saved);
    if (!success) {
      // SharedPreferences updates its cache before the platform confirms a write.
      await preferences.reload();
      throw StateError('Unable to save word');
    }
    if (saved) {
      _saved.add(word.id);
    } else {
      _saved.remove(word.id);
    }
  }
}
