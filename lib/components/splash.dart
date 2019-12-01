import 'package:flutter/material.dart';

import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

import '../pages/login/login.dart';
import '../components/color.dart';

class SplashScreen extends StatelessWidget {
  // Making list of pages needed to pass in IntroViewsFlutter constructor
  final pages = [
    PageViewModel(
      pageColor: cwhite,
      bubble: Image.asset('assets/booticon.png'),
      body: Text(
        "Precision & Style"
      ),
      title: Text(
        "St.David's"
      ),
      textStyle: TextStyle(color: cprimary),
      mainImage: Image.asset(
        'assets/intro/second.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: cwhite,
      bubble: Image.asset('assets/shoeicon.png'),
      body: Text(
        "Available in big sizes 46+"
      ),
      title: Text(
        "MADE2FIT"
      ),
      textStyle: TextStyle(color: cprimary),
      mainImage: Image.asset(
        'assets/intro/first.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: cwhite,
      bubble: Image.asset('assets/bagicon.png'),
      body: Text(
        "Personalize your style"
      ),
      title: Text(
        "Classice Bags"
      ),
      textStyle: TextStyle(color: cprimary),
      mainImage: Image.asset(
        'assets/intro/third.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          pageButtonTextStyles: TextStyle(
            color: cprimary,
            fontSize: 10.0,
          ),
          pageButtonsColor: cgold,
        ),
      ),
    );
  }
}