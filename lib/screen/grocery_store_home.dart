import 'dart:ui';

import 'package:eu_kero/models/grocery_provider.dart';
import 'package:eu_kero/models/grocery_store_bloc.dart';
import 'package:eu_kero/screen/grocery_store_cart.dart';
import 'package:flutter/material.dart';

import 'grocery_store_list.dart';



const backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 100.0;
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
          return - cartBarHeight + kTextTabBarHeight;
        } else if ( state == GroceryState.cart){
          return -(size.height - kTextTabBarHeight - cartBarHeight / 2);
        }
        return 0.0;
    }



    double _getTopForBlackPanel( GroceryState state, Size size){
        if( state == GroceryState.normal){
          return size.height  - cartBarHeight;
        } else if ( state == GroceryState.cart){
          return cartBarHeight / 2;
        }
        return 0.0;
    }

    double _getTopForAppBar( GroceryState state){
        if( state == GroceryState.normal){
          return 0.0;
        } else if ( state == GroceryState.cart){
          return - cartBarHeight;
        }
        return 0.0;
    }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                
                  AnimatedPositioned(
                    duration: _panelTransition ,
                    left: 0, 
                    right: 0, 
                    top: _getTopForWhitePanel(bloc.groceryState, size), 
                    height: size.height - kToolbarHeight,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: GroceryStoreList(),
                      ),
                    ),
                  ),
                   AnimatedPositioned(
                     duration: _panelTransition,
                    left: 0, 
                    right: 0, 
                    top: _getTopForBlackPanel(bloc.groceryState, size), 
                    height: size.height  - kToolbarHeight,
                    child: GestureDetector(
                      onVerticalDragUpdate: _onVerticalGesture,
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: AnimatedSwitcher(
                                duration: _panelTransition,
                                child: SizedBox(
                                  height: kToolbarHeight,
                                  child: bloc.groceryState == GroceryState.normal 
                                ? Row(
                                  children: [
                                    Text(
                                      'Cart', style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 20, 
                                        color: Colors.white
                                      )
                                    ), 
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child:  SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Row(
                                            children: List.generate(
                                              bloc.cart.length, 
                                              (index) => Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Stack(
                                                  children: [
                                                    Hero(
                                                      tag: 'list_${bloc.cart[index].product.name}details',
                                                      child: CircleAvatar(
                                                         backgroundColor: Colors.white,
                                                         backgroundImage: AssetImage(
                                                         bloc.cart[index].product.image
                                                       ),
                                                      ),
                                                    ),
                                                      Positioned(
                                                        right: 0,
                                                        child: CircleAvatar(
                                                          radius: 10,
                                                           backgroundColor: Colors.red,
                                                           child: Text(
                                                             bloc.cart[index].quantity.toString(),
                                                             style: TextStyle(
                                                               color: Colors.white
                                                             )
                                                           ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Color(0xFFF4C459),
                                      child: Text(
                                        bloc.totalCartElement().toString()
                                      ),
                                    )
                                  ],
                                ):const SizedBox.shrink(),
                                ),
                              ),
                            ), 
                           Expanded(child: GroceryStoreCart()),
                          ],
                        ),
                      ),
                    ),
                  ), 

                    AnimatedPositioned(
                      curve: Curves.decelerate,
                      duration: _panelTransition,
                      left: 0,
                      right: 0,
                      top: _getTopForAppBar(bloc.groceryState),
                      child: _AppBarGrocery()
                    ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}



class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: backgroundColor,
      child: Row(
        children: [
          const SizedBox( width: 30,),
          Expanded(
            child: Text(
              'Fruits and Vegetables',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          IconButton(
            icon: Icon( 
              Icons.settings,
            ), 
            onPressed: () => null,
          )
        ],
      ),
    );
  }
}
