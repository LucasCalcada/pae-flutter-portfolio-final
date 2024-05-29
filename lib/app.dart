import 'package:flutter/material.dart';
import 'package:portfolio/pages/homepage.dart';
import 'package:portfolio/app_themes.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: Themes.getCurrentThemeMode(context),
    );
  }
}