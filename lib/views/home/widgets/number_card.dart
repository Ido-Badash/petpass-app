import "package:flutter/material.dart";

class NumberCard extends StatelessWidget {
  const NumberCard({
    required this.number,
    required this.text,
    super.key,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.borderWidth,
  });
  final double? width;
  final double? height;
  final Widget number;
  final Widget text;
  final Color? background;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: borderWidth ?? 8.0,
          color: borderColor ?? Colors.grey[700] ?? Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [number, text],
        ),
      ),
    );
  }

  static Widget classic(
    num? number,
    String text, {
    double? width,
    double? height,
    Color? background,
    Color? borderColor,
    double? borderWidth,
    BuildContext? context,
  }) {
    return Builder(
      builder: (ctx) {
        final theme = Theme.of(context ?? ctx);
        return NumberCard(
          width: width,
          height: height,
          number: Text(
            "$number",
            style: theme.textTheme.headlineSmall?.copyWith(
              color: Colors.lightBlue[200],
              fontWeight: FontWeight.w600,
            ),
          ),
          text: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
          ),
          background:
              background ??
              (Theme.of(ctx).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : const Color.fromARGB(255, 248, 248, 255)),
          borderWidth: borderWidth ?? 0.5,
          borderColor: borderColor,
        );
      },
    );
  }
}
