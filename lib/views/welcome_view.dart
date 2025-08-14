/*
WelcomeView
The home screen of the app
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/core/custom_colors.dart';
import 'package:petpass/core/widgets/default_appbar.dart';
import 'package:petpass/core/widgets/floating_widget.dart';
import 'package:petpass/core/widgets/feature_step_row.dart';
import 'package:petpass/core/widgets/glow_feature_card.dart';
import 'package:scanning_effect/scanning_effect.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:floating_animation/floating_animation.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  // spi = smooth page indicator
  final PageController _spiController = PageController();
  final int imagesCount = 3;
  final ScrollController _scrollController = ScrollController();
  Color? initialMoreInfoColor;
  double moreInfoOpacity = 1.0;

  @override
  void dispose() {
    _spiController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initialMoreInfoColor =
        Theme.of(context).textTheme.bodyMedium?.color?.withAlpha(178) ??
        Colors.white70;
    _scrollController.addListener(() {
      setState(() {
        final double pixels = _scrollController.position.pixels;
        final double fadeSpeed = 100.0; // lower number = faster fade
        moreInfoOpacity = (1.0 - (pixels / fadeSpeed)).clamp(0.0, 1.0);
      });
    });
    return Scaffold(appBar: DefaultAppBar(), body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [_buildScanningEffect(), _buildContentColumn()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white38
                  : Colors.black38,
            ),
          ), // Space
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
        Text("How It Works", style: Theme.of(context).textTheme.headlineMedium),
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
          showLine: false,
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
        Text(
          "Smart Features",
          style: Theme.of(context).textTheme.headlineMedium,
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
      scanningLinePadding: const EdgeInsets.all(0),
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
        Stack(
          children: [
            SizedBox(
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: moreInfoOpacity,
                child: Column(
                  children: [
                    Text(
                      "More info",
                      style: TextStyle(color: initialMoreInfoColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: initialMoreInfoColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        const GlowText(
          "The Future Of",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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
        const Text("AI-powered doorway exclusively for your pets"),
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
        onPressed: () => _onGetStartedPressed,
        child: const GlowText(
          "GET STARTED",
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void _onGetStartedPressed() {
    // 1. TODO: send massage to the DB so this view "WelcomeView" wont show up again when opening the app
    // 2. TODO: move to the HomeView
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
      duration: const Duration(seconds: 2, milliseconds: 500),
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
