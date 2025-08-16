/*
GuideView
guides the user on how to install and connect the door
*/

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petpass/core/widgets/default_appbar.dart';

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
    // flag finishedGuide in DB as true
    FirebaseFirestore.instance.collection("flags").doc("main").set({
      "finishedGuide": true,
    });

    // Go to home page
    log("Navigating to Home page...", time: DateTime.now());
    Navigator.pushNamed(context, "/home");
  }
}
