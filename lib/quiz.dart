import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        activeScreen = Result(selectedAnswers, restartQuiz);
        selectedAnswers = [];
      }
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Home(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFD500F9),
                Color(0xFF00B0FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
