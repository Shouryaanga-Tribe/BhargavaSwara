import 'package:flutter/material.dart';
import 'music_analysis/music_analysis_screen.dart';
import 'exploratory_tools/exploratory_tools_screen.dart';
import 'music_synthesis/music_synthesis_screen.dart';
import 'profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bhargava Swara")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNavigationButton(context, "Music Analysis", MusicAnalysisScreen()),
            _buildNavigationButton(context, "Exploratory Tools", ExploratoryToolsScreen()),
            _buildNavigationButton(context, "Music Synthesis", MusicSynthesisScreen()),
            _buildNavigationButton(context, "Profile & History", ProfileScreen()),
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