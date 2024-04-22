import 'package:air_pollution_app/provider/theme_provider.dart';
import 'package:air_pollution_app/features/add_location/screen/add_location_screen.dart';
import 'package:air_pollution_app/features/details/screen/location_details_screen.dart';
import 'package:air_pollution_app/features/locations/screens/locations_screen.dart';
import 'package:air_pollution_app/core/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isDarkMode = preferences.getBool('isDarkMode') ?? false;
  return runApp(
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: isDarkMode),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (ctx, theme, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme.getTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (_) => const TabsScreen(),
          AppRoutes.locationDetails: (_) => const LocationDetailsScreen(),
          AppRoutes.locations: (_) => LocationsScreen(),
          AppRoutes.addLocation: (_) => const AddLocationScreen(),
        },
      ),
    );
  }
}
