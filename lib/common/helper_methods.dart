import 'dart:math';
import 'package:flutter/material.dart';
import 'package:location_logger/utils/constant.dart';


//genrate a complex random number
int randomNumber() {

  return Random().nextInt(colors.length-1);
}

List<Color> colors = [
  Colors.red,
  Colors.amber,
  Colors.green,
  Colors.indigo,
  Colors.teal,
  Colors.deepPurple,
  Colors.purpleAccent,
  Colors.orange,
  Colors.deepPurpleAccent,
  Colors.pinkAccent,
];

