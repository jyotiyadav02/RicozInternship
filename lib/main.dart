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
            0xffDB3022,
            <int, Color>{
              50: const Color(0xffDB3022),
              100: const Color(0xffDB3022),
              200: const Color(0xffDB3022),
              300: const Color(0xffDB3022),
              400: const Color(0xffDB3022),
              500: const Color(0xffDB3022),
              600: const Color(0xffDB3022),
              700: const Color(0xffDB3022),
              800: const Color(0xffDB3022),
              900: const Color(0xffDB3022),
            },
          ),
          // accentColor: Colors.blue, // Light theme accent color
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xff1E1E1E,
            <int, Color>{
              50: const Color(0xff1E1E1E),
              100: const Color(0xff1E1E1E),
              200: const Color(0xff1E1E1E),
              300: const Color(0xff1E1E1E),
              400: const Color(0xff1E1E1E),
              500: const Color(0xff1E1E1E),
              600: const Color(0xff1E1E1E),
              700: const Color(0xff1E1E1E),
              800: const Color(0xff1E1E1E),
              900: const Color(0xff1E1E1E),
            },
          ),
          accentColor: Colors.blue, // Dark theme accent color
        ),
      ),
      themeMode: ThemeMode.system, // Enable system-wide dark mode
      home: const BottomNavigation(), // Renamed to BottomNavigation for clarity
    );
  }
}
