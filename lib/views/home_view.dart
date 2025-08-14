import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petpass/core/widgets/default_appbar.dart';

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

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Home", style: TextStyle(fontSize: 40))],
        ),
      ),
    );
  }
}
