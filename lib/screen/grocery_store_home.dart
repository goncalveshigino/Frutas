import 'dart:ui';

import 'package:eu_kero/models/grocery_store_bloc.dart';
import 'package:flutter/material.dart';



const _backgroundColor = Color(0xFFF6F5F2);
const _cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 500);

class GroceryStoreHome extends StatefulWidget {
  @override
  _GroceryStoreHomeState createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {

  final bloc = GroceryStoreBlock();


    void _onVerticalGesture(DragUpdateDetails details) {
       if(details.primaryDelta < -7) {
         bloc.changeToCart();
       } else if ( details.primaryDelta > 12){
         bloc.changeToNormal();
       }
    }

    double _getTopForWhitePanel( GroceryState state, Size size){
        if( state == GroceryState.normal){
          return - _cartBarHeight;
        } else if ( state == GroceryState.cart){
          return -(size.height - kTextTabBarHeight - _cartBarHeight / 2);
        }
    }


    double _getTopForBlackPanel( GroceryState state, Size size){
        if( state == GroceryState.normal){
          return size.height - kTextTabBarHeight - _cartBarHeight;
        } else if ( state == GroceryState.cart){
          return _cartBarHeight / 2;
        }
    }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: bloc,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              _AppBarGrocery(),
              Expanded(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: _panelTransition ,
                      left: 0, 
                      right: 0, 
                      top: _getTopForWhitePanel(bloc.groceryState, size), 
                      height: size.height - kToolbarHeight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                          ),
                        ),
                      ),
                    ),
                     AnimatedPositioned(
                       duration: _panelTransition,
                      left: 0, 
                      right: 0, 
                      top: _getTopForBlackPanel(bloc.groceryState, size), 
                      height: size.height ,
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalGesture,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
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
              'Fruits and Vegetables',
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
