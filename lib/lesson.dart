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
  const Lesson(this.id, this.title, this.introduction, this.exercises);
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
);

class LessonSession {
  final Lesson lesson;
  int index = 0;
  int correct = 0;
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
    if (lastCorrect!) correct++;
    answered = true;
  }

  void next() {
    if (!answered || finished) return;
    index++;
    answered = false;
    lastCorrect = null;
  }
}
