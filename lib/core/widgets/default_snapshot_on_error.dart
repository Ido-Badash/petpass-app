import 'package:flutter/material.dart';

class DefaultSnapshotOnError extends StatelessWidget {
  const DefaultSnapshotOnError({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.red.shade50,
        margin: const EdgeInsets.all(24),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              child ??
                  Text(
                    "Something went wrong",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
