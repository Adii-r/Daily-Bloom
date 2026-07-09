import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color(0xFF6FCF97),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF6FCF97),
            width: 2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontFamily: "CormorantGaramond",
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Continue your wellness journey.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "CormorantGaramond",
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 40),

                _buildTextField(
                  hint: "Email",
                  icon: Icons.email_outlined,
                ),

                SizedBox(height: 18),

                _buildTextField(
                  hint: "Password",
                  icon: Icons.lock_outline,
                  obscure: true,
                ),

                SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6FCF97),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New here? ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xFF6FCF97),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}