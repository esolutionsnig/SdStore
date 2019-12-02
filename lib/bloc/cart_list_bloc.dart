import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:sdstore/bloc/provider.dart';
import 'package:sdstore/model/shoe_item.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {

  CartListBloc();

  var _listController = BehaviorSubject<List<ShoeItem>>.seeded([]);

  CartProvider provider = CartProvider();

  //Output
  Stream<List<ShoeItem>> get listStream => _listController.stream;
  //Input
  Sink<List<ShoeItem>> get listSink => _listController.sink;

  // Business Logic
  addToList(ShoeItem shoeItem) {
    listSink.add(provider.addToList(shoeItem));
  }

  removeFromList(ShoeItem shoeItem) {
    listSink.add(provider.removeFromList(shoeItem));
  }

  // dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
  
}
