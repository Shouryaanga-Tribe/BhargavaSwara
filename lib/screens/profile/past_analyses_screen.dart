import 'package:flutter/material.dart';

class PastAnalysesScreen extends StatelessWidget {
  final List<String> pastAnalyses = [
    "Carnatic vs Hindustani - Jan 28, 2025",
    "Raga Recognition - Feb 5, 2025",
    "New Composition - Feb 10, 2025",
  ];

  PastAnalysesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Past Analyses & Compositions")),
      body: ListView.builder(
        itemCount: pastAnalyses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pastAnalyses[index]),
            leading: Icon(Icons.history),
            onTap: () {
              // Future: Navigate to detailed view
            },
          );
        },
      ),
    );
  }
}
