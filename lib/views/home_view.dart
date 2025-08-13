/*
HomeView
The home screen of the app
*/

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:scanning_effect/scanning_effect.dart';
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
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.black,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildBody() {
    return Stack(children: [_buildScanningEffect(), _buildContentColumn()]);
  }

  Widget _buildScanningEffect() {
    return ScanningEffect(
      enableBorder: false,
      scanningColor: const Color.fromARGB(50, 129, 212, 250),
      delay: const Duration(seconds: 0),
      duration: const Duration(seconds: 5),
      scanningLinePadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 9,
      ),
      child: const SizedBox.expand(),
    );
  }

  Widget _buildContentColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8), // Space
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitleSection(),
              const SizedBox(height: 24), // Space
              _buildGetStartedButton(),
              const SizedBox(height: 24), // Space
              _buildImagesSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Column(
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
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: 160,
      height: 38,
      child: GlowButton(
        color: const Color.fromARGB(255, 0, 21, 177),
        glowColor: const Color.fromARGB(255, 0, 21, 177),
        borderRadius: BorderRadius.circular(64), // Makes border oval
        onPressed: () {},
        child: const GlowText(
          "GET STARTED",
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildImagesSection() {
    return Column(
      children: [
        _buildImagesPageView(),
        const SizedBox(height: 24), // Space
        _buildImagesPageIndicator(),
      ],
    );
  }

  Widget _buildImagesPageView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: PageView.builder(
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _spiController,
        itemBuilder: _imagesItemBuilder,
        itemCount: imagesCount,
      ),
    );
  }

  Widget? _imagesItemBuilder(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75),
      child: Image.asset("assets/images/home_image_${index + 1}.png"),
    );
  }

  Widget _buildImagesPageIndicator() {
    return Container(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: _spiController,
        count: imagesCount,
        effect: WormEffect(dotWidth: 12, dotHeight: 12),
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
