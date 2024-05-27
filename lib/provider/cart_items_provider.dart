import 'package:flutter/cupertino.dart';

class CartItemsProvider extends ChangeNotifier{

  int _count = 1;

  get count => _count;


  CartItemsProvider(){
  _count = 1;
  }
  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement(){
    if(_count > 1){
      _count--;
    }

    notifyListeners();
  }

  void setCount(int count){
    _count = count;
    notifyListeners();
  }

}