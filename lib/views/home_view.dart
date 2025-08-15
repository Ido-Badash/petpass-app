import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petpass/core/widgets/default_appbar.dart';
import 'package:petpass/core/widgets/default_circular_progress_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        actionsPadding: const EdgeInsets.only(right: 8.0),
        actions: [
          if (kDebugMode)
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/welcome"),
              tooltip: "Welcome Page",
              icon: const Icon(Icons.waving_hand_outlined),
            ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Flexible(flex: 2, child: _buildSysStatusSection()),
          const SizedBox(height: 16.0),
          Flexible(flex: 2, child: _buildTodaysActivitySection()),
          const SizedBox(height: 16.0),
          Flexible(flex: 3, child: _buildMyPetsSection()),
          const SizedBox(height: 16.0),
          Flexible(flex: 3, child: _buildRecentActivitySection()),
        ],
      ),
    );
  }

  Widget _buildSysStatusSection() {
    return FutureBuilder<bool>(
      future: getSysStatus(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const DefaultCircularProgressIndicator();
        }
        final sysStatus = snapshot.data!;
        return Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(75, 255, 255, 255),
                Color.fromARGB(75, 0, 0, 255),
              ],
            ),
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.0,
              children: [
                const Text(
                  "Welcom Back!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sysStatus
                      ? "Your smart pet door is protecting your home"
                      : "Your smart pet door is currently inactive",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  "● System ${sysStatus ? "Online" : "Offline"}",
                  style: TextStyle(
                    color: sysStatus ? Colors.green : Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTodaysActivitySection() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildMyPetsSection() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildRecentActivitySection() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    );
  }

  /// Looks in the database to check if the system if online or offline
  /// returns true if online, false if offline
  Future<bool> getSysStatus() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("/door")
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
