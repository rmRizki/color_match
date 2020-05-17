import 'package:flutter/material.dart';

import 'screens/color_game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: ColorGame(),
    );
  }
}
