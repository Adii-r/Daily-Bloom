import 'package:flutter/material.dart';

class QuoteDetailScreen extends StatefulWidget {
  const QuoteDetailScreen({super.key});

  @override
  State<QuoteDetailScreen> createState() => _QuoteDetailScreenState();
}

class _QuoteDetailScreenState extends State<QuoteDetailScreen> {

  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [

                SizedBox(
                  height: 330,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [

                      Image.asset(
                        "assets/images/background.png",
                        fit: BoxFit.cover,
                      ),

                      Container(
                        color: Colors.black.withValues(alpha: 0.15),
                      ),

                      SafeArea(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 250,
                  left: 2,
                  right: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24, 35, 24, 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF6FCF97),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Marcus Aurelius",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          SizedBox(height: 25),

                          Text(
                            '"The happiness of your life depends upon the quality of your thoughts."',
                            style: TextStyle(
                              fontFamily: "CormorantGaramond",
                              fontSize: 34,
                              height: 1.5,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 30),

                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Color(0xFFEAF8EF),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Roman emperor and Stoic philosopher, author of Meditations..",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    height: 1.7,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Column(
                              children: [

                                Row(
                                  children: [

                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF6FCF97),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),

                                    SizedBox(width: 15),

                                    Expanded(
                                      child: Text(
                                        "Narrated Quote",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 15),

                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 4,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 7,
                                    ),
                                    overlayShape: SliderComponentShape.noOverlay,
                                    activeTrackColor: Color(0xFF6FCF97),
                                    inactiveTrackColor: Colors.grey.shade300,
                                    thumbColor: Color(0xFF6FCF97),
                                  ),
                                  child: Slider(
                                    value: 0.35,
                                    onChanged: (_) {},
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(
                                        "0:11",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.grey,
                                        ),
                                      ),

                                      Text(
                                        "0:32",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),

                          Row(
                            children: [

                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    setState(() {
                                      isSaved = !isSaved;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Color(0xFF6FCF97),
                                      ),
                                    ),
                                    child: Column(
                                      children: [

                                        Icon(
                                          isSaved
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Color(0xFF6FCF97),
                                          size: 22,
                                        ),

                                        SizedBox(height: 10),

                                        Text(
                                          isSaved ? "Saved" : "Save",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 18),

                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Color(0xFF6FCF97),
                                      ),
                                    ),
                                    child: Column(
                                      children: [

                                        Icon(
                                          Icons.share_outlined,
                                          color: Color(0xFF6FCF97),
                                          size: 22,
                                        ),

                                        SizedBox(height: 10),

                                        Text(
                                          "Share",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 50),
                        ],
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