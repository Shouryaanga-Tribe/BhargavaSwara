import 'package:flutter/material.dart';

class GenerateCompositionsScreen extends StatelessWidget {
  const GenerateCompositionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate New Compositions")),
      body: Center(
        child: Text(
          "Feature to generate new compositions coming soon!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
