import 'package:flutter/material.dart';
import 'custom_colors.dart';

class FeatureStepRow extends StatelessWidget {
  final String stepText;
  final Color? circleColor;
  final Color? lineColor;
  final bool showLine;
  final double circleSize;
  final double lineHeight;
  final Widget featureCard;
  final double spacing;

  const FeatureStepRow({
    super.key,
    required this.stepText,
    required this.featureCard,
    this.circleColor = CustomColors.deepBlue,
    this.lineColor,
    this.showLine = true,
    this.circleSize = 30,
    this.lineHeight = 64,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
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
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  stepText,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              if (showLine)
                Container(
                  width: 1,
                  height: lineHeight,
                  color: lineColor ?? Colors.lightBlue[200]?.withAlpha(200),
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
