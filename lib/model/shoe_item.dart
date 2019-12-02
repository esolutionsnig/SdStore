import 'package:flutter/cupertino.dart';

// Import Data
ShoeItemList shoeItemList = ShoeItemList(shoeItems: [
  ShoeItem(
    id: 1,
    title: "Classic Men's Bag",
    shop: "Lekki Luxury Store",
    price: 95500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/AC007.png",
  ),
  ShoeItem(
    id: 2,
    title: "Black Corporate Shoe",
    shop: "Lekki Luxury Store",
    price: 85500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/OS001-600x600.png",
  ),
  ShoeItem(
    id: 3,
    title: "Ankle Boot",
    shop: "Lekki Luxury Store",
    price: 90500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/SC003-600x600.png",
  ),
  ShoeItem(
    id: 4,
    title: "White Sole Smart Casual Shoe",
    shop: "Yabaa Main Store",
    price: 55400,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/SC004.png",
  ),
  ShoeItem(
    id: 5,
    title: "Brown Smart Casual Shoe",
    shop: "Lekki Luxury Store",
    price: 45500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/SC005.png",
  ),
  ShoeItem(
    id: 6,
    title: "Sleek Smart Casual Shoe",
    shop: "Lekki Luxury Store",
    price: 65500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/SC009-600x600.png",
  ),
  ShoeItem(
    id: 7,
    title: "Slip-Ons",
    shop: "Yaba Main Store",
    price: 6500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2018/12/s13.jpg",
  ),
  ShoeItem(
    id: 8,
    title: "Men's Travel Lite Bag",
    shop: "Lekki Luxury Store",
    price: 55500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/AC005.png",
  ),
  ShoeItem(
    id: 9,
    title: "Sandal",
    shop: "Yaba Main Store",
    price: 15500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/SO003.png",
  ),
  ShoeItem(
    id: 10,
    title: "Slip-On Deep Brown",
    shop: "Lekki Luxury Store",
    price: 95500,
    imgUrl: "https://stdavidsshoes.com/wp-content/uploads/2017/01/SO002.png",
  ),
]);

class ShoeItemList {
  List<ShoeItem> shoeItems;

  // Initialize
  ShoeItemList({
    @required this.shoeItems
  });
}

class ShoeItem {
  int id;
  String title;
  String shop;
  double price;
  String imgUrl;
  int quantity;

  // Initialize variables
  ShoeItem({
    @required this.id,
    @required this.title,
    @required this.shop,
    @required this.price,
    @required this.imgUrl,

    this.quantity = 1
  });

  // Increment Quantity
  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  // Decrement Quantity
  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}