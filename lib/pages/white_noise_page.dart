import 'package:flutter/material.dart';
import 'game_page.dart';
import 'hrv_page.dart';
import 'meditation_page.dart';
import 'home_page.dart';
import 'forest_video_page.dart';
import 'sea_video_page.dart';
import 'new_york_video_page.dart';
import 'Edinburgh_video_page.dart';
import 'rain_video_page.dart';
import 'paris_video_page.dart';

// The white noise video page is a stateful widget
class WhiteNoisePage extends StatefulWidget {
  const WhiteNoisePage({super.key});

  @override
  State<WhiteNoisePage> createState() => _WhiteNoisePageState();
}

class _WhiteNoisePageState extends State<WhiteNoisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Videos',
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
        children: [
          // There are six videos, which are forest, sea, rain, Paris, NewYork, Edinburgh
          ForestVideo(),
          SeaVideo(),
          RainVideo(),
          ParisVideo(),
          NewYorkVideo(),
          EdinburghVideo(),
        ],
      )),
    );
  }
}

// For each video, we will set up a stateful widget represented as a card.
// The card contains the picture and the title, which corresponding to each scenes.
// When users click the card, the onTap and MaterialPageRoute will guid users to the corresponding pages.

class ForestVideo extends StatefulWidget {
  const ForestVideo({super.key});

  @override
  State<ForestVideo> createState() => _ForestVideoState();
}

class _ForestVideoState extends State<ForestVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ForestVideoPage(),
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
                  'assets/images/forest_wallpaper.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Forest',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
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

class SeaVideo extends StatefulWidget {
  const SeaVideo({super.key});

  @override
  State<SeaVideo> createState() => _SeaVideoState();
}

class _SeaVideoState extends State<SeaVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SeaVideoPage(),
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
                  'assets/images/sea.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Sea',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
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

class RainVideo extends StatefulWidget {
  const RainVideo({super.key});

  @override
  State<RainVideo> createState() => _RainVideoState();
}

class _RainVideoState extends State<RainVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RainVideoPage(),
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
                  'assets/images/rain_wallpaper.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Rain',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
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

class ParisVideo extends StatefulWidget {
  const ParisVideo({super.key});

  @override
  State<ParisVideo> createState() => _ParisVideoState();
}

class _ParisVideoState extends State<ParisVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ParisVideoPage(),
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
                  'assets/images/paris_wallpaper.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Paris',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
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

class NewYorkVideo extends StatefulWidget {
  const NewYorkVideo({super.key});

  @override
  State<NewYorkVideo> createState() => _NewYorkVideoState();
}

class _NewYorkVideoState extends State<NewYorkVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewYorkVideoPage(),
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
                  'assets/images/new york.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('New York',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
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

class EdinburghVideo extends StatefulWidget {
  const EdinburghVideo({super.key});

  @override
  State<EdinburghVideo> createState() => _EdinburghVideoState();
}

class _EdinburghVideoState extends State<EdinburghVideo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EdinburghVideoPage(),
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
                  'assets/images/Edinburgh.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Center(
                      child: Text('Edinburgh',
                          style: TextStyle(
                            fontFamily: 'PTSans',
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
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
