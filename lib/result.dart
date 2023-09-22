import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, {super.key});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
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
          const Text(
            textAlign: TextAlign.center,
            'Your answered 3 questions correctly from 5 !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          ...getSummaryData().map((e) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.red[300],
                        child:
                            Text(((e['question_index'] as int) + 1).toString()),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['question'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            Text(e['correct_answer'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(146, 250, 205, 254),
                                )),
                            Text(e['user_answer'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(146, 0, 166, 255),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              )),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: () {},
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
