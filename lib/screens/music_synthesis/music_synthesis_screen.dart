import 'package:flutter/material.dart';
import 'generate_compositions.dart';
import 'playback_export.dart';

class MusicSynthesisScreen extends StatelessWidget {
  const MusicSynthesisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music Synthesis")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNavigationButton(context, "Generate New Compositions", GenerateCompositionsScreen()),
            _buildNavigationButton(context, "Playback & Export", PlaybackExportScreen()),
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
