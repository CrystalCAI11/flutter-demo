import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultBlock extends StatelessWidget {
  const ResultBlock(this.data, {super.key});
  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(
        radius: 15,
        backgroundColor: data['chosen_answer'] == data['correct_answer']
            ? Colors.blue
            : Colors.purple,
        foregroundColor: Colors.black,
        child: Text(
          ((data['question_index'] as int) + 1).toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['question'] as String,
              style: GoogleFonts.lato(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              data['chosen_answer'] as String,
              style: GoogleFonts.lato(color: Colors.purple),
            ),
            const SizedBox(height: 5),
            Text(
              data['correct_answer'] as String,
              style: GoogleFonts.lato(color: Colors.blue),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ]);
  }
}
