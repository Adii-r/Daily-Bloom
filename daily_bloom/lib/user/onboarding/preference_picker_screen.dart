import 'package:daily_bloom/user/home/home_screen.dart';
import 'package:daily_bloom/user/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';

class PreferencePickerScreen extends StatefulWidget {
  const PreferencePickerScreen({super.key});

  @override
  State<PreferencePickerScreen> createState() =>
      _PreferencePickerScreenState();
}

class _PreferencePickerScreenState
    extends State<PreferencePickerScreen> {

  final List<String> categories = [
    "Motivation",
    "Mindfulness",
    "Success",
    "Love",
    "Stoicism",
    "Nature",
  ];

  final List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 30),

              Text(
                "What lifts you up?",
                style: TextStyle(
                  fontFamily: "CormorantGaramond",
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Pick at least 3 categories to personalize your daily inspiration.",
                style: TextStyle(
                  fontFamily: "CormorantGaramond",
                  fontSize: 17.5,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 35),

              Expanded(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: categories.map((category) {

                    final isSelected =
                    selectedCategories.contains(category);

                    return GestureDetector(
                      onTap: () {

                        setState(() {

                          if (isSelected) {
                            selectedCategories.remove(category);
                          } else {
                            selectedCategories.add(category);
                          }

                        });

                      },

                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xFF6FCF97)
                              : Colors.white,

                          borderRadius:
                          BorderRadius.circular(30),

                          border: Border.all(
                            color: isSelected
                                ? Color(0xFF6FCF97)
                                : Colors.grey.shade300,
                          ),
                        ),

                        child: Text(
                          category,
                          style: TextStyle(
                            fontFamily: "CormorantGaramond",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: isSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );

                  }).toList(),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: selectedCategories.length >= 3
                      ? () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => NavigationScreen(),
                      ),
                    );
                  }: null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    Color(0xFF6FCF97),

                    disabledBackgroundColor:
                    Colors.grey.shade300,

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30),
                    ),
                  ),

                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}