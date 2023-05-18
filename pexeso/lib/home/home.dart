import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pexeso/game/animatedgame.dart';

import 'package:pexeso/game/game2.dart';
import 'package:pexeso/game/victory.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Pexeso',
            style: TextStyle(fontSize: 50),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DynamicRectangles2()));
            },
            icon: Icon(Icons.play_arrow),
            color: Colors.amber,
            iconSize: 100,
          ),
        ],
      ),
    ));
  }
}
