import 'package:eu_kero/screen/grocery_store_home.dart';
import 'package:eu_kero/widgets/staggered_gred_dual.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GroceryStoreHome()
    );
  }
}