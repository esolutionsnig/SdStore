import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sdstore/components/general.dart';
import 'package:sdstore/pages/authentication/login.dart';
import 'package:sdstore/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/color.dart';
// import '../../components/loadersmall.dart';
// import '../../components/general.dart';
// import '../authentication/login.dart';
// import '../EditProfile/editProfileScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userData;

  bool _isLoading;

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
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 1st Card
                Card(
                  elevation: 4.0,
                  color: cwhite,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.account_circle,
                                color: cgold,
                              ),
                            ),
                            Text(
                              "Surname",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: cprimary,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text(
                            userData != null ? "${userData['surname']}" : "",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4.0,
                  color: cwhite,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.account_circle,
                                color: cgold,
                              ),
                            ),
                            Text(
                              "Given Name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: cprimary,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text(
                            userData != null ? "${userData['firstname']}" : "",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4.0,
                  color: cwhite,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.account_circle,
                                color: cgold,
                              ),
                            ),
                            Text(
                              "Display Name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: cprimary,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text(
                            userData != null ? "${userData['username']}" : "",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4.0,
                  color: cwhite,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.email,
                                color: cgold,
                              ),
                            ),
                            Text(
                              "Email Address",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: cprimary,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text(
                            userData != null ? "${userData['email']}" : "",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  onPressed: _handleSignOut,
                                  child: Text('Sign Out',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _handleSignOut() async {
    // Log out from server
    var res = await CallApi().getData('signout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }
}
