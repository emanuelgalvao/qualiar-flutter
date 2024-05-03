import 'package:air_pollution_app/features/about/screen/about_screen.dart';
import 'package:air_pollution_app/features/home/screen/home_screen.dart';
import 'package:air_pollution_app/features/locations/screens/locations_screen.dart';
import 'package:air_pollution_app/features/world_cities/screen/world_cities_screen.dart';
import 'package:flutter/material.dart';

import '../util/app_icons.dart';

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
    _screens = [
      HomeScreen(),
      LocationsScreen(),
      WorldCitiesScreen(),
      AboutScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body: _screens[_selectedTabIndex],
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(AppIcons.worldCities),
              label: 'Mundo',
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
