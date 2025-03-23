import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './profile_page.dart';

class RoomyxPage extends StatefulWidget {
  const RoomyxPage({super.key});

  @override
  _RoomyxPageState createState() => _RoomyxPageState();
}

class _RoomyxPageState extends State<RoomyxPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildIllustrationSection(),
            SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF010857),
        buttonBackgroundColor: Color(0xFF010857),
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.add_alert, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 2) {
              _navigateToProfile(context);
            } else {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          });
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
              border: Border.all(color: Color(0xFF010857), width: 2),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          SizedBox(width: 0),
          Container(
            width: 66,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF010857),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
              border: Border.all(color: Color(0xFF010857), width: 2),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/search icon.svg',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustrationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 255,
        decoration: BoxDecoration(
          color: Color(0xFF010857),
          border: Border.all(color: Color(0xFF010857), width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FIND YOUR ROOMIE",
              style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
              width: 175.18,
              height: 174.03,
              decoration: BoxDecoration(
                color: Color(0xFF010857),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/romie.svg',
                  width: 175.18,
                  height: 174.03,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildActionButton("SELECT HOSTEL", 'assets/images/hostel.svg', 6.0),
          SizedBox(height: 10),
          _buildActionButton("SELECT ROOM", 'assets/images/room.svg', 7.0),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, String iconPath, double topPosition) {
    return Container(
      width: 386,
      height: 56,
      margin: EdgeInsets.only(top: topPosition),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 20,
              top: (56 - 33) / 2,
              child: SvgPicture.asset(iconPath, width: 29, height: 33),
            ),
            Center(
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  color: Color(0xFF010857),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
