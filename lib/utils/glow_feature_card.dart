/*
GlowFeatureCard widget
*/

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:petpass/utils/custom_colors.dart';

class GlowFeatureCard extends StatelessWidget {
  final Widget? title;
  final Widget? description;
  final IconData? icon;
  final Color? iconBackgroundColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? radius;

  const GlowFeatureCard({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      width: width,
      height: height,
      color: backgroundColor,
      glowColor: foregroundColor,
      borderRadius: BorderRadius.circular(radius ?? 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) _buildIcon(),
          if (icon != null) const SizedBox(width: 20),
          Expanded(child: _buildTextSection()),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, color: foregroundColor, size: 25)),
    );
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null) title!,
        if (description != null) ...[const SizedBox(height: 4), description!],
      ],
    );
  }

  static Widget classic(
    BuildContext context, {
    String? title,
    String? description,
    IconData? icon,
    double? width,
    double? height,
  }) {
    return GlowFeatureCard(
      width:
          width ??
          MediaQuery.of(context).size.width * 0.9, // 90% of screen width
      height: height,
      title: Text(
        title ?? "title",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      description: Text(
        description ?? "description",
        style: TextStyle(color: Colors.white),
      ),
      icon: icon,
      iconBackgroundColor: CustomColors.darkBlueGrey,
      backgroundColor: Colors.black,
      foregroundColor: Colors.lightBlue[200],
    );
  }
}
