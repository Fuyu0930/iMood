import 'dart:async';

import 'package:flutter/material.dart';
import 'white_noise_page.dart';
import 'hrv_page.dart';
import 'meditation_page.dart';
import 'home_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

// This is game is tutored by https://www.bilibili.com/video/BV16f4y1G7bu/
// set the players size and game size
const double stageSize = 350;
const double size = 50;
const double wallHeight = 60;

//control the player for up and down or lost
enum Direction {
  Up,
  Down,
  None,
}

//status for running and dead
enum GameState {
  Running,
  Dead,
}

class _GamePageState extends State<GamePage> {
  //player size
  double dollY = stageSize;
  //background size
  double wallX = stageSize;
  //Game over
  Direction direction = Direction.None;
  //running
  GameState gameState = GameState.Running;

  @override
  void initState() {
    //the background move every 5 ms
    var duration = Duration(milliseconds: 5);
    Timer.periodic(
      duration,
      (timer) {
        double newDollY = dollY;
        Direction newDirection = direction;
        //control direction
        switch (direction) {
          case Direction.Up:
            newDollY--;
            if (newDollY < 100) {
              newDirection = Direction.Down;
            }
            break;
          case Direction.Down:
            newDollY++;
            if (newDollY > stageSize) {
              newDirection = Direction.None;
            }
            break;
          case Direction.None:
            break;
        }

        // Use if statement and mounted to avoid the crush after playing the game
        if (mounted) {
          if (wallX < size && dollY > stageSize - wallHeight) {
            setState(() {
              gameState = GameState.Dead;
            });
          }
        }

        // Use if statement and mounted to avoid the crush after playing the game
        if (mounted) {
          setState(() {
            wallX = (wallX - 1 + stageSize) % stageSize;
            dollY = newDollY;
            direction = newDirection;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Game',
          style: TextStyle(
            fontFamily: 'CrimsonText',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: const Text(
            'Tap the screen and help the bird avoid the block!',
            style: TextStyle(
              fontFamily: 'PTSans',
              fontSize: 20.0,
            ),
          ),
        ),
        Center(
          child: gameState == GameState.Running
              ? GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        direction = Direction.Up;
                      },
                    );
                  },
                  child: Container(
                      width: stageSize,
                      height: stageSize,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Stack(
                        children: [
                          Positioned.fromRect(
                            rect: Rect.fromCenter(
                                center: Offset(size / 2, dollY - size / 2),
                                width: size,
                                height: size),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          Positioned.fromRect(
                              // size and set for the player
                              rect: Rect.fromCenter(
                                  center: Offset(wallX - size / 2,
                                      stageSize - wallHeight / 2),
                                  width: size,
                                  height: wallHeight),
                              child: Container(color: Colors.black)),
                        ],
                      )),
                )
              : Center(
                  child: Container(
                    //game over
                    child: const Text(
                      "Game Over!",
                      style: TextStyle(
                        fontFamily: 'PTSans',
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
        ),
      ]),
    );
  }
}
