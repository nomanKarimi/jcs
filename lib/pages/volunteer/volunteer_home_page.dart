import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/pages/volunteer/volunteer_navs/volunteer_history.dart';
import 'package:jcs/pages/volunteer/volunteer_navs/volunteer_home.dart';
import 'package:jcs/pages/volunteer/volunteer_navs/volunteer_profile.dart';
import 'package:jcs/pages/volunteer/volunteer_navs/volunteer_settings.dart';

import '../../constants.dart';




class VolunteerHomePage extends StatefulWidget {

  @override
  State<VolunteerHomePage> createState() => _VolunteerHomePageState();
}

class _VolunteerHomePageState extends State<VolunteerHomePage> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> pages = <Widget>[
    VolunteerHome(),
    VolunteerHistory(),
    VolunteerProfile(),
    VolunteerSettings(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined,size: 35,),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 35,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,size: 35,),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        onTap: _onItemTapped,

      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}




