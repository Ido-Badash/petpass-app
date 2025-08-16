import "package:flutter/material.dart";

class SysStatusSection extends StatelessWidget {
  const SysStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sysStatus = true; // online
    return _buildContainer(context, sysStatus);
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
      "Welcome Back!",
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
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
