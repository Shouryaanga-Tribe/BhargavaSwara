import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CarnaticOrHindustaniFinderScreen extends StatefulWidget {
  const CarnaticOrHindustaniFinderScreen({super.key});

  @override
  _CarnaticOrHindustaniFinderScreenState createState() => _CarnaticOrHindustaniFinderScreenState();
}

class _CarnaticOrHindustaniFinderScreenState extends State<CarnaticOrHindustaniFinderScreen> {
  File? _selectedAudioFile;
  String _analysisResult = "No analysis yet";

  Future<void> _pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      setState(() {
        _selectedAudioFile = File(result.files.single.path!);
        _analysisResult = "Analyzing...";
      });

      // Placeholder for ML Model Processing
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _analysisResult = "Identified as: Carnatic (Placeholder)";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carnatic or Hindustani Finder")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _pickAudioFile,
              icon: Icon(Icons.file_upload),
              label: Text("Upload Audio File"),
            ),
            SizedBox(height: 20),

            _selectedAudioFile != null
                ? Text("Selected File: ${_selectedAudioFile!.path.split('/').last}")
                : Text("No file selected"),

            SizedBox(height: 20),

            Card(
              color: Colors.orange.shade50,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _analysisResult,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
