import 'package:air_pollution_app/screen/home_screen.dart';
import 'package:air_pollution_app/screen/location_details_screen.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.locationDetails: (_) => const LocationDetailsScreen()
      },
    );
  }
}