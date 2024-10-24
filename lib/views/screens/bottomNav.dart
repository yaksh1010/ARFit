import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_project/views/widgets/constants.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({Key? key}) : super(key: key);

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: Color.fromARGB(255, 225, 104, 6),
        unselectedItemColor: Colors.white,
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.boy_rounded, size: 25),
            label: 'Muscules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[pageIdx], //pages index to have logic of moving screens
    );
  }
}
