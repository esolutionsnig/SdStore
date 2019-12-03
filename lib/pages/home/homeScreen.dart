import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:sdstore/bloc/cart_list_bloc.dart';
import 'package:sdstore/bloc/list_tile_color_bloc.dart';
import 'package:sdstore/components/color.dart';
import 'package:sdstore/components/general.dart';
import 'package:sdstore/model/shoe_item.dart';
import 'package:sdstore/pages/cart/cart.dart';
import '../../components/custome_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i)=>CartListBloc()),
        Bloc((i)=>ColorBloc()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                FirstHalf(),
                SizedBox(height: 45,),
                for(var shoeItem in shoeItemList.shoeItems)
                  Builder(
                    builder: (context) {
                      return ItemContainer(shoeItem: shoeItem);
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {

  ItemContainer({
    @required this.shoeItem
  });

  final ShoeItem shoeItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  // Add Items to Cart
  addToCart(ShoeItem shoeItem) {
    bloc.addToList(shoeItem);
  }

  // Remove Item From Cart
  removeFromList(ShoeItem shoeItem) {
    bloc.removeFromList(shoeItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        addToCart(shoeItem);
        final snackbar = SnackBar(
          content: Text("${shoeItem.title} added to your cart"),
          duration: Duration(microseconds: 2000),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Items(
        shop: shoeItem.shop,
        itemName: shoeItem.title,
        itemPrice: shoeItem.price,
        imgUrl: shoeItem.imgUrl,
        leftAligned: (shoeItem.id % 2 == 0) ? true : false
      ),
    );
  }
}

class Items extends StatelessWidget {
  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String shop;

  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned ? Radius.circular(0) : Radius.circular(containerRadius),  
                    right: leftAligned ? Radius.circular(containerRadius) : Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(
                  left: leftAligned ? 20 : 0,
                  right: leftAligned ? 0 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18
                            ),
                          ),
                        ),
                        Text(
                          "\$$itemPrice",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: cgold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15
                          ),
                          children: [
                            TextSpan(text: "Store: "),
                            TextSpan(
                              text: shop,
                              style: TextStyle(
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                    SizedBox(height: containerPadding,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 30,),
          storeTitle("St.David's", "Kings Don't Compromise"),
          SizedBox(height: 30,),
          searchBar(),
          SizedBox(height: 30,),
          categories(),
        ],
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? cgold : cwhite,
        border: Border.all(
          color: selected ? Colors.transparent : Colors.grey[200],
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(25, 0),
            spreadRadius: 5
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cwhite,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? Colors.transparent : cgrey,
                width: 1.5,
              )
            ),
            child: Icon(
              categoryIcon,
              color: cprimary,
              size: 30,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: cprimary,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: cprimary
            ),
          ),
        ],
      ),
    );
  }
}

// class CustomAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
//     return Container(
//       margin: EdgeInsets.only(bottom: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Icon(Icons.menu),
//           StreamBuilder(
//             stream: bloc.listStream,
//             builder: (context, snapshot) {
//               List<ShoeItem> shoeItems = snapshot.data;
//               int length = shoeItems != null ? shoeItems.length : 0;

//               return buildGestureDetector(length, context, shoeItems);
//             },
//           )
//         ],
//       ),
//     );
//   }

//   GestureDetector buildGestureDetector(
//       int length, BuildContext context, List<ShoeItem> foodItems) {
//     return GestureDetector(
//       onTap: () {
//         if (length > 0) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => CartScreen()));
//         } else {
//           return;
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 30),
//         child: Text(length.toString()),
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//             color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
//       ),
//     );
//   }
// }