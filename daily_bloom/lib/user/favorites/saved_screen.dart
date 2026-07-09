import 'package:flutter/material.dart';
import '../../services/favorite_service.dart';
import '../quote/quote_detail_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key, required this.onBrowseQuotes});

  final VoidCallback onBrowseQuotes;

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final savedQuotes = FavoriteService.savedQuotes;

    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),

      body: SafeArea(
        child: savedQuotes.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "Save the quotes that inspire you,\nfor whenever you need them.",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontFamily: "CormorantGaramond",

                        fontSize: 28,

                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: widget.onBrowseQuotes,

                      child: Text("Browse Quotes"),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(20),

                itemCount: savedQuotes.length,

                itemBuilder: (context, index) {
                  final quote = savedQuotes[index];

                  return Card(
                    child: ListTile(
                      title: Text(
                        quote.text,

                        style: TextStyle(
                          fontFamily: "CormorantGaramond",

                          fontSize: 20,
                        ),
                      ),

                      subtitle: Text("- ${quote.author}"),

                      onTap: () async {
                        await Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                QuoteDetailScreen(quote: quote),
                          ),
                        );

                        setState(() {});
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
