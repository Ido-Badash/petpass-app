import "package:flutter/material.dart";
import "package:petpass/views/widgets/number_card.dart";

class TodaysActivitySection extends StatelessWidget {
  const TodaysActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Today's Activity",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8.0), // Space

          Row(
            children: [
              Expanded(child: NumberCard.classic(12, "Entries")),
              Expanded(child: NumberCard.classic(8, "Exits")),
              Expanded(child: NumberCard.classic(2, "Blocked")),
            ],
          ),
        ],
      ),
    );
  }
}
