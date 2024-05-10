import 'dart:ffi';

import 'package:adv_basics/questions_summary/summary_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    bool isCorrect(String correct_answer, String user_answer) {
      return correct_answer == user_answer;
    }
    

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }

  
}
