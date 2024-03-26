import 'package:air_pollution_app/screen/about_screen.dart';
import 'package:air_pollution_app/screen/home_screen.dart';
import 'package:air_pollution_app/screen/locations_screen.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [HomeScreen(), LocationsScreen(), AboutScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body: _screens[_selectedTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedTabIndex,
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(AppIcons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.myLocations),
              label: 'Meus Locais',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.about),
              label: 'Sobre',
            )
          ],
        ),
      ),
    );
  }
}
