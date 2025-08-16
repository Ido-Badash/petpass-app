import "package:flutter/material.dart";
import "package:petpass/views/home/widgets/number_card.dart";

class TodaysActivitySection extends StatelessWidget {
  const TodaysActivitySection({super.key});

  Future<Map<String, int>> _getActivity() async {
    try {
      return {"entries": 0, "exits": 0, "blocked": 0};
    } catch (e) {
      return {"entries": 0, "exits": 0, "blocked": 0};
    }
  }

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
          FutureBuilder<Map<String, int>>(
            future: _getActivity(),
            builder: (context, snapshot) {
              final activity =
                  snapshot.data ?? {"entries": 0, "exits": 0, "blocked": 0};
              return Row(
                children: [
                  Expanded(
                    child: NumberCard.classic(
                      activity["entries"] ?? 0,
                      "Entries",
                    ),
                  ),
                  Expanded(
                    child: NumberCard.classic(activity["exits"] ?? 0, "Exits"),
                  ),
                  Expanded(
                    child: NumberCard.classic(
                      activity["blocked"] ?? 0,
                      "Blocked",
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
