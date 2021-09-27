import 'package:flutter/material.dart';

TextStyle techCardTitleStyle = const TextStyle(
    fontFamily: 'Gotham', fontWeight: FontWeight.bold, fontSize: 18);
TextStyle techCardSubTitleStyle = const TextStyle(
    fontFamily: 'Gotham', fontWeight: FontWeight.bold, fontSize: 13);

TextStyle statusUnavailableStyle = const TextStyle(
    fontFamily: 'Gotham',
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: Colors.red);
TextStyle statusAvailableStyle = const TextStyle(
    fontFamily: 'Gotham',
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: Colors.green);

Map statusStyles = {
  'Available': statusAvailableStyle,
  'Unavailable': statusUnavailableStyle
};