import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// In this page, users can play the video which is from the YouTube
// We used youtube_player_flutter in pub.dev
// Tutorial of add YouTube Video Player in Flutter: https://youtu.be/YMx8Bbev6T4
// Full screen reference: https://stackoverflow.com/questions/62670138/flutter-youtube-player-flutter-7-0-06-full-screen
class ProgressiveRelaxPage extends StatefulWidget {
  const ProgressiveRelaxPage({super.key});

  @override
  State<ProgressiveRelaxPage> createState() => _ProgressiveRelaxPageState();
}

// In this class, we can play a video from the YouTube
class _ProgressiveRelaxPageState extends State<ProgressiveRelaxPage> {
  final videoURL = "https://youtu.be/SNqYG95j_UQ";
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
                  'Relaxation',
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
                      // reference: https://www.webmd.com/sleep-disorders/muscle-relaxation-for-stress-insomnia
                      child: Text(
                        "\t\t\t\tProgressive muscle relaxation (PMR) is a deep relaxation technique that has been effectively used to control stress and anxiety, relieve insomnia, and reduce symptoms of certain types of chronic pain.\n\n\t\t\t\tProgressive muscle relaxation is based on the simple practice of tensing, or tightening, one muscle group at a time followed by a relaxation phase with release of the tension.\n\n\t\t\t\tTo practice, please find a quiet place and follow the instruction above.\n\n\t\t\t\tThe video is about 9 minutes.",
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
