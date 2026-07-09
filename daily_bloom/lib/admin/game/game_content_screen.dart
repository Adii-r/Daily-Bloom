import 'package:flutter/material.dart';
import '../../app_data/app_data.dart';
import '../../models/game_item.dart';

class GameContentScreen extends StatefulWidget {
  const GameContentScreen({super.key});

  @override
  State<GameContentScreen> createState() => _GameContentScreenState();
}

class _GameContentScreenState extends State<GameContentScreen> {
  void deleteGameItem(int index) {
    setState(() {
      AppData.gameItems.removeAt(index);
    });
  }

  void addGameItem() {
    AppData.gameItems.add(
      GameItem(
        type: "Guess Author",

        question:
            "The happiness of your life depends upon the quality of your thoughts.",

        options: ["Marcus Aurelius", "Seneca", "Aristotle", "Plato"],

        correctAnswer: "Marcus Aurelius",

        points: 20,

        difficulty: "Easy",
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  "Game Content",

                  style: TextStyle(
                    fontFamily: "Poppins",

                    fontSize: 32,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: addGameItem,

                  icon: const Icon(Icons.add),

                  label: const Text("Add Question"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FCF97),

                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(22),
              ),

              child: DataTable(
                columns: [
                  const DataColumn(label: Text("Question")),

                  const DataColumn(label: Text("Type")),

                  const DataColumn(label: Text("Difficulty")),

                  const DataColumn(label: Text("Points")),

                  const DataColumn(label: Text("Actions")),
                ],

                rows: AppData.gameItems.asMap().entries.map((entry) {
                  int index = entry.key;

                  GameItem game = entry.value;

                  return DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: 350,

                          child: Text(
                            game.question,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),

                      DataCell(Text(game.type)),

                      DataCell(Text(game.difficulty)),

                      DataCell(Text("${game.points} XP")),

                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),

                          onPressed: () {
                            deleteGameItem(index);
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
