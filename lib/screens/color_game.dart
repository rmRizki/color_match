import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:color_match/screens/widgets/emoji.dart';
import 'package:flutter/material.dart';

class ColorGame extends StatefulWidget {
  @override
  _ColorGameState createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  final Map<String, bool> score = {};
  final Map choices = {
    '🍎': Colors.red,
    '🍋': Colors.yellow,
    '🥑': Colors.green,
    '🥕': Colors.orange,
    '🍆': Colors.purple,
    '🥥': Colors.brown,
  };

  int seed = 0;

  AudioCache _audioController = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skor ${score.length} / 6'),
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((emoji) {
              return Draggable<String>(
                data: emoji,
                child: Emoji(emoji: score[emoji] == true ? '✔️' : emoji),
                feedback: Emoji(emoji: emoji),
                childWhenDragging: Emoji(emoji: '🌱'),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (context, incomingData, rejectedData) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('Benar!'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(
            color: choices[emoji],
            height: 80,
            width: 200,
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
        });

        _audioController.play('success.wav');
      },
      onLeave: (data) {},
    );
  }
}
