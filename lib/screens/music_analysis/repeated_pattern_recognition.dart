import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class RepeatedPatternRecognitionScreen extends StatefulWidget {
  @override
  _RepeatedPatternRecognitionScreenState createState() => _RepeatedPatternRecognitionScreenState();
}

class _RepeatedPatternRecognitionScreenState extends State<RepeatedPatternRecognitionScreen> {
  String _analysisResult = "No file selected";

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _analysisResult = "Processing...";
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _analysisResult = "Repeated Patterns Detected: Pattern 1, Pattern 2 (Placeholder)";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repeated Pattern Recognition")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _pickFile, child: Text("Upload Audio File")),
            SizedBox(height: 20),
            Text(_analysisResult, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
