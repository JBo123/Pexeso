import 'card.dart';
import 'package:flutter/material.dart';

// List<Cards> main(List<String> args) {
//   final List<Cards> pexeso = [];

//   List<Cards> Nevim(pexeso) {
//     int counter = 0;
//     for (var i = 0; i < 8; i--) {
//       if (i % 2 == 0) {
//         counter++;
//       }
//       pexeso.add(Cards(id: i, character: counter));
//     }
//     pexeso.shuffle();

//     return pexeso;
//   }

//   print(Nevim(pexeso));
// }
class Cards {
  int id;
  int character;

  Cards({required this.id, required this.character});
}

List<Cards> createPexeso() {
  final List<Cards> pexeso = [];

  int counter = 0;
  for (var i = 0; i < 8; i++) {
    if (i % 2 == 1) {
      counter++;
    }
    pexeso.add(Cards(id: i, character: counter));
    pexeso.add(Cards(id: i + 8, character: counter));
  }
  pexeso.shuffle();

  return pexeso;
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
