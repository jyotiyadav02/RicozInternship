import 'package:ecommerceappricoz/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name', // Change to your app's name
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xff4CAF50,
            <int, Color>{
              50: const Color(0xff4CAF50),
              100: const Color(0xff4CAF50),
              200: const Color(0xff4CAF50),
              300: const Color(0xff4CAF50),
              400: const Color(0xff4CAF50),
              500: const Color(0xff4CAF50),
              600: const Color(0xff4CAF50),
              700: const Color(0xff4CAF50),
              800: const Color(0xff4CAF50),
              900: const Color(0xff4CAF50),
            },
          ),
          // accentColor: Colors.blue, // Light theme accent color
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xff2196F3,
            <int, Color>{
              50: const Color(0xff2196F3),
              100: const Color(0xff2196F3),
              200: const Color(0xff2196F3),
              300: const Color(0xff2196F3),
              400: const Color(0xff2196F3),
              500: const Color(0xff2196F3),
              600: const Color(0xff2196F3),
              700: const Color(0xff2196F3),
              800: const Color(0xff2196F3),
              900: const Color(0xff2196F3),
            },
          ),
          accentColor: Colors.blue, // Dark theme accent color
        ),
      ),
      // themeMode: ThemeMode.system, // Enable system-wide dark mode
      home: const BottomNavigation(), // Renamed to BottomNavigation for clarity
    );
  }
}

