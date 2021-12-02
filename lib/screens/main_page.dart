import 'package:capstone/screens/article_page.dart';
import 'package:capstone/screens/home_page.dart';
import 'package:capstone/screens/vaccine_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'main_page';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  List<Widget> _listWidget = [
    HomePage(),
    VaccinePage(),
    ArticlePage(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map_outlined),
      label: 'Vaccine',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      label: 'Article',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listWidget[_bottomNavIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _bottomNavIndex,
            items: _bottomNavBarItems,
            onTap: _onBottomNavTapped,
          ),
        ));
  }
}
