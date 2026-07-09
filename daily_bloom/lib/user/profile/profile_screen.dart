import 'package:flutter/material.dart';
import '../onboarding/preference_picker_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class AchievementCard extends StatelessWidget {

  final IconData icon;
  final String title;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEFE9FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            color: Color(0xff7A5AF8),
          ),

          SizedBox(height: 8),

          Text(
            title,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool reminder = true;
  bool darkMode = false;
  bool autoPlay = true;

  final List<String> selectedPreferences = [
    "Motivation",
    "Mindfulness",
    "Success",
  ];

  final List<String> allPreferences = [
    "Motivation",
    "Mindfulness",
    "Success",
    "Stoicism",
    "Nature",
    "Humor",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.black,
            fontWeight: FontWeight.bold,
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

                CircleAvatar(
                  radius: 42,
                  backgroundImage:
                  AssetImage("assets/images/avatar.png"),
                ),

                SizedBox(width: 25),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Aditya Raut",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "🌱 Seedling",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xff6FCF97),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 35),

            Text(
              "Achievements",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.2,
              children: [

                AchievementCard(
                  icon: Icons.local_fire_department,
                  title: "7 Day Streak",
                ),

                AchievementCard(
                  icon: Icons.favorite,
                  title: "24 Saved",
                ),
              ],
            ),

            SizedBox(height: 35),

            const Text(
              "Your Preferences",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: allPreferences.map((item) {

                bool active =
                selectedPreferences.contains(item);

                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15),
                  decoration: BoxDecoration(
                    color: active
                        ? Color(0xff6FCF97)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xff6FCF97),
                    ),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: active
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                      PreferencePickerScreen(),
                    ),
                  );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Color(0xff6FCF97),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Edit Preferences",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),

            Text(
              "Settings",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            SwitchListTile(
              contentPadding: EdgeInsets.all(5),
              activeThumbColor: Color(0xff6FCF97),
              title: Text(
                "Daily Reminder",
                style: TextStyle(fontFamily: "Poppins"),
              ),
              value: reminder,
              onChanged: (value) {
                setState(() {
                  reminder = value;
                });
              },
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.all(5),
              activeThumbColor: Color(0xff6FCF97),
              title: Text(
                "Dark Mode",
                style: TextStyle(fontFamily: "Poppins"),
              ),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),

            SwitchListTile(
              contentPadding: EdgeInsets.all(5),
              activeThumbColor: Color(0xff6FCF97),
              title: Text(
                "Auto Play Audio",
                style: TextStyle(fontFamily: "Poppins"),
              ),
              value: autoPlay,
              onChanged: (value) {
                setState(() {
                  autoPlay = value;
                });
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

