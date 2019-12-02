import 'package:sdstore/model/shoe_item.dart';

class CartProvider {
  List<ShoeItem> shoeItems = [];

  List<ShoeItem> addToList(ShoeItem shoeItem) {
    shoeItems.add(shoeItem);
    return shoeItems;
  }

  List<ShoeItem> removeFromList(ShoeItem shoeItem) {
    shoeItems.remove(shoeItem);
    return shoeItems;
  }
}