/*
HomeView
The home screen of the app
*/

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GlowIcon(Icons.pets, color: Colors.lightBlue[200]),
        titleSpacing: 0,
        title: const GlowText(
          "PetPass",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: GlowIcon(Icons.menu, color: Colors.lightBlue[200]),
          ),
        ],
      ),

      // Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8), // Space
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const GlowText(
                  "The Future Of",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GlowText(
                  "Pet Access",
                  style: TextStyle(
                    color: Colors.lightBlue[200],
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8), // Space
                const Text(
                  "AI-powered doorway exclusively for your pets",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24), // Space
                SizedBox(
                  width: 160,
                  height: 38,
                  child: GlowButton(
                    color: const Color.fromARGB(255, 0, 21, 177),
                    glowColor: const Color.fromARGB(255, 0, 21, 177),
                    borderRadius: BorderRadius.circular(
                      64,
                    ), // Makes border oval
                    onPressed: () {},
                    child: const GlowText(
                      "GET STARTED",
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 24), // Space
                Builder(
                  builder: (context) {
                    final width = MediaQuery.of(context).size.width;
                    return Image.asset(
                      "assets/images/home_image_1.png",
                      width: width * 0.75, // 75% of device width
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: Colors.black,
    );
  }
}
