import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key ,required this.choosenAnswer});

  List<String> choosenAnswer;
  

  List <Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i=0; i<choosenAnswer.length; i++){
      summary.add({
        'questions_index' : i,
        'questions' : questions[i].text,
        'correct_answer' : questions[1].answer[0],
        'user_answer' : choosenAnswer[i]
      });
    }
    return summary;

  }

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your answered X out of Y question correctly"),
            SizedBox(height: 20,),
            QuestionsSummary(getSummaryData()),
          ],
        ),
      ),
    );
  }
}
