import 'package:flutter/material.dart';
import '../dashboard/dashboard_screen.dart';
import '../categories/categories_screen.dart';
import '../authors/authors_screen.dart';
import '../quotes/quotes_screen.dart';
import '../game/game_content_screen.dart';

class AdminNavigationScreen extends StatefulWidget {
  const AdminNavigationScreen({super.key});

  @override
  State<AdminNavigationScreen> createState() =>
      _AdminNavigationScreenState();
}

class _AdminNavigationScreenState
    extends State<AdminNavigationScreen> {

  int selectedIndex = 0;

  late final List<Widget> pages = [
    const DashboardScreen(),
    const CategoriesScreen(),
    const AuthorsScreen(),
    const QuotesScreen(),
    const GameContentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      body: Row(
        children: [
          Container(
            width: 260,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0xFF6FCF97),
                      backgroundImage:
                      AssetImage("assets/images/avatar.png"),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Admin",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Administrator",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                _buildNavItem(
                  index: 0,
                  icon: Icons.dashboard_rounded,
                  title: "Dashboard",
                ),

                _buildNavItem(
                  index: 1,
                  icon: Icons.category_rounded,
                  title: "Categories",
                ),

                _buildNavItem(
                  index: 2,
                  icon: Icons.person_outline,
                  title: "Authors",
                ),

                _buildNavItem(
                  index: 3,
                  icon: Icons.format_quote_rounded,
                  title: "Quotes",
                ),

                _buildNavItem(
                  index: 4,
                  icon: Icons.videogame_asset_rounded,
                  title: "Game Content",
                ),

                const Spacer(),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: pages[selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    final bool selected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFF6FCF97)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [

              Icon(
                icon,
                color: selected
                    ? Colors.white
                    : Colors.black87,
              ),

              const SizedBox(width: 15),

              Text(
                title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: selected
                      ? Colors.white
                      : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}