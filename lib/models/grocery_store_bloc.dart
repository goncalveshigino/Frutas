import 'package:flutter/widgets.dart';

enum GroceryState { normal, detalhes, cart}

class GroceryStoreBlock  with ChangeNotifier {

 GroceryState groceryState = GroceryState.normal;

 void changeToNormal(){
    groceryState = GroceryState.normal;
    notifyListeners();
 }

 void changeToCart(){
    groceryState = GroceryState.cart;
    notifyListeners();
 }

}