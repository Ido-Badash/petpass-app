import "package:flutter/material.dart";
import "package:petpass/core/widgets/default_circular_progress_indicator.dart";
import "package:petpass/core/widgets/default_snapshot_on_error.dart";
import "package:petpass/data/shared_prefs.dart";

class SysStatusSection extends StatelessWidget {
  const SysStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPrefsData.getSysStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const DefaultCircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const DefaultSnapshotOnError(
            child: Text("Error loading sysStatus preferences"),
          );
        }
        return _buildContainer(context, snapshot.data ?? false);
      },
    );
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
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white30
              : Colors.black12,
        ),
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
      "Welcome Back!",
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildStatusText(bool sysStatus) {
    return Text(
      sysStatus
          ? "Your smart pet door is protecting your home"
          : "Your smart pet door is currently inactive",
      style: const TextStyle(fontSize: 14),
    );
  }

  Widget _buildSystemStatusText(bool sysStatus) {
    return Text(
      "● System ${sysStatus ? "Online" : "Offline"}",
      style: TextStyle(
        color: sysStatus ? Colors.green : Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
