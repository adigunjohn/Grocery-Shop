import 'dart:collection';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop/grocerywidget.dart';


class ShopModel extends ChangeNotifier{

  // List _groceryList = [
  //   GroceryCardd(groceryName: 'Juice', groceryPicture: 'images/juice.png', groceryColor: Colors.green.shade50, groceryPrice: 15),
  //   GroceryCardd(groceryName: 'Banana', groceryPicture: 'images/banana.jpg', groceryColor: Colors.red.shade50, groceryPrice: 50),
  //   GroceryCardd(groceryName: 'Bread', groceryPicture: 'images/bread.png', groceryColor: Colors.blue.shade50, groceryPrice: 30),
  //   GroceryCardd(groceryName: 'Meat', groceryPicture: 'images/meat.png', groceryColor: Colors.yellow.shade50, groceryPrice: 120),
  //   GroceryCardd(groceryName: 'Rice', groceryPicture: 'images/rice.png', groceryColor: Colors.purple.shade50, groceryPrice: 250),
  // ];

  List _groceryList = [
    ['Juice','images/juice.png',Colors.green.shade50, 15],
    ['Banana', 'images/banana.jpg',Colors.red.shade50,50],
    ['Bread','images/bread.png',Colors.blue.shade50, 30],
    ['Meat','images/meat.png',Colors.yellow.shade50,120],
    ['Rice','images/rice.png',Colors.purple.shade50, 250],
  ];

   // get groceryList => _groceryList;
  UnmodifiableListView get groceryList {
    return UnmodifiableListView(_groceryList);
  }

   int get groceryListCount => _groceryList.length;


   List _cartList = [];
   // get cartList => _cartList;
  UnmodifiableListView get cartList {
    return UnmodifiableListView(_cartList);
  }

  int get cartListCount => _cartList.length;

   void addToCart (int index){
     _cartList.add(_groceryList[index]);
     notifyListeners();
   }

  void removeFromCart(int index){
     _cartList.removeAt(index);
     notifyListeners();
  }
  void deleteAllCart(){
     _cartList.clear();
     notifyListeners();
  }
  String calculateTotalPrice (){
     dynamic totalPrice = 0;
     for(int i = 0; i < _cartList.length; i++){
       totalPrice += _cartList[i][3];
     }
     return totalPrice.toString();
  }



}