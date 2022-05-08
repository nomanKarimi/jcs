import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/pages/activity_host/host_navs/host_event.dart';
import 'package:jcs/pages/activity_host/host_navs/host_settings.dart';

import '../../constants.dart';
import 'host_navs/host_home.dart';
import 'host_navs/host_volunteer.dart';




class HostHomePage extends StatefulWidget {

  @override
  State<HostHomePage> createState() => _HostHomePageState();
}

class _HostHomePageState extends State<HostHomePage> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> pages = <Widget>[
    HostHome(),
    HostVolunteer(),
    HostEvents(),
    HostSettings(),
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
            icon: Icon(Icons.group_rounded,size: 35,),
            label: 'Volunteer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note,size: 35,),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,size: 35,),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black87,
        onTap: _onItemTapped,

      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}




