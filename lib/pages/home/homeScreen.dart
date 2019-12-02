import 'package:flutter/material.dart';
import 'package:sdstore/components/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cwhite,
        title: Text(
          "Home",
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
            Text('This is just a demo shopping cart page')
          ],
        ),
      ),
    );
  }
}