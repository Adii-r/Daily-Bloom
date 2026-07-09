import 'package:daily_bloom/user/game/quest_screen.dart';
import 'package:daily_bloom/user/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../favorites/saved_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() =>
      _NavigationScreenState();
}

class _NavigationScreenState
    extends State<NavigationScreen> {

  int currentIndex = 0;

  late final List<Widget> pages = [
    HomeScreen(),
    QuestScreen(),
    SavedScreen(
      onBrowseQuotes: () {
        setState(() {
          currentIndex = 0;
        });
      },
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

        bottomNavigationBar: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              elevation: 10,
              selectedItemColor: Color(0xFF6FCF97),
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: "Poppins",
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.videogame_asset_outlined),
                  label: "Quest",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: "Saved",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
    );
  }
}