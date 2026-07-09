import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../onboarding/signup_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  Timer? _timer;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.05,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _timer = Timer(const Duration(seconds: 4), () {
      _navigateToWelcome();
    });
  }

  void _navigateToWelcome() {
    if (_hasNavigated || !mounted) return;

    _hasNavigated = true;
    _timer?.cancel();


    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToWelcome,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF6FCF97).withValues(alpha: 0.54),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/icon.png",
                          width: 140,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  Text(
                    "Daily Bloom",
                    style: TextStyle(
                      fontFamily: "CormorantGaramond",
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "BREATHE · REFLECT · GROW",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "CormorantGaramond",
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 50),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF6FCF97).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Text(
                          "Tap anywhere to begin",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}