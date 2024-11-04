import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.grey[900],
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);
