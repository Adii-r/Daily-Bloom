import 'package:flutter/material.dart';

class GameContentScreen extends StatelessWidget {
  const GameContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Game Content",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Quote Quest questions are automatically generated from your published quotes.",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Guess Author uses random authors as distractors while Complete the Quote hides keywords automatically.",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 40),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 1300),
                  child: DataTable(
                    headingRowColor:
                    WidgetStateProperty.all(const Color(0xFFF4F4F4)),
                    headingTextStyle: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                    columnSpacing: 60,
                    horizontalMargin: 30,
                    columns: const [

                      DataColumn(
                        label: Text("Quote"),
                      ),

                      DataColumn(
                        label: Text("Game Modes Available"),
                      ),
                    ],

                    rows: const [

                      DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: 500,
                              child: Text(
                                "You have power over your mind, not outside events. Realize this, and you will find strength.",
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Guess Author • Complete the Quote",
                            ),
                          ),
                        ],
                      ),

                      DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: 500,
                              child: Text(
                                "Breathing in, I calm my body. Breathing out, I smile.",
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Guess Author • Complete the Quote",
                            ),
                          ),
                        ],
                      ),

                      DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: 500,
                              child: Text(
                                "We may encounter many defeats but we must not be defeated.",
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Guess Author • Complete the Quote",
                            ),
                          ),
                        ],
                      ),

                      DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: 500,
                              child: Text(
                                "Let yourself be silently drawn by the strange pull of what you really love.",
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Guess Author • Complete the Quote",
                            ),
                          ),
                        ],
                      ),

                      DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: 500,
                              child: Text(
                                "The best time to plant a tree was twenty years ago. The second best time is now.",
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Guess Author • Complete the Quote",
                            ),
                          ),
                        ],
                      ),

                      DataRow(
                        cells: [
                          DataCell(
                            SizedBox(
                              width: 500,
                              child: Text(
                                "Laughter is the shortest distance between two people.",
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              "Guess Author • Complete the Quote",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}