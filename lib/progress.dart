import 'package:shared_preferences/shared_preferences.dart';

class ProgressStore {
  final SharedPreferences preferences;
  ProgressStore(this.preferences);
  int best(String lessonId) => preferences.getInt('best.$lessonId') ?? 0;
  bool completed(String lessonId) =>
      preferences.getBool('completed.$lessonId') ?? false;

  Future<void> record(String lessonId, int correct) async {
    if (correct > best(lessonId)) {
      if (!await preferences.setInt('best.$lessonId', correct)) {
        throw StateError('Unable to save score');
      }
    }
    if (!await preferences.setBool('completed.$lessonId', true)) {
      throw StateError('Unable to save completion');
    }
  }
}
