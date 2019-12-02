import 'package:flutter/material.dart';
import 'package:sdstore/components/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cwhite,
        title: Text(
          "My Cart",
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