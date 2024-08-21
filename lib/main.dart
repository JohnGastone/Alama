// ignore_for_file: unused_local_variable

import 'package:alamaapp/OnBoardingCarousel/SplashScreen.dart';
import 'package:alamaapp/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this
  final prefs = await SharedPreferences.getInstance(); // Add this
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false; // Add this

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Initialize with loaded theme
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Splashscreen(),
    );
  }
}
