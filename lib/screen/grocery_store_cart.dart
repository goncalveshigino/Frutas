import 'package:eu_kero/models/grocery_provider.dart';
import 'package:flutter/material.dart'; 

class GroceryStoreCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = GroceryProvider.of(context).bloc;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Expanded(
           child: Text(
             'Cart', 
             style: Theme.of(context).textTheme.headline4.copyWith(
                 color: Colors.white, 
                 fontWeight: FontWeight.bold
             ),
           ),
         ), 
        RaisedButton(
          color: Color(0xFFF4C459),
          shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Next', 
              style: TextStyle(
                color: Colors.black
              )
            ),
          ),
          onPressed: () => null,
        )
       ],
    );
  }
}