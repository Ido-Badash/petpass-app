import 'package:flutter/material.dart';
import 'package:petpass/core/widgets/default_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home", style: TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/welcome"),
              child: const Text(
                "debug: back to welcome page",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
