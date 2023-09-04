import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// In this page, users can play the video which is from the YouTube
// We used youtube_player_flutter in pub.dev
// Tutorial of add YouTube Video Player in Flutter: https://youtu.be/YMx8Bbev6T4
// Full screen reference: https://stackoverflow.com/questions/62670138/flutter-youtube-player-flutter-7-0-06-full-screen
class VipassanaPage extends StatefulWidget {
  const VipassanaPage({super.key});

  @override
  State<VipassanaPage> createState() => _VipassanaPageState();
}

// In this class, we can play a video from the YouTube
class _VipassanaPageState extends State<VipassanaPage> {
  final videoURL = "https://youtu.be/PvAEG5muUnU";
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
                  'Vipassana',
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
                      child: Text(
                        // reference： https://www.dhamma.org/en/about/vipassana
                        "\t\t\t\tVipassana, which means to see things as they really are, is one of India's most ancient techniques of meditation.\n\n\t\t\t\tVipassana is a way of self-transformation through self-observation. It focuses on the deep interconnection between mind and body, which can be experienced directly by disciplined attention to the physical sensations, and that continuously interconnect and condition the life of the mind.\n\n\t\t\t\tTo practice, please find a quiet place and follow the instruction above. The video is about 15 minutes.",
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
