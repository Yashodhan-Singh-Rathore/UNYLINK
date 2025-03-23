import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'signup_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              // Background Image
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset(
                  'assets/images/bg get started.svg',
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              // Illustration
              Positioned(
                top: screenHeight * 0.3,
                left:
                    (screenWidth - screenWidth * 0.7) /
                    2, // Center horizontally
                child: SvgPicture.asset(
                  'assets/images/get started page.svg',
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                ),
              ),
              // Logo in JPG format
              Positioned(
                top: screenHeight * 0.6,
                left:
                    (screenWidth - screenWidth * 0.6) /
                    2, // Center horizontally
                child: Image.asset(
                  'assets/images/logo with name.jpg',
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.15,
                ),
              ),
              // Get Started Button
              Positioned(
                top: screenHeight * 0.77,
                left:
                    (screenWidth - screenWidth * 0.7) /
                    2, // Center horizontally
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF010857), // Button color
                    fixedSize: Size(
                      screenWidth * 0.7,
                      screenHeight * 0.07,
                    ), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Button radius
                    ),
                    shadowColor: Colors.black.withOpacity(0.25), // Shadow color
                    elevation: 8.1, // Shadow blur
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ), // Text color and size
                  ),
                ),
              ),
              // Login Text
              Positioned(
                top: screenHeight * 0.86,
                left:
                    (screenWidth - screenWidth * 0.6) / 2, // Align with button
                child: RichText(
                  text: TextSpan(
                    text: 'ALREADY HAVE AN ACCOUNT? ',
                    style: const TextStyle(
                      color: Colors.black,
                    ), // Regular text style
                    children: [
                      TextSpan(
                        text: 'LOGIN',
                        style: const TextStyle(
                          color: Color(0xFF010857), // Login text color
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Login Page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
