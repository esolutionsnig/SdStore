import 'package:flutter/material.dart';
import 'package:sdstore/components/color.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key key}) : super(key: key);
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cwhite,
        title: Text(
          "My Wish List",
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
            Text('This is just a demo wish list page')
          ],
        ),
      ),
    );
  }
}