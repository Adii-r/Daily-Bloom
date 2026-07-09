import 'package:daily_bloom/admin/login/admin_login_screen.dart';
import 'package:daily_bloom/admin/navigation/admin_navigation_screen.dart';
import 'package:daily_bloom/user/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AdminLoginScreen(),
    );
  }
}


