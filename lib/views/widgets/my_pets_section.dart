import "package:flutter/material.dart";

class MyPetsSection extends StatelessWidget {
  const MyPetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.teal[300],
      ),
    );
  }
}
