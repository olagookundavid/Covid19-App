import 'package:flutter/material.dart';
import 'Sources/constants.dart';
import 'responsive_layout.dart';
import 'screens/home_screens/homescreen.dart';
import 'screens/home_screens/webpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular', primaryColor: kprimaryBlack),
      home: const ResponsiveLayout(
        mobileScreenLayout: HomePage(),
        webScreenLayout: WebPage(),
      ),
    ),
  );
}
