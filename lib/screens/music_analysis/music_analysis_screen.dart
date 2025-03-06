import 'package:flutter/material.dart';
import 'carnatic_hindustani_finder.dart';
import 'ornamentation_detection.dart';
import 'repeated_pattern_recognition.dart';
import 'tala_recognition.dart';
import 'raga_recognition.dart';

class MusicAnalysisScreen extends StatelessWidget {
  const MusicAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music Analysis")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNavigationButton(context, "Carnatic/Hindustani Identification", CarnaticOrHindustaniFinderScreen()),
            _buildNavigationButton(context, "Ornamentation/Alankar Detection", OrnamentationDetection()),
            _buildNavigationButton(context, "Repeated Pattern Recognition", RepeatedPatternRecognitionScreen()),
            _buildNavigationButton(context, "Tala Recognition", TalaRecognitionScreen()),
            _buildNavigationButton(context, "Raga Recognition", RagaRecognitionScreen()),
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
