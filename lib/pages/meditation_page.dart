import 'package:flutter/material.dart';
import 'white_noise_page.dart';
import 'game_page.dart';
import 'hrv_page.dart';
import 'home_page.dart';
import 'focus_meditation_page.dart';
import 'progress_relax_page.dart';
import 'vipassana_page.dart';
import 'yoga_meditation_page.dart';

// The meditation page is a stateful widget
class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Meditation',
          style: TextStyle(
            fontFamily: 'CrimsonText',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          // There are four videos
          children: [
            FocusMeditation(),
            YogaMeditation(),
            ProgressRelax(),
            Vipassana(),
          ],
        ),
      ),
    );
  }
}

// For each video, we will set up a stateful widget represented as a card.
// The card contains the picture and the title, which corresponding to each scenes.
// When users click the card, the onTap and MaterialPageRoute will guid users to the corresponding pages.

class FocusMeditation extends StatefulWidget {
  const FocusMeditation({super.key});

  @override
  State<FocusMeditation> createState() => _FocusMeditationState();
}

class _FocusMeditationState extends State<FocusMeditation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FocusMeditationPage(),
          ),
        );
      },
      child: Center(
        child: Container(
          width: 350,
          height: 200,
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/focus.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Focus Meditation',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressRelax extends StatefulWidget {
  const ProgressRelax({super.key});

  @override
  State<ProgressRelax> createState() => _ProgressRelaxState();
}

class _ProgressRelaxState extends State<ProgressRelax> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProgressiveRelaxPage(),
          ),
        );
      },
      child: Center(
        child: Container(
          width: 350,
          height: 200,
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/relaxation.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Progressive Relaxation',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Vipassana extends StatefulWidget {
  const Vipassana({super.key});

  @override
  State<Vipassana> createState() => _VipassanaState();
}

class _VipassanaState extends State<Vipassana> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VipassanaPage(),
          ),
        );
      },
      child: Center(
        child: Container(
          width: 350,
          height: 200,
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/vipassana.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Vipassana Meditation',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YogaMeditation extends StatefulWidget {
  const YogaMeditation({super.key});

  @override
  State<YogaMeditation> createState() => _YogaMeditationState();
}

class _YogaMeditationState extends State<YogaMeditation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => YogaMeditationPage(),
          ),
        );
      },
      child: Center(
        child: Container(
          width: 350,
          height: 200,
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/yoga_wallpaper.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Yoga Meditation',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
