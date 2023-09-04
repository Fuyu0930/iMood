import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// In this page, users can play the video which is from the YouTube
// We used youtube_player_flutter in pub.dev
// Tutorial of add YouTube Video Player in Flutter: https://youtu.be/YMx8Bbev6T4
// Full screen reference: https://stackoverflow.com/questions/62670138/flutter-youtube-player-flutter-7-0-06-full-screen
class FocusMeditationPage extends StatefulWidget {
  const FocusMeditationPage({super.key});

  @override
  State<FocusMeditationPage> createState() => _FocusMeditationPageState();
}

// In this class, we can play a video from the YouTube
class _FocusMeditationPageState extends State<FocusMeditationPage> {
  final videoURL = "https://youtu.be/o_SHRA0oxRQ";
  late YoutubePlayerController _controller;

  // Set the initial state
  // We set autoPlay as true, so that when users click the card and get in the page
  // the video will be played automatically
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  // In the widget, we can build the layout of the page: video is on the top, below is a brief instruction
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // OrientationBuilder can help us view the video in full screen
        // Use the if else statement: whether the page is landscape or not
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          if (orientation != Orientation.landscape) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: const Text(
                  'Focus Meditation',
                  style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  YoutubeMeditationPlayer(),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(20.0),
                    child: const Card(
                      color: Colors.black,
                      // Text reference: https://www.masterclass.com/articles/focus-meditation
                      child: Text(
                        "\t\t\t\tFocus meditation is a type of mindfulness meditation that can help increase your awareness of the present moment. \n\n\t\t\t\tThis meditation style involves focusing your attention on an object or physical sensation, such as your breathing.\n\n\t\t\t\tTo increase the awareness, please find a quiet surrounding place and follow the instruction video above.\n\n\t\t\t\tThe video is around 10 minutes.",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              body: YoutubeMeditationPlayer(),
            );
          }
        }),
      ),
    );
  }

  // The YoutubeMeditationPlayer build a player that plays the video
  Widget YoutubeMeditationPlayer() {
    return Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => debugPrint('ready'),
        bottomActions: [
          CurrentPosition(),
          FullScreenButton(),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: Colors.white,
              handleColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
