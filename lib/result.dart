import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary.dart';

class Result extends StatelessWidget {
  const Result(this._selectedAnswers, this.restartQuiz, {super.key});

  final List<String> _selectedAnswers;
  final Function() restartQuiz;

  List<Map<String, Object>> get _summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < _selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': _selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCorrectAnswers = 0;
    for (var i = 0; i < _selectedAnswers.length; i++) {
      if (_summaryData[i]['correct_answer'] == _summaryData[i]['user_answer'])
        numOfCorrectAnswers++;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Text(
            textAlign: TextAlign.center,
            'Your answered $numOfCorrectAnswers questions correctly from ${questions.length} questioins !',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Summary(_summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(Icons.restart_alt_outlined),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(20),
            ),
            label: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
