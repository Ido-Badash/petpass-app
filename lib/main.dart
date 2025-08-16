import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/core/app_theme.dart';
import 'package:petpass/core/widgets/default_circular_progress_indicator.dart';
import 'package:petpass/firebase_options.dart';
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

  // firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /*
  COLLECTIONS
  - flags (for UI features flags)
  - door (for door-related features)
  */

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
      home: FutureBuilder<bool>(
        future: _finishedGuide(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")),
            );
          }
          if (!snapshot.hasData) {
            log("Loading Firebase data...", time: DateTime.now());
            return const Scaffold(body: DefaultCircularProgressIndicator());
          }
          if (snapshot.data!) {
            // Guide finished, always show HomeView
            log(
              "User finished guide before, Navigating to Home page...",
              time: DateTime.now(),
            );
            return const HomeView();
          }
          // Guide not finished, show WelcomeView
          log(
            "User didnt finish guide, Navigating to Welcome page...",
            time: DateTime.now(),
          );
          return const WelcomeView();
        },
      ),
    );
  }

  /// Checks Firestore for finishedGuide flag in flags collection.
  Future<bool> _finishedGuide() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("flags")
          .doc("main")
          .get();
      if (!doc.exists) {
        return false;
      }
      return doc["finishedGuide"] == true;
    } catch (e) {
      return false;
    }
  }
}
