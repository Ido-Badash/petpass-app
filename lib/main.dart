import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/core/app_theme.dart';
import 'package:petpass/views/welcome_view.dart';

void main() {
  runApp(
    GlowTheme(
      lightTheme: GlowThemeData(glowColor: Colors.blueAccent[100]),
      darkTheme: GlowThemeData(glowColor: Colors.blueAccent[100]),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetPass',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // auto-switch based on device settings
      home: const WelcomeView(),
    );
  }
}
