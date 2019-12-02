import 'package:flutter/material.dart';
import 'package:sdstore/components/color.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cwhite,
        title: Text(
          "Categories",
          style: TextStyle(
            color: cprimary
          ),
        ),
      ),
      body: Container(
        color: cBodyColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is just a demo categoryScreen page')
          ],
        ),
      ),
    );
  }
}