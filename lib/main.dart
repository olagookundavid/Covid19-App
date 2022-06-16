// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'Sources/constants.dart';
import 'responsive_layout.dart';
import 'screens/home_screens/homescreen.dart';
import 'screens/home_screens/webpage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
            primaryColor: kprimaryBlack,
            fontFamily: 'Circular',
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Colors.blueGrey[900]
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const ResponsiveLayout(
            mobileScreenLayout: HomePage(),
            webScreenLayout: WebPage(),
          ),
        );
      },
    );
  }
}
