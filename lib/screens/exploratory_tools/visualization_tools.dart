import 'package:flutter/material.dart';

class VisualizationToolsScreen extends StatelessWidget {
  const VisualizationToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Visualization Tools")),
      body: Center(
        child: Text(
          "Graphs for swara frequency, pitch distribution, etc.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
