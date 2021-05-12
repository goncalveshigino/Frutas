import 'package:eu_kero/models/grocery_product.dart';
import 'package:flutter/widgets.dart';

enum GroceryState { normal, detalhes, cart}

class GroceryStoreBlock  with ChangeNotifier {

 GroceryState groceryState = GroceryState.normal;
 List<GroceryProduct> catalog = List.unmodifiable(groceryProducts); // unmodifiable(Para nao mudificar a lista)

 void changeToNormal(){
    groceryState = GroceryState.normal;
    notifyListeners();
 }

 void changeToCart(){
    groceryState = GroceryState.cart;
    notifyListeners();
 }

}