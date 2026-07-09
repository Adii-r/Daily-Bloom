class User {
  String name;
  String email;
  String password;
  String avatar;

  List<String> preferredCategories;
  List<int> savedQuoteIds;

  int streakCount;
  int gameScore;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.preferredCategories,
    required this.savedQuoteIds,
    required this.streakCount,
    required this.gameScore,
  });
}