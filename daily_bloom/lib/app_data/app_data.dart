import '../models/category.dart';
import '../models/author.dart';
import '../models/quote.dart';
import '../models/user.dart';
import '../models/game_item.dart';

class AppData {

  static List<Category> categories = [];

  static List<Author> authors = [];

  static List<Quote> quotes = [

    Quote(
      text: "The happiness of your life depends upon the quality of your thoughts.",
      author: "Marcus Aurelius",
      category: "Stoicism",
      status: "Published",
    ),


    Quote(
      text: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
      category: "Motivation",
      status: "Published",
    ),


    Quote(
      text: "Peace comes from within. Do not seek it without.",
      author: "Buddha",
      category: "Mindfulness",
      status: "Published",
    ),


    Quote(
      text: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      author: "Winston Churchill",
      category: "Success",
      status: "Published",
    ),


    Quote(
      text: "In the middle of difficulty lies opportunity.",
      author: "Albert Einstein",
      category: "Growth",
      status: "Published",
    ),

  ];

  static List<User> users = [];

  static List<GameItem> gameItems = [

    GameItem(
      type: "guess-author",
      question:
      "The happiness of your life depends upon the quality of your thoughts.",
      options: [
        "Marcus Aurelius",
        "Seneca",
        "Confucius",
        "Aristotle",
      ],
      correctAnswer: "Marcus Aurelius",
      points: 20,
      difficulty: "Easy",
    ),


    GameItem(
      type: "complete-quote",
      question:
      "The happiness of your life depends upon the quality of your ______.",
      options: [
        "thoughts",
        "actions",
        "words",
        "dreams",
      ],
      correctAnswer: "thoughts",
      points: 20,
      difficulty: "Easy",
    ),


    GameItem(
      type: "guess-author",
      question:
      "Believe you can and you're halfway there.",
      options: [
        "Theodore Roosevelt",
        "Albert Einstein",
        "Winston Churchill",
        "Maya Angelou",
      ],
      correctAnswer: "Theodore Roosevelt",
      points: 20,
      difficulty: "Easy",
    ),


    GameItem(
      type: "complete-quote",
      question:
      "Peace comes from within. Do not seek it ______.",
      options: [
        "without",
        "inside",
        "above",
        "around",
      ],
      correctAnswer: "without",
      points: 20,
      difficulty: "Medium",
    ),


    GameItem(
      type: "guess-author",
      question:
      "In the middle of difficulty lies opportunity.",
      options: [
        "Albert Einstein",
        "Marcus Aurelius",
        "Buddha",
        "Winston Churchill",
      ],
      correctAnswer: "Albert Einstein",
      points: 20,
      difficulty: "Easy",
    ),


    GameItem(
      type: "complete-quote",
      question:
      "The wound is the place where the ______ enters you.",
      options: [
        "light",
        "pain",
        "hope",
        "strength",
      ],
      correctAnswer: "light",
      points: 30,
      difficulty: "Medium",
    ),

  ];

}