import 'package:breakaway/views/group_chat.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';

class CommunityView extends StatefulWidget {
  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom List Tile',
      home: Scaffold(
        backgroundColor: const Color(0xFFFCEDDD),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFCEDDD),
          centerTitle: true,
          title: const Text(
            'Break AWAY',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: CustomListTile(
                icon: group['icon'],
                name: group['name'],
                members: group['members'],
                badgeCount: group['badgeCount'],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String icon;
  final String name;
  final int members;
  final int badgeCount;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.name,
    required this.members,
    required this.badgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    return ListTile(
      onTap: () {
        MaterialPageRoute(
            builder: (context) =>
                GroupChat(title: "football", userid: uuid.v1()));
      },
      tileColor: const Color(0xFFFFDEB9),
      leading: Text(
        icon,
        style: const TextStyle(
          fontSize: 24.0,
        ),
      ),
      title: Text(name),
      trailing: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          badgeCount.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text('$members members'),
    );
  }
}

final List<Map<String, dynamic>> groups = [
  {
    'icon': '⚽',
    'name': 'Football Strickers',
    'members': 2125,
    'badgeCount': 25,
  },
  {
    'icon': '🏐',
    'name': 'VolleyBall',
    'members': 252,
    'badgeCount': 30,
  },
  {
    'icon': '🎾',
    'name': 'Tennis',
    'members': 652,
    'badgeCount': 12,
  },
  {
    'icon': '🏸',
    'name': 'Badminton',
    'members': 1652,
    'badgeCount': 15,
  },
];
