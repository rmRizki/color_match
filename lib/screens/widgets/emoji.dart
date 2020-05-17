import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
