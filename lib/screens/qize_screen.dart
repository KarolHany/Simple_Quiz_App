// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Questions> questions = getQuestions();
  int questionIndex = 0;
  int score = 0;
  Answers? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 233, 241),
      appBar: AppBar(
        title: const Text(
          'Simple Quiz App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 20, 99, 163),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _questionWidget(),
            const SizedBox(
              height: 20,
            ),
            _answerList(),
            const SizedBox(
              height: 20,
            ),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _questionWidget() {
    return Column(
      children: [
        Center(
          child: Text(
            "Question ${questionIndex + 1} / ${questions.length}",
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 20, 99, 163),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 129, 192, 243),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              questions[questionIndex].questionText,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _answerList() {
    return Column(
      children: questions[questionIndex]
          .questionList
          .map((e) => _answerButton(e))
          .toList(),
    );
  }

  Widget _answerButton(Answers answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor:
              isSelected ? Colors.blue : const Color.fromARGB(255, 129, 192, 243),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  Widget _nextButton() {
    bool isLastQuestion = questionIndex == questions.length - 1;

    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(
          isLastQuestion ? "Submit" : "Next",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              questionIndex++;
            });
          }
        },
      ),
    );
  }

  Widget _showScoreDialog() {
    bool isPassed = score >= questions.length * 0.6;
    String title = isPassed ? "Passed" : "Failed";

    return AlertDialog(
      title: Text(
        "$title | Score is $score",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            questionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
