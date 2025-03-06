import 'package:flutter/material.dart';

class LearnRagasScreen extends StatelessWidget {
  final List<Map<String, String>> ragas = [
    {
      'name': 'Yaman',
      'description': 'A soothing evening raga, associated with devotion and tranquility.',
      'aroha': 'S R G M P D N S',
      'avaroha': 'S N D P M G R S',
    },
    {
      'name': 'Bhairav',
      'description': 'A morning raga with a serious and meditative mood.',
      'aroha': 'S R G M P D N S',
      'avaroha': 'S N D P M G R S',
    },
    {
      'name': 'Bhairavi',
      'description': 'A versatile raga, often performed at the end of a concert.',
      'aroha': 'S R G M P D N S',
      'avaroha': 'S N D P M G R S',
    },
  ];

LearnRagasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learn Ragas')),
      body: ListView.builder(
        itemCount: ragas.length,
        itemBuilder: (context, index) {
          final raga = ragas[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(raga['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(raga['description']!),
                  Text('Aroha: ${raga['aroha']}'),
                  Text('Avaroha: ${raga['avaroha']}'),
                ],
              ),
              trailing: Icon(Icons.music_note),
              onTap: () {
                // Add functionality for detailed raga info or audio playback
              },
            ),
          );
        },
      ),
    );
  }
}
