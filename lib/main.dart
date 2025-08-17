import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/core/app_theme.dart';
import 'package:petpass/core/widgets/default_circular_progress_indicator.dart';
import 'package:petpass/core/widgets/default_snapshot_on_error.dart';
import 'package:petpass/data/shared_prefs.dart';
import 'package:petpass/views/guide/guide_view.dart';
import 'package:petpass/views/home/home_view.dart';
import 'package:petpass/views/welcome/welcome_view.dart';

Future<void> main() async {
  // init widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // fullscreen with swipe
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // makes it no horizontal mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // run app
  runApp(
    GlowTheme(
      lightTheme: GlowThemeData(glowColor: Colors.blueAccent[100]),
      darkTheme: GlowThemeData(glowColor: Colors.blueAccent[100]),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PetPass",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // auto-switch based on device settings
      routes: {
        "/welcome": (context) => const WelcomeView(),
        "/guide": (context) => const GuideView(),
        "/home": (context) => const HomeView(),
      },
      home: _startupView(),
    );
  }

  Widget _startupView() {
    return FutureBuilder<bool>(
      future: SharedPrefsData.getFinishedGuide(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const DefaultCircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const DefaultSnapshotOnError(
            child: Text("Error loading finishedGuide preferences"),
          );
        }
        final finishedGuide = snapshot.data ?? false;
        return finishedGuide ? const HomeView() : const WelcomeView();
      },
    );
  }
}
