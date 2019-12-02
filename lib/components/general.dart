import 'package:flutter/material.dart';

import 'color.dart';

import 'loadersmall.dart';

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
      padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
      child: Text(
        title,
        style: TextStyle(
            color: cprimary, fontSize: 24.0, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

// Title
Widget subTitle(String title) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 30.0),
      child: Text(
        title,
        style: TextStyle(
          color: cprimary, 
          fontSize: 15.0
        ),
      ),
    ),
  );
}

// Input title
Widget inputTitle(String title) {
  return Text(
      title,
      style: TextStyle(color: Colors.grey, fontSize: 16.0),
  );
}

// Input COntainer
Widget inputContainer(Icon icon, TextEditingController nameController, String hintText, String textError, bool obscureText, TextInputType keyboardType) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: icon,
        ),
        Container(
          height: 30.0,
          width: 1.0,
          color: Colors.grey.withOpacity(0.5),
          margin: const EdgeInsets.only(left: 00.0, right: 10.0),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              errorText: textError,
            ),
            controller: nameController,
            obscureText: obscureText,
            keyboardType: keyboardType,
          ),
        )
      ],
    ),
  );
}


Widget appButton(
  Color splashColor,
  Color color,
  Color disabledColor,
  bool isLoading,
  String loadingText,
  String btnText,
  Color btnTextColor,
  Color innerBtnSplashColor,
  Color innerBtnColor,
  Icon innerBtnIcon,
  void function(),
) {
  return FlatButton(
    shape:
        new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    splashColor: splashColor,
    color: color,
    disabledColor: disabledColor,
    child: new Row(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            isLoading ? loadingText : btnText,
            style: TextStyle(color: btnTextColor),
          ),
        ),
        new Expanded(
          child: Container(),
        ),
        new Transform.translate(
          offset: Offset(15.0, 0.0),
          child: new Container(
            padding: const EdgeInsets.all(5.0),
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(28.0)),
              splashColor: innerBtnSplashColor,
              color: innerBtnColor,
              child: isLoading ? LoaderDot() : innerBtnIcon,
              onPressed: isLoading ? null : function,
            ),
          ),
        )
      ],
    ),
    onPressed: isLoading ? null : function,
  );
}

Widget appFlatBtn(String btnText, Color btnTextColor, void function()) {
  return FlatButton(
    shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0)),
    color: Colors.transparent,
    child: Container(
      padding: const EdgeInsets.only(left: 20.0),
      alignment: Alignment.center,
      child: Text(
        btnText,
        style: TextStyle(color: btnTextColor),
      ),
    ),
    onPressed: function,
  );
}
