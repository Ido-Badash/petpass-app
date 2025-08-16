import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:petpass/views/widgets/default_circular_progress_indicator.dart";
import "package:petpass/utils/db_helpers.dart";

class SysStatusSection extends StatelessWidget {
  const SysStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getSysStatus(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const DefaultCircularProgressIndicator();
        }
        final sysStatus = snapshot.data!;
        return _buildContainer(context, sysStatus);
      },
    );
  }

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
    final status = DBHelpers.feildExists(doc, "status") ? doc["status"] : null;
    return status == "online";
  }

  Widget _buildContainer(BuildContext context, bool sysStatus) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(75, 255, 255, 255),
            Color.fromARGB(75, 80, 80, 255),
          ],
        ),
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildContent(sysStatus),
      ),
    );
  }

  Widget _buildContent(bool sysStatus) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWelcomeText(),
        _buildStatusText(sysStatus),
        _buildSystemStatusText(sysStatus),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      "Welcom Back!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStatusText(bool sysStatus) {
    return Text(
      sysStatus
          ? "Your smart pet door is protecting your home"
          : "Your smart pet door is currently inactive",
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }

  Widget _buildSystemStatusText(bool sysStatus) {
    return Text(
      "● System ${sysStatus ? "Online" : "Offline"}",
      style: TextStyle(
        color: sysStatus ? Colors.green : Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
