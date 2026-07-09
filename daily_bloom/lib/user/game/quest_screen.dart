import 'package:flutter/material.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Color(0xffEFE9FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: Color(0xff7A5AF8)),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerTile extends StatelessWidget {
  final String text;

  const AnswerTile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
        ),
      ),
    );
  }
}


class _QuestScreenState extends State<QuestScreen> {
  bool guessAuthor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Quote Quest",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        guessAuthor = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: guessAuthor
                            ? Color(0xFF6FCF97)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xFF6FCF97),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Guess Author",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: guessAuthor
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        guessAuthor = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: !guessAuthor
                            ? Color(0xFF6FCF97)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xFF6FCF97),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Complete Quote",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            color: !guessAuthor
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(
                    guessAuthor
                        ? "Who said this?"
                        : "Complete the quote",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    guessAuthor
                        ? "\"The happiness of your life depends upon the quality of your thoughts.\""
                        : "\"The happiness of your life depends upon the quality of your ______.\"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "CormorantGaramond",
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            AnswerTile(text: "Marcus Aurelius"),
            SizedBox(height: 12),
            AnswerTile(text: "Seneca"),
            SizedBox(height: 12),
            AnswerTile(text: "Confucius"),
            SizedBox(height: 12),
            AnswerTile(text: "Aristotle"),

            SizedBox(height: 25),

            Center(
              child: Text(
                "+20 XP",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Color(0xFF6FCF97),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Next Level XP",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: 0.55,
                minHeight: 12,
                backgroundColor: Color(0xffE6E6E6),
                valueColor: AlwaysStoppedAnimation(
                  Color(0xFF6FCF97),
                ),
              ),
            ),

            SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "55%",
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

