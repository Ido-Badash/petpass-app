/*
BouncingWidget
A widget that uses SlideTransition and Animation to create
a bouncing effect
*/

import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  final Widget? child;

  const BouncingWidget({super.key, this.child});

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    _floatingAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.04), // negative for up, positive for down
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _floatingAnimation,
      child: Padding(padding: const EdgeInsets.all(8.0), child: widget.child),
    );
  }
}
