import 'package:flutter/material.dart';

import 'color.dart';

// Header Image
Widget header(String imageLocation) {
  return Container(
    decoration: BoxDecoration(
      image: new DecorationImage(
        image: AssetImage(imageLocation),
        fit: BoxFit.cover,
      ),
    ),
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 150.0, bottom: 100.0),
    child: Column(
      children: <Widget>[
        Text(""),
      ],
    ),
  );
}

// Title
Widget title(String title) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        title,
        style: TextStyle(
            color: cprimary, fontSize: 24.0, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
