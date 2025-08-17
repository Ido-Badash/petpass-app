/*
GuideView
guides the user on how to install and connect the door
*/

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petpass/core/widgets/default_appbar.dart';
import 'package:petpass/utils/shared_prefs.dart';

class GuideView extends StatelessWidget {
  const GuideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _onDonePressed(context),
          child: const Text("Done", style: TextStyle(fontSize: 26)),
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }

  void _onDonePressed(BuildContext context) {
    // save in shared prefs that the user finished the guide
    log("Saving finishedGuide into SharedPreferences", time: DateTime.now());
    SharedPrefsUtil.setFinishedGuide(value: true);

    // go to home page
    log("Navigating to Home page...", time: DateTime.now());
    Navigator.pushNamed(context, "/home");
  }
}
