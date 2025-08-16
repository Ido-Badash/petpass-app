import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petpass/core/widgets/default_appbar.dart';
import 'package:petpass/views/home/widgets/my_pets_section.dart';
import 'package:petpass/views/home/widgets/recent_activity_section.dart';
import 'package:petpass/views/home/widgets/sys_status_section.dart';
import 'package:petpass/views/home/widgets/todays_activity_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        actionsPadding: const EdgeInsets.only(right: 8.0),
        actions: [if (kDebugMode) ..._buildDebugAppBarActions(context)],
      ),

      body: const Column(
        children: [
          SizedBox(height: 16.0),
          Expanded(flex: 1, child: SysStatusSection()),
          SizedBox(height: 16.0),
          Expanded(flex: 1, child: TodaysActivitySection()),
          SizedBox(height: 16.0),
          Expanded(flex: 2, child: MyPetsSection()),
          SizedBox(height: 16.0),
          Expanded(flex: 2, child: RecentActivitySection()),
        ],
      ),
    );
  }

  List<Widget> _buildDebugAppBarActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          log("Debug: Navigating to Welcome page...", time: DateTime.now());
          Navigator.pushNamed(context, "/welcome");
        },
        tooltip: "Welcome Page",
        icon: const Icon(Icons.waving_hand_outlined),
      ),
      IconButton(
        onPressed: () {
          log("Debug: Navigating to Guide page...", time: DateTime.now());
          Navigator.pushNamed(context, "/guide");
        },
        tooltip: "Guide Page",
        icon: const Icon(Icons.nordic_walking),
      ),
    ];
  }

  /// Looks in the database to check if the system if online or offline
  /// returns true if online, false if offline
  Future<bool> getSysStatus() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("door")
        .orderBy("timestamp")
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) {
      return false;
    }
    final doc = snapshot.docs.first;
    final status = doc["status"];
    return status == "online";
  }
}
