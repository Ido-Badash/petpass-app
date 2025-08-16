import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/core/app_theme.dart';
import 'package:petpass/core/widgets/default_circular_progress_indicator.dart';
import 'package:petpass/door/init_connection.dart';
import 'package:petpass/firebase_options.dart';
import 'package:petpass/utils/db_helpers.dart';
import 'package:petpass/views/guide_view.dart';
import 'package:petpass/views/home/home_view.dart';
import 'package:petpass/views/welcome_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // init connection
  await initConnection();

  /*
  COLLECTIONS
  - /flags (for UI features flags)
  - /door (for door-related features)
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
            return const Scaffold(body: DefaultCircularProgressIndicator());
          }
          if (snapshot.data!) {
            // Guide finished, always show HomeView
            return const HomeView();
          }
          // Guide not finished, show WelcomeView
          return const WelcomeView();
        },
      ),
    );
  }

  /// Checks Firestore for finishedGuide flag in flags collection.
  Future<bool> _finishedGuide() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("/flags")
          .orderBy("timestamp", descending: true)
          .limit(1)
          .get();
      if (snapshot.docs.isEmpty) {
        return false;
      }
      final doc = snapshot.docs.first;
      final field = "finishedGuide";
      return DBHelpers.feildExists(doc, field) && doc[field] == true;
    } catch (e) {
      return false;
    }
  }
}
