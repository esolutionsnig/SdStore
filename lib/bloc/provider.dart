import 'package:sdstore/model/shoe_item.dart';

class CartProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<ShoeItem> shoeItems = [];

  List<ShoeItem> addToList(ShoeItem shoeItem) {
    bool isPresent = false;

    if (shoeItems.length > 0) {
      for (int i = 0; i < shoeItems.length; i++) {
        if (shoeItems[i].id == shoeItem.id) {
          increaseItemQuantity(shoeItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        shoeItems.add(shoeItem);
      }
    } else {
      shoeItems.add(shoeItem);
    }

    return shoeItems;
  }

  List<ShoeItem> removeFromList(ShoeItem shoeItem) {
    if (shoeItem.quantity > 1) {
      //only decrease the quantity
      decreaseItemQuantity(shoeItem);
    } else {
      //remove it from the list
      shoeItems.remove(shoeItem);
    }
    return shoeItems;
  }

  void increaseItemQuantity(ShoeItem shoeItem) => shoeItem.incrementQuantity();
  void decreaseItemQuantity(ShoeItem shoeItem) => shoeItem.decrementQuantity();
}