import 'package:breakaway/views/navigation_views/community_page.dart';
import 'package:breakaway/views/navigation_views/group_page.dart';
import 'package:breakaway/views/navigation_views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var uuid = Uuid();
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    CommunityView(),
    const GroupView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined), label: 'community'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'group'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        onTap: _navigateBottomBar,
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
