class QuizQuestion{
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> shuffleQuestion(){
    final a =  List.of(answer);
    a.shuffle();
    return a;
  }

}