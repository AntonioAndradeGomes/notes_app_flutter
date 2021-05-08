import 'package:flutter/material.dart';
import 'package:notes_sqlite_mobx/consts.dart';

Color defineColorFab(Color cor) {
  if (cor == CORES[0]) {
    return Colors.teal;
  } else if (cor == CORES[1]) {
    return Colors.teal;
  } else if (cor == CORES[2]) {
    return Color(0xFF8be9fd);
  } else if (cor == CORES[3]) {
    return Colors.blue;
  } else if (cor == CORES[4]) {
    return Colors.blue;
  } else if (cor == CORES[5]) {
    return Colors.green;
  } else if (cor == CORES[6]) {
    return Colors.orange;
  } else if (cor == CORES[7]) {
    return Colors.pink;
  } else if (cor == CORES[8]) {
    return Colors.pinkAccent;
  } else if (cor == CORES[9]) {
    return Colors.purpleAccent;
  } else {
    return Colors.blue;
  }
}
