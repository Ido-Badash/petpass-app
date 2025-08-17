import "package:flutter/material.dart";
import "package:petpass/core/widgets/default_circular_progress_indicator.dart";
import "package:petpass/core/widgets/default_snapshot_on_error.dart";
import "package:petpass/data/shared_prefs.dart";
import "package:petpass/views/home/widgets/number_card.dart";

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
          FutureBuilder<List<int>>(
            future: SharedPrefsData.getSysActivity(),
            builder: (context, snapshot) {
              final List<int> activity = snapshot.data ?? [0, 0, 0];
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const DefaultCircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const DefaultSnapshotOnError(
                  child: Text("Error loading sysActivity preferences"),
                );
              }
              return Row(
                children: [
                  Expanded(child: NumberCard.classic(activity[0], "Entries")),
                  Expanded(child: NumberCard.classic(activity[1], "Exits")),
                  Expanded(child: NumberCard.classic(activity[2], "Blocked")),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
