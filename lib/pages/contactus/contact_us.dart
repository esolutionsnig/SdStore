import 'package:flutter/material.dart';
import 'package:sdstore/components/color.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cwhite,
        title: Text(
          "Contact Us",
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
            Text('This is just a demo contact us page')
          ],
        ),
      ),
    );
  }
}