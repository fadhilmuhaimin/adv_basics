import 'package:flutter/material.dart';

class AnswerButtton extends StatelessWidget {
  const AnswerButtton({required this.answerText, required this.onTap ,super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(answerText,style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 49, 15, 107),
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
      ),
    );
  }
}
