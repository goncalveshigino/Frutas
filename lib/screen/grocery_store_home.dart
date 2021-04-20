import 'dart:ui';

import 'package:flutter/material.dart';

const _backgroundColor = Color(0xFFF6F5F2);
const _cartBarHeight = 100.0;

class GroceryStoreHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          _AppBarGrocery(),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0, 
                  right: 0, 
                  top: - _cartBarHeight, 
                  height: size.height - kToolbarHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      )
                    )
                  ),
                ),
                 Positioned(
                  left: 0, 
                  right: 0, 
                  top: size.height - kToolbarHeight - _cartBarHeight, 
                  height: size.height ,
                  child: Container(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: _backgroundColor,
      child: Row(
        children: [
          BackButton(
            color: Colors.black,
          ),
          const SizedBox( width: 10,),
          Expanded(
            child: Text(
              'Frutas e Vegetais',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => null,
          )
        ],
      ),
    );
  }
}
