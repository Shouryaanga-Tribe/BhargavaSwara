import 'package:flutter/material.dart';

class PlaybackExportScreen extends StatelessWidget {
  const PlaybackExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Playback & Export")),
      body: Center(
        child: Text(
          "Feature to playback and export music coming soon!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
