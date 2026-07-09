import 'package:flutter/material.dart';
import '../navigation/admin_navigation_screen.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 420,
            margin: EdgeInsets.all(24),
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: Image.asset(
                    "assets/images/icon.png",
                    height: 90,
                  ),
                ),

                SizedBox(height: 25),

                Center(
                  child: Text(
                    "Admin Login",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 8),

                Center(
                  child: Text(
                    "Manage Daily Bloom",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(height: 35),

                Text(
                  "Email",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8),

                TextField(
                  decoration: InputDecoration(
                    hintText: "admin@email.com",
                    filled: true,
                    fillColor: Color(0xFFF7F7F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    filled: true,
                    fillColor: Color(0xFFF7F7F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AdminNavigationScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6FCF97),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
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