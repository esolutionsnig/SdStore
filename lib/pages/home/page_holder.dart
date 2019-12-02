import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:sdstore/pages/authentication/login.dart';
import 'package:sdstore/pages/cart/cart.dart';
import 'package:sdstore/pages/category/category.dart';
import 'package:sdstore/pages/contactus/contact_us.dart';
import 'package:sdstore/pages/home/homeScreen.dart';
import 'package:sdstore/pages/wishlist/wishlist.dart';
// import 'package:sdstore/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../components/color.dart';

class PageHolder extends StatefulWidget {
  const PageHolder({Key key}) : super(key: key);
  @override
  _PageHolderState createState() => _PageHolderState();
}

class _PageHolderState extends State<PageHolder> {
  var userData;
  
  int _currentIndex = 2;
  final List<Widget> _children = [
    CategoryScreen(),
    CartScreen(),
    HomeScreen(),
    WishListScreen(),
    ContactUs()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  // Get User Information
  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: cwhite,
        backgroundColor: cBodyColor,
        buttonBackgroundColor: cwhite,
        height: 50,
        items: <Widget>[
          Icon(Icons.category, size: 20, color: cprimary),
          Icon(Icons.add_shopping_cart, size: 20, color: cprimary),
          Icon(Icons.home, size: 20, color: cprimary),
          Icon(Icons.favorite, size: 20, color: cprimary),
          Icon(Icons.contact_phone, size: 20, color: cprimary),
        ],
        animationDuration: Duration(microseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: 2,
        // onTap: onTappedBar(index),
        onTap: (index) {
          onTappedBar(index);
        },
      ),
    );
  }

  // Future _handleSignOut() async {
  //   // Log out from server
  //   var res = await CallApi().getData('signout');
  //   var body = json.decode(res.body);
  //   if (body['success']) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.remove('token');
  //     localStorage.remove('user');
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => LoginScreen(),
  //         ));
  //   }
  // }
}
