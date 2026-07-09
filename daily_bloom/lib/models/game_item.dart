class GameItem {
  String type;
  String question;
  List<String> options;
  String correctAnswer;
  int points;
  String difficulty;

  GameItem({
    required this.type,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.points,
    required this.difficulty,
  });
}