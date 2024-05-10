import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.choosenAnswer, required this.reset});

  final void Function() reset;

  List<String> choosenAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'questions_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': choosenAnswer[i],
        'is_correct': choosenAnswer[i] == questions[i].answer[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final question_size = questions.length;
    final correct_answer = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your answered $correct_answer out of $question_size question correctly",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                reset();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple),
              icon: const Icon(Icons.refresh_outlined),
              label: const Text("Restart Quiz!"),
            )
          ],
        ),
      ),
    );
  }
}
