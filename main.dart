import 'package:flutter/material.dart';
import 'pages/splash_screen.dart'; // Import the splash screen
import 'pages/signup_page.dart'; // Import the signup page
import 'pages/login_page.dart'; // Import the login page
import 'pages/roomyx_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(), // Show the splash screen initially
    );
  }
}
