import 'package:flutter/material.dart';
import 'Sources/constants.dart';
import 'screens/home_screens/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular', primaryColor: kprimaryBlack),
      home: const HomePage(),
    ),
  );
}
