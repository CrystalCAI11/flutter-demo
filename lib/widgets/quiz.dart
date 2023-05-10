import 'package:flutter/material.dart';
import 'package:flutter_demo/data/questions_data.dart';
import 'package:flutter_demo/views/questions_view.dart';
import 'package:flutter_demo/views/result_view.dart';
import 'package:flutter_demo/views/start_views.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-view';

  void switchView() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-view';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-view';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewWidget = activeScreen == 'start-view'
        ? StartView(switchView)
        : activeScreen == 'questions-view'
            ? QuestionsView(onSelectAnswer: chooseAnswer)
            : ResultView(
                restartQuiz: switchView,
                chosenAnswers: selectedAnswers,
              );

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: viewWidget,
        ),
      ),
    );
  }
}
