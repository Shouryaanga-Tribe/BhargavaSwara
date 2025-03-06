import 'package:flutter/material.dart';

class OrnamentationDetection extends StatelessWidget {
  OrnamentationDetection({super.key});

  final List<String> achievements = [
    "🎖 First Raga Identified",
    "🎼 10 Successful Analyses",
    "🔍 Identified 5 Ornamentations",
    "🎶 Created First Composition",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Achievements & Learning Progress")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(achievements[index]),
                  leading: const Icon(Icons.emoji_events, color: Colors.amber),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
