import 'package:flutter/material.dart';
import 'package:mini_app2/views/about_screen.dart';
import 'package:mini_app2/views/referesh.dart';
import 'package:mini_app2/views/user_home_screen.dart';

class Kasirajan extends StatefulWidget {
  const Kasirajan({Key? key}) : super(key: key);

  @override
  State<Kasirajan> createState() => _KasirajanState();
}

class _KasirajanState extends State<Kasirajan> {
  int _currentIndex = 0;

  // List of widgets representing different screens
  final List<Widget> _screens = [
    UserHomeScreen(),
    RefereshScreen(),
    AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      fixedColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
            size: 50,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
            size: 50,
          ),
          label: 'Referesh',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.phone,
            color: Colors.white,
            size: 50,
          ),
          label: 'About',
        ),
      ],
    );
  }
}
