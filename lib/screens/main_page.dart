import 'package:capstone/screens/article_page.dart';
import 'package:capstone/screens/home_page.dart';
import 'package:capstone/screens/vaccines_page.dart';
import 'package:capstone/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'main_page';

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    const HomePage(),
    const VaccinePage(),
    const ArticlePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.map_outlined),
      label: 'Vaccine',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      label: 'Article',
    ),
  ];

  final List<AppBar> _appBar = [
    AppBar(
      title: const Text('VaCare',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer());
        },
      ),
    ),
    AppBar(
      title: const Text('Vaccine',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer());
        },
      ),
    ),
    AppBar(
      title: const Text('Article',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer());
        },
      ),
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
        drawer: const NavigationDrawer(),
        appBar: _appBar[_bottomNavIndex],
        body: _listWidget[_bottomNavIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
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
