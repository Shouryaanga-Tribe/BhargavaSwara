import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class TalaRecognitionScreen extends StatefulWidget {
  @override
  _TalaRecognitionScreenState createState() => _TalaRecognitionScreenState();
}

class _TalaRecognitionScreenState extends State<TalaRecognitionScreen> {
  String _detectedTala = "No analysis yet";
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecording = false;

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

  Future<void> _pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        _detectedTala = "Processing audio...";
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _detectedTala = "Detected Tala: Adi Tala (Placeholder)";
        });
      });
    }
  }

  Future<void> _startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      await _audioRecorder!.startRecorder(toFile: 'tala_recorded.wav');
      setState(() => _isRecording = true);
    }
  }

  Future<void> _stopRecording() async {
    await _audioRecorder!.stopRecorder();
    setState(() {
      _isRecording = false;
      _detectedTala = "Processing recording...";
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _detectedTala = "Detected Tala: Rupaka Tala (Placeholder)";
      });
    });
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _detectedTala,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAudioFile,
              child: Text("Pick an Audio File"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRecording ? null : _startRecording,
              child: Text("Start Recording"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : null,
              child: Text("Stop Recording"),
            ),
          ],
        ),
      ),
    );
  }
}
