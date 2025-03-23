import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './roomyx_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => RoomyxPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeInOut;
          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background SVG
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/profile bg.svg',
              fit: BoxFit.cover,
              height: 300, // Adjust height as needed
            ),
          ),
          // Profile Content
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 170.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage(
                      'assets/images/profile pic.jpg',
                    ),
                  ),
                  SizedBox(height: 40),
                  // User Information
                  _buildUserInfo('USERNAME', 'YASHODHAN SINGH RATHORE'),
                  _buildUserInfo('EMAIL', 'YASHODHANSINGH@GMAIL.COM'),
                  _buildUserInfo('PHONE', '9414917897'),
                  _buildUserInfo('DATE OF BIRTH', '19/05/1998'),
                  _buildUserInfo('ADDRESS', '145, M.G. NAGAR, MUMBAI'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF010857),
        buttonBackgroundColor: Color(0xFF010857),
        height: 60,
        index: 2,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.add_alert, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index == 0) {
            _navigateToHome(context);
          }
        },
      ),
    );
  }

  Widget _buildUserInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: 380,
        height: 51,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 124,
              height: 51,
              decoration: BoxDecoration(
                color: Color(0xFF010857),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
