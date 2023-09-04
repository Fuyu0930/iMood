import 'package:flutter/material.dart';
import 'pages/white_noise_page.dart';
import 'pages/game_page.dart';
import 'pages/hrv_page.dart';
import 'pages/meditation_page.dart';
import 'pages/home_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'myMood';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      // We start from the nevigation bar, which can lead us to different pages
      home: MoodNevigationBar(),
    );
  }
}

// Bottom nevigation bar reference: https://www.youtube.com/watch?v=18PVdmBOEQM&t=124s
// The nevigation bar is a stateful widget
class MoodNevigationBar extends StatefulWidget {
  const MoodNevigationBar({super.key});
  @override
  State<MoodNevigationBar> createState() => _MoodNevigationBarState();
}

class _MoodNevigationBarState extends State<MoodNevigationBar> {
  int _currentIndex = 2;
  // There are five pages, which are game page, white noise page,
  // home page (which plays the light music), meditation page, and HRV page (the page that users can check their status)
  final List<Widget> _children = [
    const GamePage(),
    const WhiteNoisePage(),
    const HomePage(),
    const MeditationPage(),
    const HRVPage(),
  ];

  // Set the state.
  // When we tap the bar on the scree, current idex will change to the index we want
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // In the body, the items are BottomNavigationBarItem
      // In the BottomNavigationBarItem, we can set the icon, label name, and the background color.
      body: _children[_currentIndex],
      backgroundColor: Color(0x00ffffff),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Game',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back),
            label: 'Video',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_rounded),
            label: 'Light Music',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Meditation',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Status',
            backgroundColor: Colors.transparent,
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
