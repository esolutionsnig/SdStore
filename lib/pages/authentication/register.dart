import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sdstore/utils/api.dart';

import '../../components/color.dart';
import '../../components/general.dart';
import './login.dart';
import '../home/homeScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _surnameController = new TextEditingController();
  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _passwordConfirmationController =
      new TextEditingController();

  // RegisterReqObj registerReqObj;

  String email;
  String firstname;
  String surname;
  String username;
  String password;
  String passwordConfirmation;

  String _surnameError,
      _firstnameError,
      _emailError,
      _passwordError,
      _passwordConfirmationError;

  bool _isLoading = false;

  bool _autoValidate = false;

  String authToken;

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
              new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('Ok'))
            ],
          );
        });
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
                        child: header("assets/registerbg.png"),
                      ),
                      title("SIGN UP"),
                      subTitle("All fields are required"),
                      Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          children: <Widget>[
                            inputContainer(
                                Icon(Icons.person_outline, color: Colors.grey),
                                _surnameController,
                                "Enter your surname",
                                _surnameError,
                                false,
                                TextInputType.text),
                            inputContainer(
                                Icon(Icons.person_outline, color: Colors.grey),
                                _firstnameController,
                                "Enter your given name",
                                _firstnameError,
                                false,
                                TextInputType.text),
                            inputContainer(
                                Icon(Icons.person_outline, color: Colors.grey),
                                _usernameController,
                                "Enter your display name",
                                "",
                                false,
                                TextInputType.text),
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
                            inputContainer(
                                Icon(Icons.lock_open, color: Colors.grey),
                                _passwordConfirmationController,
                                "Confirm password",
                                _passwordConfirmationError,
                                true,
                                TextInputType.text),
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: appButton(
                                        cprimary,
                                        cprimary,
                                        Colors.black12,
                                        _isLoading,
                                        "Creating Account",
                                        "Create Account",
                                        cwhite,
                                        cgold,
                                        cgold,
                                        Icon(
                                          Icons.arrow_forward,
                                          color: cwhite,
                                        ),
                                        _handleSignUp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: appFlatBtn(
                                        "ALREADY HAVE AN ACCOUNT?",
                                        cprimary,
                                        _gotoSignIn),
                                  ),
                                ],
                              ),
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

  void _gotoSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  // Handle Account Creation
  void _handleSignUp() async {
    if (_validated()) {
      setState(() {
        _isLoading = true;
      });
      var data = {
        'surname': surname,
        'firstname': firstname,
        'username': username,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      };

      // Make API call
      var res = await CallApi().postData(data, 'signup');
      var body = json.decode(res.body);
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));
        // Navigate to Home Page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        _showAlert(context, body['error'], body['message']);
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _autoValidate = true;
      });
    }
  }

  // Validate Form
  bool _validated() {
    // registerReqObj = RegisterReqObj();

    bool valid = true;

    surname = _surnameController.text;
    if (_surnameController.text.isEmpty) {
      valid = false;
      _surnameError = "Surname is required";
    } else {
      _surnameError = null;
    }

    firstname = _firstnameController.text;
    if (_firstnameController.text.isEmpty) {
      valid = false;
      _firstnameError = "Given name is required";
    } else {
      _firstnameError = null;
    }

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
      if (_passwordController.text.length < 8) {
        _passwordError = "Minimum of 8 characters required";
      } else {
        _passwordError = null;
      }
    }

    passwordConfirmation = _passwordConfirmationController.text;
    if (_passwordConfirmationController.text.isEmpty) {
      valid = false;
      _passwordConfirmationError = "Password confirmation is required";
    } else if (_passwordConfirmationController.text.length < 8) {
      _passwordConfirmationError = "Minimum of 8 characters required";
    } else if (_passwordConfirmationController.text !=
        _passwordController.text) {
      _passwordConfirmationError = "Passwords do not match";
    } else {
      _passwordConfirmationError = null;
    }

    return valid;
  }
}

class HeaderClip {}

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
