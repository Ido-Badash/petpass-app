/*
DefaultAppBar
the default app bar for the application
*/

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const DefaultAppBar({super.key, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor ?? theme.scaffoldBackgroundColor,
      leading: GlowIcon(Icons.pets, color: theme.iconTheme.color),
      titleSpacing: 0,
      title: GlowText(
        "PetPass",
        style: theme.appBarTheme.titleTextStyle ?? theme.textTheme.titleLarge,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
