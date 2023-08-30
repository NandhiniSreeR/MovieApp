import 'package:flutter/material.dart';
import 'package:movie_app/app/ui/landing_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LandingScreen(),
      theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(175, 0, 0, 0))),
    );
  }
}
