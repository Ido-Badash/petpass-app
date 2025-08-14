/*
GlowFeatureCard widget
*/

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

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
    final theme = Theme.of(context);
    return GlowContainer(
      width: width,
      height: height,
      color: backgroundColor ?? theme.scaffoldBackgroundColor,
      glowColor: foregroundColor ?? theme.colorScheme.secondary,
      borderRadius: BorderRadius.circular(radius ?? 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) _buildIcon(context),
          if (icon != null) const SizedBox(width: 20),
          Expanded(child: _buildTextSection(context)),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color:
            iconBackgroundColor ??
            Theme.of(context).iconTheme.color?.withAlpha(25),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: foregroundColor ?? Theme.of(context).iconTheme.color,
          size: 25,
        ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (title != null)
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.titleMedium!,
            child: title!,
          ),
        if (description != null) ...[
          const SizedBox(height: 4),
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.bodyMedium!,
            child: description!,
          ),
        ],
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
    final theme = Theme.of(context);
    return GlowFeatureCard(
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      height: height,
      title: Text(
        title ?? "title",
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      description: Text(
        description ?? "description",
        style: theme.textTheme.bodyMedium,
      ),
      icon: icon,
      iconBackgroundColor: theme.iconTheme.color?.withAlpha(25),
      backgroundColor: theme.scaffoldBackgroundColor,
      foregroundColor: theme.colorScheme.secondary,
    );
  }
}
