import 'package:flutter/material.dart';

import 'components/color.dart';
import 'components/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "St.David's",
      debugShowCheckedModeBanner: false,
      theme: _sdTheme,
      home: SplashScreen(),
    );
  }
}

// Build Custom
  final ThemeData _sdTheme = _buildSdTheme();

  ThemeData _buildSdTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: cgoldenyellow,
    primaryColor: cprimary,
    buttonColor: cprimary,
    scaffoldBackgroundColor: cwhite,
    cardColor: cwhite,
    textSelectionColor: cprimary,
    errorColor: cred,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: cprimary),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(),
    ),
    textTheme: _buildSdTextTheme(base.textTheme),
    primaryTextTheme: _buildSdTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildSdTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildSdTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'MyFont',
        displayColor: cblack87,
        bodyColor: cblack87,
      );
}
