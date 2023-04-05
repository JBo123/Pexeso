import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pexeso/game/logic.dart';

// class GameScreen extends StatefulWidget {
//   const GameScreen({super.key});

//   @override
//   State<GameScreen> createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   List<int> karty = [1, 1, 2, 2, 3, 3, 4, 4];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pexeso'),
//       ),
//       body: Expanded(
//         child: GridView.count(
//           crossAxisCount: 2,
//           children: List.generate(karty.length, (index) {
//             return Container(
//               child: Text(karty[index].toString()),
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               margin: EdgeInsets.all(8.0),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
// class xd{
//   List<int> numbers;
//   xd({required this.numbers})
//   List<int> shuffle(List<int> numbers) {
//     numbers.shuffle();
//     return numbers;
//   }
//}
class DynamicRectangles extends StatefulWidget {
  @override
  _DynamicRectanglesState createState() => _DynamicRectanglesState();
}

class _DynamicRectanglesState extends State<DynamicRectangles> {
  List<int> numbers = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8];
  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  int counter = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Display the rectangles
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(numbers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 10.0,
                    ),
                    onPressed: () {
                      setState(() {
                        if (counter == 2) {}
                      });
                    },
                    child: Center(
                      child: Text(
                        numbers[index].toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
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

  void main(List<String> args) {
    int counter = 0;
    bool _isButtonDisabled = false;
    Function? _counterButtonPress(_isButtonDisabled) {
      if (_isButtonDisabled) {
        return null;
      } else {
        return () {
          // do anything else you may want to here
          counter++;
        };
      }
    }
  }
}
