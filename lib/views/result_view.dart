import 'package:flutter/material.dart';
import 'package:flutter_demo/data/questions_data.dart';

import '../widgets/result_block.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    super.key,
    required this.restartQuiz,
    required this.chosenAnswers,
  });

  final VoidCallback restartQuiz;
  final List<String> chosenAnswers;

  // 返回值是一个Map list, Map里key为String，value为Object
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'chosen_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final correctCount = summaryData
        .where(
            (element) => element['chosen_answer'] == element['correct_answer'])
        .length;

    Widget resultList = SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (e) => ResultBlock(e),
            ),
          ],
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctCount out of ${questions.length} questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            resultList,
            const SizedBox(height: 30),
            TextButton.icon(
                icon: const Icon(Icons.refresh),
                onPressed: restartQuiz,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
