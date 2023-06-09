import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pexeso/game/victory.dart';

class DynamicRectangles2 extends StatefulWidget {
  @override
  _DynamicRectanglesState2 createState() => _DynamicRectanglesState2();
}

class _DynamicRectanglesState2 extends State<DynamicRectangles2> {
  int flipedCardsCounter = 0;
  List<String> flipedCards = [];
  List<Map<String, dynamic>> symbols = [
    {"text": "🐶", "visible": false},
    {"text": "🐶", "visible": false},
    {"text": "🍺", "visible": false},
    {"text": "🍺", "visible": false},
    {"text": "📺", "visible": false},
    {"text": "📺", "visible": false},
    {"text": "👼", "visible": false},
    {"text": "👼", "visible": false},
    {"text": "👀", "visible": false},
    {"text": "👀", "visible": false},
    {"text": "👻", "visible": false},
    {"text": "👻", "visible": false},
    {"text": "👽", "visible": false},
    {"text": "👽", "visible": false},
    {"text": "❤️‍🔥", "visible": false},
    {"text": "❤️‍🔥", "visible": false},
    {"text": "🖇️", "visible": false},
    {"text": "🖇️", "visible": false},
    {"text": "🧌", "visible": false},
    {"text": "🧌", "visible": false},
    {"text": "🧜‍♀️", "visible": false},
    {"text": "🧜‍♀️", "visible": false},
    {"text": "🐸", "visible": false},
    {"text": "🐸", "visible": false},
    {"text": "🙈", "visible": false},
    {"text": "🙈", "visible": false},
    {"text": "🐣", "visible": false},
    {"text": "🐣", "visible": false},
    {"text": "🍬", "visible": false},
    {"text": "🍬", "visible": false},
    {"text": "🎱", "visible": false},
    {"text": "🎱", "visible": false},
  ];
  bool checkIfGameOver() {
    for (int i = 0; i < 32; i++) {
      if (symbols[i]["text"] != "✅") {
        return true;
      }
    }
    return false;
  }

  void checkFlipedCards() {
    if (!checkIfGameOver()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VictoryScreen(),
        ),
      );
    }
    flipedCardsCounter = 0;
    for (int i = 0; i < 32; i++) {
      if (symbols[i]["visible"] == true && symbols[i]["text"] != "✅") {
        flipedCards.add(symbols[i]['text']);
      }
    }
    if (flipedCards[0] == flipedCards[1]) {
      for (int i = 0; i < 32; i++) {
        if (symbols[i]["visible"] == true) {
          setState(() {
            symbols[i]["text"] = "✅";
          });
        }
      }
    } else if (flipedCards[0] != flipedCards[1]) {
      for (int i = 0; i < 32; i++) {
        if (symbols[i]["visible"] == true && symbols[i]["text"] != "✅") {
          setState(() {
            symbols[i]["visible"] = false;
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    symbols.shuffle();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Display the rectangles
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(symbols.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 10.0,
                    ),
                    onPressed: () {
                      if (symbols[index]["text"] == "✅") return null;
                      setState(() {
                        symbols[index]["visible"] = true;
                        flipedCardsCounter++;
                        if (flipedCardsCounter == 2) {
                          symbols[index]["visible"] = true;
                          Future.delayed(const Duration(milliseconds: 100), () {
                            checkFlipedCards();
                            flipedCardsCounter = 0;
                            flipedCards = [];
                          });
                        }
                      });
                      setState(() {});
                    },
                    child: Visibility(
                      visible: symbols[index]["visible"],
                      child: Text(
                        symbols[index]["text"],
                        style: const TextStyle(
                          fontSize: 38.0,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
