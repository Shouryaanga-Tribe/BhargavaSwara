import 'package:flutter/material.dart';
import 'carnatic_pattern_explorer.dart';
import 'visualization_tools.dart';

class ExploratoryToolsScreen extends StatelessWidget {
  const ExploratoryToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exploratory Tools")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNavigationButton(context, "Carnatic Pattern Explorer", CarnaticPatternExplorerScreen()),
            _buildNavigationButton(context, "Visualization Tools", VisualizationToolsScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        child: Text(title),
      ),
    );
  }
}
