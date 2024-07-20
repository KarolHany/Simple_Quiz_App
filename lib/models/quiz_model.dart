class Questions {
  String questionText;
  List<Answers> questionList;
  Questions({required this.questionText, required this.questionList});
}

class Answers {
  String answerText;
  bool isCorrect;
  Answers({required this.answerText, required this.isCorrect});
}

List<Questions> getQuestions() {
  List<Questions> questions = [];
  questions.add(
    Questions(questionText: "Who is the owner of Flutter?", questionList: [
      Answers(answerText: "Nokia", isCorrect: false),
      Answers(answerText: "Samsung", isCorrect: false),
      Answers(answerText: "Google", isCorrect: true),
      Answers(answerText: "Apple", isCorrect: false),
    ]),
  );
  questions.add(Questions(
    questionText: "Who owns Iphone?",
    questionList: [
      Answers(answerText: "Apple", isCorrect: true),
      Answers(answerText: "Microsoft", isCorrect: false),
      Answers(answerText: "Google", isCorrect: false),
      Answers(answerText: "Nokia", isCorrect: false),
    ],
  ));

  questions.add(Questions(
    questionText: "Youtube is _________  platform?",
    questionList: [
      Answers(answerText: "Music Sharing", isCorrect: false),
      Answers(answerText: "Video Sharing", isCorrect: false),
      Answers(answerText: "Live Streaming", isCorrect: false),
      Answers(answerText: "All of the above", isCorrect: true),
    ],
  ));

  questions.add(Questions(
    questionText: "Flutter user dart as a language?",
    questionList: [
      Answers(answerText: "True", isCorrect: true),
      Answers(answerText: "False", isCorrect: false),
    ],
  ));

  return questions;
}
