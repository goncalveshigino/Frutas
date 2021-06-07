import 'package:eu_kero/models/grocery_provider.dart';
import 'package:eu_kero/widgets/staggered_dual_visual.dart';
import 'package:flutter/material.dart';

import 'grocery_store_details.dart';
import 'grocery_store_home.dart'; 


class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = GroceryProvider.of(context).bloc;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: cartBarHeight, left: 10, right: 10),
      child: StaggeredDualView(
        aspectRadio: 0.7,
        offsetPercent: 0.4,
        spacing: 20,
         itemBuilder: (context, index){
           final product = bloc.catalog[index];
            return GestureDetector(
              onTap: (){
                 Navigator.of(context).push(
                   PageRouteBuilder(
                     transitionDuration: const Duration(milliseconds: 900),
                   pageBuilder: (context, animation, __){
                     return FadeTransition(
                       opacity: animation,
                       child: GroceryStoreDetails(
                         product: product, 
                         onProductAdded: (){
                           bloc.addProduct(product);
                         }
                       )
                      );
                   }
                 ),
                 );
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.white,
                 elevation: 8,
                 shadowColor: Colors.black45,
                 child: Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Expanded(
                         child: Hero(
                           tag: 'list_${product.name}',
                           child: Image.asset(
                             product.image,
                             fit: BoxFit.contain, 
                            
                           ),
                         ),
                       ),
                       Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Colors.black, 
                            fontSize: 20
                          ),
                        ), 
                        const SizedBox(height: 15,),
                         Text(
                         product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500, 
                            color: Colors.black, 
                            fontSize: 14
                          ),
                       ), 
                        Text(
                      product.weight,
                          style: TextStyle(
                            fontWeight: FontWeight.w500, 
                            color: Colors.grey, 
                            fontSize: 20
                          ),
                       )
                     ],
                   ),
                 ),
              ),
            );
         },
         itemCount: bloc.catalog.length,
      ),
    );
   /* return  ListView.builder(
      padding: EdgeInsets.only(top: cartBarHeight),
        itemCount: bloc.catalog.length, 
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
             color: Colors.primaries[index % Colors.primaries.length],
          );
        },
    );*/
  }
}