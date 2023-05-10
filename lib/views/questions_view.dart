import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/answer_button.dart';
import 'package:flutter_demo/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String asnwer) onSelectAnswer;

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  var currentQuestionIndex = 0;

  answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // 这里不解构的话整个list会被当成一个值处理
            ...currentQuestion.shuffledAnswers.map((answer) => AnswerButton(
                answerText: answer, onTap: () => answerQuestion(answer))),
          ],
        ),
      ),
    );
  }
}
