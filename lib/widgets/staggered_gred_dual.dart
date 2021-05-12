import 'package:eu_kero/models/grocery_product.dart';
import 'package:eu_kero/widgets/staggered_dual_visual.dart';
import 'package:flutter/material.dart'; 


class SaggeredGredDualView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.white,
         appBar: AppBar(
           elevation: 0,
           title: Text('Meals', style: TextStyle(color: Colors.black),),
           centerTitle: true,
           backgroundColor: Colors.white,
         ),
         body: Padding(
           padding: const EdgeInsets.symmetric( horizontal: 20.0),
           child: StaggeredDualView(
             aspectRadio: 0.65,
             spacing: 20,
             itemBuilder: (context, index){
                return MealItem(
                  meal:groceryProducts[index]
                );
             },
             itemCount: groceryProducts.length,
           ),
         ),
      ),
    );
  }
}

class MealItem extends StatelessWidget { 

 const MealItem({this.meal});

 final GroceryProduct meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 8,
      shadowColor: Colors.black54,
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Expanded(
             child: AspectRatio(
               aspectRatio: 1,
               child: Image.network(
                 meal.image, 
                 fit: BoxFit.cover,
                ),
             ),
           ), 

           SizedBox(height: 10,), 

           Expanded(
             child: Column(
               children: [
                 Text(
                   meal.name, 
                   maxLines: 2, 
                   style: TextStyle(
                     fontWeight: FontWeight.bold, 
                     fontSize: 22
                   )
                 ),
                  Text(
                   meal.weight, 
                   style: TextStyle(
                     fontWeight: FontWeight.bold, 
                     fontSize: 16, 
                     color: Colors.grey
                   )
                 ),
                 Row(
                   children: List.generate(
                     5,
                     (index) => Icon(
                      index < 4 ? Icons.star : Icons.star_border, 
                       color: Colors.yellow
                     )
                   )
                 )
               ],
             ),
           )
         ],
       ),
    );
  }
}
