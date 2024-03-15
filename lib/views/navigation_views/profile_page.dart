import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFCEDDD),
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Break',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'AWAY',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.red,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Gautam Sharma',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'gautammsharma',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ProfileCardView(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Achievement',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AchievementTile(level: 5),
                      SizedBox(width: 16),
                      AchievementTile(level: 4),
                      SizedBox(width: 16),
                      AchievementTile(level: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCardView extends StatelessWidget {
  const ProfileCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Adjust the width as needed
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDEB9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_events, color: Color(0xFF7149C6)),
              SizedBox(width: 8),
              Text('Level 6', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: 150 / 500,
            backgroundColor: Color.fromARGB(255, 203, 143, 213),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7149C6)),
          ),
          SizedBox(height: 4),
          Text('150/500', style: TextStyle(color: Color(0xFF7149C6))),
        ],
      ),
    );
  }
}

class AchievementTile extends StatelessWidget {
  final int level;
  const AchievementTile({Key? key, required this.level}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFFFDEB9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.black),
          const SizedBox(height: 8),
          Text(
            'Level $level',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
