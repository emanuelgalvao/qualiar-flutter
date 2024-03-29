import 'package:air_pollution_app/data/air_pollution_data.dart';
import 'package:air_pollution_app/data/location_list.dart';
import 'package:air_pollution_app/data/states_cities_list.dart';
import 'package:air_pollution_app/data/theme_provider.dart';
import 'package:air_pollution_app/screen/add_location_screen.dart';
import 'package:air_pollution_app/screen/location_details_screen.dart';
import 'package:air_pollution_app/screen/locations_screen.dart';
import 'package:air_pollution_app/screen/tabs_screen.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isDarkMode = preferences.getBool('isDarkMode') ?? false;
  return runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode: isDarkMode),
      child: const MyApp()
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocationList(),
        ),
        ChangeNotifierProvider(
          create: (_) => StatesCitiesList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AirPollutionData(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, theme, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: theme.getTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.home: (_) => const TabsScreen(),
            AppRoutes.locationDetails: (_) => const LocationDetailsScreen(),
            AppRoutes.locations: (_) => const LocationsScreen(),
            AppRoutes.addLocation: (_) => const AddLocationScreen(),
          },
        ),
      ),
    );
  }
}
