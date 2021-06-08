import 'package:eu_kero/models/grocery_product.dart';
import 'package:flutter/widgets.dart';

enum GroceryState { normal, detalhes, cart}

class GroceryStoreBlock  with ChangeNotifier {

 GroceryState groceryState = GroceryState.normal;
 List<GroceryProduct> catalog = List.unmodifiable(groceryProducts); // unmodifiable(Para nao mudificar a lista)

 List<GroceryProductItem> cart = [];

 void changeToNormal(){
    groceryState = GroceryState.normal;
    notifyListeners();
 }

 void changeToCart(){
    groceryState = GroceryState.cart;
    notifyListeners();
 }

// Adicionar item no carrinho
 void addProduct( GroceryProduct product){
   for( GroceryProductItem item in cart){
     if(item.product.name == product.name){
      item.increment();
      notifyListeners();
      return;
     }
   }
    cart.add(GroceryProductItem(product:product ));
    notifyListeners();
 }

 void deleteProduct( GroceryProductItem productItem){
   
    cart.remove(productItem);
    notifyListeners();
 }

 


 int totalCartElement() => cart.fold<int>(
  0, 
 (previousValue, element) => previousValue + element.quantity);

  double totalPricetElement() => cart.fold<double>(
  0.0, 
 (previousValue, element) => previousValue + (element.quantity * element.product.price));

}


class GroceryProductItem {

  GroceryProductItem({this.quantity = 1, @required this.product});

    int quantity;
  final GroceryProduct product;

   void increment(){
     quantity++;
   }

  // void decrement(){}
}