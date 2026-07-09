import 'package:flutter/material.dart';
import '../../app_data/app_data.dart';
import '../../models/quote.dart';
import '../quote/quote_detail_screen.dart';
import '../../services/favorite_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class QuoteCard extends StatefulWidget {
  final Quote quote;
  const QuoteCard({
    super.key,
    required this.quote,
  });

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuoteDetailScreen(
              quote: widget.quote
            ),
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
                    Icons.auto_awesome,
                    size: 15,
                    color: Color(0xFF2E7D32),
                  ),

                  SizedBox(width: 6),

                  Text(
                    widget.quote.category,
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
              widget.quote.text,
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
                    "- " + widget.quote.author,
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

                    onPressed: () {

                      setState(() {
                        FavoriteService.toggleSave(widget.quote);
                      });

                    },

                    icon: Icon(

                      FavoriteService.isSaved(widget.quote)
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,

                      color: FavoriteService.isSaved(widget.quote)
                          ? Colors.red
                          : Colors.black87,

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
                  itemCount: AppData.quotes.length,
                  itemBuilder: (context, index) {

                    final quote = AppData.quotes[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: QuoteCard(
                        quote: quote,
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