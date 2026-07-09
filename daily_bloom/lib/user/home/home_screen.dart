import 'package:flutter/material.dart';

import '../quote/quote_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class QuoteCard extends StatelessWidget {
  final String category;
  final IconData icon;
  final String quote;
  final String author;
  final bool isSaved;

  const QuoteCard({
    super.key,
    required this.category,
    required this.icon,
    required this.quote,
    required this.author,
    this.isSaved = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const QuoteDetailScreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Color(0xFF6FCF97).withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF6FCF97).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(
                    icon,
                    size: 15,
                    color: Color(0xFF2E7D32),
                  ),

                  SizedBox(width: 6),

                  Text(
                    category,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text(
              "\"$quote\"",
              style: TextStyle(
                fontFamily: "CormorantGaramond",
                fontSize: 30,
                fontStyle: FontStyle.italic,
                height: 1.4,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 30),

            Row(
              children: [

                Expanded(
                  child: Text(
                    "- $author",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),

                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF6FCF97).withValues(alpha: 0.0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: Icon(
                      isSaved
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,
                      color: isSaved ? Colors.red : Colors.black87,
                      size: 20,
                    ),
                  ),
                ),

                SizedBox(width: 4),

                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF6FCF97).withValues(alpha: 0.0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> quotes = [
    {
      "category": "Motivation",
      "icon": Icons.local_florist,
      "quote":
      "The happiness of your life depends upon the quality of your thoughts.",
      "author": "Marcus Aurelius",
    },
    {
      "category": "Mindfulness",
      "icon": Icons.self_improvement,
      "quote":
      "Wherever you are, be there totally.",
      "author": "Eckhart Tolle",
    },
    {
      "category": "Success",
      "icon": Icons.emoji_events_outlined,
      "quote":
      "Success is the sum of small efforts repeated day in and day out.",
      "author": "Robert Collier",
    },
    {
      "category": "Nature",
      "icon": Icons.eco_outlined,
      "quote":
      "Look deep into nature, and then you will understand everything better.",
      "author": "Albert Einstein",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              SizedBox(height: 15),
              Row(
                children: [

                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                    AssetImage("assets/images/avatar.png"),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontFamily: "CormorantGaramond",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 2),

                        Text(
                          "Aditya",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withValues(alpha: 0.45),
                      borderRadius:
                      BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [

                        Icon(
                          Icons.local_fire_department,
                          color: Colors.orange,
                        ),

                        SizedBox(width: 6),

                        Text(
                          "12",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {

                    final quote = quotes[index];

                    return Padding(
                      padding:
                      EdgeInsets.only(bottom: 18),
                      child: QuoteCard(
                        category: quote["category"],
                        icon: quote["icon"],
                        quote: quote["quote"],
                        author: quote["author"],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}