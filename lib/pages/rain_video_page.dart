import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// In this page, users can play the video which is from the YouTube
// We used youtube_player_flutter in pub.dev
// Tutorial of add YouTube Video Player in Flutter: https://youtu.be/YMx8Bbev6T4
// Full screen reference: https://stackoverflow.com/questions/62670138/flutter-youtube-player-flutter-7-0-06-full-screen
class RainVideoPage extends StatefulWidget {
  const RainVideoPage({super.key});

  @override
  State<RainVideoPage> createState() => _RainVideoPageState();
}

// In this class, we can play a video from the YouTube
class _RainVideoPageState extends State<RainVideoPage> {
  final videoURL = "https://youtu.be/mPZkdNFkNps";
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
        autoPlay: true,
      ),
    );
    super.initState();
  }

  // In the widget, we can build the layout of the page: video is in the middle
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
                  'Rain',
                  style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Center(child: YoutubeRainPlayer()),
            );
          } else {
            return Scaffold(
              body: YoutubeRainPlayer(),
            );
          }
        }),
      ),
    );
  }

  // The YoutubeRainPlayer build a player that plays the video
  Widget YoutubeRainPlayer() {
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
              playedColor: Colors.blueGrey,
              handleColor: Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}
