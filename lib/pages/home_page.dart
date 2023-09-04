import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'game_page.dart';
import 'hrv_page.dart';
import 'meditation_page.dart';
import 'white_noise_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

// In the home page, we build a audio player that users can play/pause the music and change the music
// Audio player reference code: https://youtu.be/Pk56OnEMIqU
// https://youtu.be/udtfgcF3Olc
class _HomePageState extends State<HomePage> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  // Set up the initial state
  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  // A audio playlist, the music are in the assets file
  void setupPlaylist() async {
    await audioPlayer.open(
        Playlist(audios: [
          Audio('assets/audio/1.mp3'),
          Audio('assets/audio/3.mp3'),
          Audio('assets/audio/2.mp3'),
          Audio('assets/audio/4.mp3'),
          Audio('assets/audio/5.mp3'),
          Audio('assets/audio/6.mp3'),
          Audio('assets/audio/7.mp3'),
          Audio('assets/audio/8.mp3'),
          Audio('assets/audio/9.mp3'),
        ]),
        autoStart: false);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  // The widget will return a audioplayer that the play/pause button is surrounded by a circle
  Widget circularAudioPlayer(
      RealtimePlayingInfos realtimePlayingInfos, double screenWidth) {
    Color primaryColor = Colors.white;
    // The body of a row is: Previous music, next music, and play/pause
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous music
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 30),
          icon: Icon(Icons.skip_previous_rounded),
          onPressed: () => audioPlayer.previous(),
          iconSize: screenWidth / 6,
          color: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        // Play/pause
        CircularPercentIndicator(
          radius: screenWidth / 5,
          arcType: ArcType.FULL,
          backgroundColor: primaryColor,
          progressColor: Colors.white,
          percent: realtimePlayingInfos.currentPosition.inSeconds /
              realtimePlayingInfos.duration.inSeconds,
          center: IconButton(
            iconSize: screenWidth / 8,
            color: primaryColor,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(realtimePlayingInfos.isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded),
            onPressed: () => audioPlayer.playOrPause(),
          ),
        ),
        // Next music
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 30),
          icon: Icon(Icons.skip_next_rounded),
          onPressed: () => audioPlayer.next(),
          iconSize: screenWidth / 6,
          color: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }

  // Set up the layout of the page, including:
  // appbar, background wallpaper, and music player
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/sea.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'myMood',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: audioPlayer.builderRealtimePlayingInfos(
            builder: ((context, realtimePlayingInfos) {
              if (realtimePlayingInfos != null) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: circularAudioPlayer(
                      realtimePlayingInfos, MediaQuery.of(context).size.width),
                );
              } else {
                return Container();
              }
            }),
          ),
        ),
      ),
    ]);
  }
}
