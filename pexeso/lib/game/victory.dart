import 'package:flutter/material.dart';
import 'dart:math';

class VictoryScreen extends StatelessWidget {
  const VictoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// don't forget "with SingleTickerProviderStateMixin"
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  // initialize _controller, _animation
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            // Horizontal Flipping
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        width: 200,
                        height: 200,
                        color: Colors.green[200],
                        child: const Center(
                          child: Text("FRONT side."),
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        color: Colors.yellow[200],
                        child: const Center(
                          child: Text("BACK side."),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Vertical Flipping
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateX(pi * _animation.value),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        width: 200,
                        height: 200,
                        color: Colors.blue[200],
                        child: const Center(
                          child: Text("FRONT side."),
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        color: Colors.red[200],
                        child: const Center(
                          child: Text("BACK side.",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: (_status == AnimationStatus.dismissed ||
                      _status == AnimationStatus.reverse)
                  ? () => _controller.forward()
                  : () => _controller.reverse(),
              icon: Icon(_status == AnimationStatus.dismissed ||
                      _status == AnimationStatus.reverse
                  ? Icons.play_arrow
                  : Icons.stop),
              label: Text(_status == AnimationStatus.dismissed ||
                      _status == AnimationStatus.reverse
                  ? "Reveal The Secrets"
                  : "Stop"),
            )
          ],
        ),
      ),
    );
  }
}
