import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:sdstore/bloc/cart_list_bloc.dart';
import 'package:sdstore/components/color.dart';
import 'package:sdstore/model/shoe_item.dart';
import 'package:sdstore/pages/cart/cart.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<ShoeItem> shoeItems = snapshot.data;
              int length = shoeItems != null ? shoeItems.length : 0;

              return buildGestureDetector(length, context, shoeItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<ShoeItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CartScreen()));
        } else {
          return;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text(
          length.toString(),
          style: TextStyle(color: cgold),
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: cprimary, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}