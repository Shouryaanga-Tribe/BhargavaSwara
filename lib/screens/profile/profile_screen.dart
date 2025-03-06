import 'package:flutter/material.dart';
import 'past_analyses_screen.dart';
import 'achievements_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile & History")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNavigationButton(context, "Past Analyses & Compositions", PastAnalysesScreen()),
            _buildNavigationButton(context, "Achievements & Learning Progress", AchievementsScreen()),
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
