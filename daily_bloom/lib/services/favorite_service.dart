import '../models/quote.dart';

class FavoriteService {
  static List<Quote> savedQuotes = [];

  static void toggleSave(Quote quote) {
    if (savedQuotes.contains(quote)) {
      savedQuotes.remove(quote);
    } else {
      savedQuotes.add(quote);
    }
  }

  static bool isSaved(Quote quote) {
    return savedQuotes.contains(quote);
  }
}
