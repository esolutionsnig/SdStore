import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sdstore/pages/home/page_holder.dart';
import 'package:sdstore/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../../components/loader.dart';
import '../../components/color.dart';
import '../../components/general.dart';
import './register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String email, password, _emailError, _passwordError;
  bool _isLoading = false;
  ScaffoldState scaffoldState;
  Future _showAlert(BuildContext context, String title, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type AlertDialog
        return AlertDialog(
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Ok'))
        ],
      );
      }
    );
  }

  bool _isLoggedIn = false;

  @override
  void initState() {
    _checkedIfLoggedIn();
    super.initState();
  }

  // Check if user is currently logged in
  _checkedIfLoggedIn() async {
    // Check if token exists
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    // print(token);
    if(token != null) {
      setState(() {
        _isLoggedIn = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageHolder(),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Material(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new ClipPath(
                        clipper: MyClipper(),
                        child: header("assets/loginbg.png"),
                      ),
                      title("SIGN IN"),
                      subTitle("Using your email address and password"),
                      inputContainer(
                          Icon(Icons.email, color: Colors.grey),
                          _emailController,
                          "Enter your email address",
                          _emailError,
                          false,
                          TextInputType.emailAddress),
                      inputContainer(
                          Icon(Icons.lock_open, color: Colors.grey),
                          _passwordController,
                          "Enter your password",
                          _passwordError,
                          true,
                          TextInputType.text),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: appButton(
                                  cprimary,
                                  cprimary,
                                  Colors.black12,
                                  _isLoading,
                                  "Authenticating",
                                  "Sign In",
                                  cwhite,
                                  cgold,
                                  cgold,
                                  Icon(
                                    Icons.arrow_forward,
                                    color: cwhite,
                                  ),
                                  _handleSignIn),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: appFlatBtn("DON'T HAVE AN ACCOUNT?",
                                  cprimary, _gotoSignUp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _gotoSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
  }

  // Handle Account Creation
  void _handleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    if (_validated()) {
      var data = {
        'email': email,
        'password': password,
      };

      // Make API call
      var res = await CallApi().postData(data, 'signin');
      var body = json.decode(res.body);
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));
        print('logged in');
        // Navigate to Home Page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageHolder()));
      } else {
        _showAlert(context, body['error'], body['message']);
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Validate Form
  bool _validated() {
    // registerReqObj = RegisterReqObj();

    bool valid = true;

    email = _emailController.text;
    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email address is required";
    } else {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(_emailController.text)) {
        _emailError = "Enter a valid email address";
      } else {
        _emailError = null;
      }
    }

    password = _passwordController.text;
    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Password is required";
    } else {
      _passwordError = null;
    }

    return valid;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
