import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen =  StartScreen(switchScreen);
  //   super.initState();
  // }

  String activeScreen = "start-screen";
  List <String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }
  void chooseAnswer(answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {
        // selectedAnswer = [];
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget select = StartScreen((switchScreen)) ;

    if(activeScreen == "start-screen"){
      select = StartScreen((switchScreen));
    }else if(activeScreen == "questions-screen"){
      select = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }else{
      select =  ResultScreen(choosenAnswer: selectedAnswer,);
    }
    
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(222, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: select
          ),
        ));
  }
}
