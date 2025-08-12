/*
HomeView
The home screen of the app
*/

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // spi = smooth page indicator
  final PageController _spiController = PageController();
  final int imagesCount = 3;

  @override
  void dispose() {
    _spiController.dispose();
    super.dispose();
  }

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
                Column(
                  children: [
                    _buildImagesPageView(),
                    SizedBox(height: 12), // Space
                    _buildImagesPageIndicator(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: Colors.black,
    );
  }

  Widget _buildImagesPageView() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _spiController,
        itemBuilder: _imagesItemBuilder,
        itemCount: imagesCount,
      ),
    );
  }

  Widget? _imagesItemBuilder(BuildContext context, int index) {
    return Builder(
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        // Use 1-based indexing for asset filenames
        final imgIndex = index + 1;
        return Image.asset(
          "assets/images/pets_scan_$imgIndex.png",
          width: width * 0.75, // 75% of device width
        );
      },
    );
  }

  Widget _buildImagesPageIndicator() {
    return Container(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: _spiController,
        count: imagesCount,
        onDotClicked: (int idx) {
          _spiController.animateToPage(
            idx,
            duration: Durations.long4,
            curve: Curves.easeInOutCubicEmphasized,
          );
        },
      ),
    );
  }
}
