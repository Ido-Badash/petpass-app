import 'package:flutter/material.dart';
import 'package:petpass/core/custom_colors.dart';

class FeatureStepRow extends StatelessWidget {
  const FeatureStepRow({
    required this.stepText,
    required this.featureCard,
    super.key,
    this.circleColor,
    this.lineColor,
    this.showLine = true,
    this.circleSize = 30,
    this.lineHeight = 64,
    this.spacing = 16.0,
  });

  final String stepText;
  final Color? circleColor;
  final Color? lineColor;
  final bool showLine;
  final double circleSize;
  final double lineHeight;
  final Widget featureCard;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color:
                      circleColor ??
                      (Theme.of(context).brightness == Brightness.dark
                          ? theme.colorScheme.onSecondary
                          : CustomColors.lightBlue),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: lineColor ?? theme.colorScheme.secondary,
                    width: 0.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(stepText, style: const TextStyle(fontSize: 18)),
              ),
              Container(
                width: 1,
                height: lineHeight,
                color: showLine
                    ? lineColor ?? theme.colorScheme.secondary.withAlpha(204)
                    : Colors.transparent,
              ),
            ],
          ),
        ),
        SizedBox(width: spacing),
        Flexible(flex: 5, child: featureCard),
      ],
    );
  }
}
