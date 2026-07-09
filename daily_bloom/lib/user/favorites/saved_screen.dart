import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({
    super.key,
    required this.onBrowseQuotes,
  });
  final VoidCallback onBrowseQuotes;
  final bool hasSavedQuotes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),

      body: SafeArea(
        child: hasSavedQuotes
            ? ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 10),

            Text(
              "Saved Quotes",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            QuoteCard(
              category: "Motivation",
              icon: Icons.local_florist,
              quote:
              "The happiness of your life depends upon the quality of your thoughts.",
              author: "Marcus Aurelius",
              isSaved: true,
            ),

            SizedBox(height: 20),

            QuoteCard(
              category: "Mindfulness",
              icon: Icons.self_improvement,
              quote:
              "Wherever you are, be there totally.",
              author: "Eckhart Tolle",
              isSaved: true,
            ),
          ],
        )
            : Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save the quotes that inspire you, for whenever you need them.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "CormorantGaramond",
                    fontSize: 28,
                    height: 1.6,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      onBrowseQuotes();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6FCF97),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Browse Quotes",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}