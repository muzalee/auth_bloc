import 'package:auth_bloc/utils/const/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _screens = [const HomeScreen(), const ProfileScreen()];
  final List<String> _titles = ['Home', 'Profile'];
  final List<IconData> _icons = [CupertinoIcons.house_alt, CupertinoIcons.person];
  final List<IconData> _filledIcons = [CupertinoIcons.house_alt_fill, CupertinoIcons.person_fill];

  int _index = 0;

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: _screens[_index],
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  //widget functions
  Widget _bottomNavigation() {
    return MediaQuery(
      data: const MediaQueryData(
          padding: EdgeInsets.only(bottom: 7) // here is the padding
      ),
      child: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() => _index = index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 10,
        items: _titles.asMap().map((index, value) => MapEntry(index,
          BottomNavigationBarItem(
            label: value,
            activeIcon: Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 10, 5),
              child: Icon(_filledIcons[index], color: ColorConst.primary),
            ),
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 10, 5),
              child: Icon(_icons[index]),
            ),
          ),
        )).values.toList(),
      ),
    );
  }
}