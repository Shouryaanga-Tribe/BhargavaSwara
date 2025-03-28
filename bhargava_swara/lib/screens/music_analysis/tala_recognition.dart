import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TalaRecognitionScreen extends StatefulWidget {
  const TalaRecognitionScreen({super.key});

  @override
  _TalaRecognitionScreenState createState() => _TalaRecognitionScreenState();
}

class _TalaRecognitionScreenState extends State<TalaRecognitionScreen> {
  File? _selectedAudioFile;
  String _detectedTala = "No analysis yet";
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecording = false;
  String? _recordedFilePath;

  @override
  void initState() {
    super.initState();
    _audioRecorder = FlutterSoundRecorder();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    await _audioRecorder!.openRecorder();
    await Permission.microphone.request();
  }

  // Function to send audio file to Python backend and get the result
  Future<void> _analyzeAudio(File audioFile) async {
    setState(() {
      _detectedTala = "Processing audio...";
    });

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://localhost:5000/analyze-tala'), // Update with your backend URL
    );
    request.files.add(await http.MultipartFile.fromPath('audio', audioFile.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        setState(() {
          _detectedTala = "Detected Tala: $result";
        });
      } else {
        setState(() {
          _detectedTala = "Error: Failed to analyze (Status: ${response.statusCode})";
        });
      }
    } catch (e) {
      setState(() {
        _detectedTala = "Error: $e";
      });
    }
  }

  Future<void> _pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      _selectedAudioFile = File(result.files.single.path!);
      await _analyzeAudio(_selectedAudioFile!);
    }
  }

  Future<void> _startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      var tempDir = await getTemporaryDirectory();
      _recordedFilePath = '${tempDir.path}/tala_recorded.wav';
      await _audioRecorder!.startRecorder(toFile: _recordedFilePath);
      setState(() {
        _isRecording = true;
      });
    }
  }

  Future<void> _stopRecording() async {
    await _audioRecorder!.stopRecorder();
    setState(() {
      _isRecording = false;
    });

    if (_recordedFilePath != null) {
      File recordedFile = File(_recordedFilePath!);
      await _analyzeAudio(recordedFile);
    }
  }

  @override
  void dispose() {
    _audioRecorder!.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tala Recognition")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // File Upload Button
            ElevatedButton.icon(
              onPressed: _pickAudioFile,
              icon: Icon(Icons.file_upload),
              label: Text("Upload Audio File"),
            ),
            SizedBox(height: 10),

            // Recording Controls
            _isRecording
                ? ElevatedButton.icon(
                    onPressed: _stopRecording,
                    icon: Icon(Icons.stop),
                    label: Text("Stop Recording"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  )
                : ElevatedButton.icon(
                    onPressed: _startRecording,
                    icon: Icon(Icons.mic),
                    label: Text("Start Recording"),
                  ),
            SizedBox(height: 20),

            // Detected Tala Output
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _detectedTala,
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