/*
HomeView
The home screen of the app
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/utils/custom_colors.dart';
import 'package:petpass/utils/widgets/floating_widget.dart';
import 'package:petpass/utils/widgets/feature_step_row.dart';
import 'package:petpass/utils/widgets/glow_feature_card.dart';
import 'package:scanning_effect/scanning_effect.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:floating_animation/floating_animation.dart';

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
          onPressed: () {}, // TODO: make menu button do something
          icon: GlowIcon(Icons.menu, color: Colors.lightBlue[200]),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [_buildScanningEffect(), _buildContentColumn()],
            ),
          ),
          _buildSmartFeaturesSection(),
          SizedBox(height: 64), // Space
          _buildHowItWorksSection(),
          SizedBox(height: 64), // Space
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Column(
      children: [
        const Text(
          "How It Works",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        const SizedBox(height: 30), // Space
        FeatureStepRow(
          stepText: "1",
          featureCard: GlowFeatureCard.classic(
            context,
            title: "Register Your Pets",
            description:
                "Scan your pets using the PetPass app to register their unique biometric data.",
          ),
        ),
        const SizedBox(height: 24), // Space
        FeatureStepRow(
          stepText: "2",
          featureCard: GlowFeatureCard.classic(
            context,
            title: "Install PetPass Door",
            description:
                "Our easy installation process takes less than 30 minutes to set up.",
          ),
        ),
        const SizedBox(height: 24), // Space
        FeatureStepRow(
          stepText: "3",
          lineColor: Colors.transparent,
          featureCard: GlowFeatureCard.classic(
            context,
            title: "Enjoy Freedom",
            description:
                "Your pets can come and go safely while you monitor activity through the app.",
          ),
        ),
      ],
    );
  }

  Widget _buildSmartFeaturesSection() {
    return Column(
      children: [
        const Text(
          "Smart Features",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        const SizedBox(height: 30), // Space
        GlowFeatureCard.classic(
          context,
          title: "AI Recognition",
          description:
              "Advanced technology that recognizes only your registered pets.",
          icon: Icons.linked_camera_outlined,
        ),
        const SizedBox(height: 24), // Space
        GlowFeatureCard.classic(
          context,
          title: "Enhanced Security",
          description: "Keeps unwanted animals away from your home.",
          icon: CupertinoIcons.shield_lefthalf_fill,
        ),
        const SizedBox(height: 24), // Space
        GlowFeatureCard.classic(
          context,
          title: "Mobile Control",
          description: "Monitor and control access from your smartphone.",
          icon: Icons.phone_android,
        ),
      ],
    );
  }

  Widget _buildScanningEffect() {
    return ScanningEffect(
      enableBorder: false,
      scanningColor: Colors.lightBlue[200]!,
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
        const SizedBox(height: 16), // Space
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
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 80,
            child: FloatingAnimation(
              direction: FloatingDirection.up,
              icon: Icons.auto_awesome_outlined,
              selectedShape: 'icon',
              shapeColors: {'icon': Colors.lightBlue[200]!},
              spawnRate: 0.5,
              maxShapes: 20,
              enableRotation: true,
              enablePulse: true,
            ),
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
        color: CustomColors.deepBlue,
        glowColor: CustomColors.deepBlue,
        borderRadius: BorderRadius.circular(64), // Makes border oval
        onPressed: () {}, // TODO: make "GET STARTED" button do something
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
    return FloatingWidget(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0), // Add extra top padding
          child: Container(
            width:
                MediaQuery.of(context).size.width *
                0.8, // 80% of the screen width
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/images/home_image_${index + 1}.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagesPageIndicator() {
    return Container(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: _spiController,
        count: imagesCount,
        effect: const WormEffect(
          dotWidth: 12,
          dotHeight: 12,
          activeDotColor: CustomColors.deepBlue,
        ),
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
