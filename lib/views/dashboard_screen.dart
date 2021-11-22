import 'package:flutter/material.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/explore_screen.dart';
import 'package:plasticity/views/groups/create_group_screen.dart';
import 'package:plasticity/views/groups/group_screen.dart';
import 'package:plasticity/views/message/message_screen.dart';
import 'package:plasticity/views/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

   int currentIndex;

  final List<Widget> children = [
    ExploreScreen(),
    GroupScreen(),
    CreateGroupScreen(),
    MessageScreen(),
    SettingsScreen()

  ];

  @override
  void initState() {
    setState(() {
      currentIndex = 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kColorPrimary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.5),
        currentIndex: currentIndex,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          // BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: ''),
        ],
      ),
    );
  }
}
