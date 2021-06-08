import 'package:eu_kero/models/grocery_product.dart';
import 'package:flutter/material.dart'; 

class GroceryStoreDetails extends StatefulWidget {

   const GroceryStoreDetails({ @required this.product, this.onProductAdded});

  final GroceryProduct product;

  final VoidCallback onProductAdded;

  @override
  _GroceryStoreDetailsState createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {

 String heroTag = '';

  void _addToCart(BuildContext context){
    setState(() {
      heroTag = 'details';
    });
     widget.onProductAdded();
     Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        backgroundColor: Colors.white,
        elevation: 0,
       ),
       body: Column(
         children: [
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Hero(
                          tag: 'list_${widget.product.name}$heroTag',
                          child: Image.asset(
                              widget.product.image, 
                              fit: BoxFit.cover, 
                              height: MediaQuery.of(context).size.height * 0.4,
                          ),
                      ),
                    ),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold
                      ),
                    ), 
                    SizedBox(height: 10,),
                     Text(
                      widget.product.weight,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.grey, 
                      ),
                    ), 
                    Row(
                      children: [
                         Spacer(), 
                          Text(
                            '\$${widget.product.price}',
                            style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                      ],
                    ), 
                    SizedBox(height: 10,),
                  Text(
                    'About the product',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.black, 
                    fontWeight: FontWeight.bold
                   ),
                  ),
                  SizedBox(height: 4,),
                   Text(
                    widget.product.description,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.black, 
                   ),
                  ),
                 ],
                ),
             ),
            ), 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: Icon( Icons.favorite_border, color: Colors.black), 
                      onPressed: (){},
                      ),
                  ),
                    Expanded(
                      flex: 4,
                      child: RaisedButton(
                        color: Color(0xFFF4C459), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Add to cart', 
                            style: TextStyle(color: Colors.black)
                          ),
                        ),
                        onPressed: () => _addToCart(context),
                      ),
                    ),
                ],
              ),
            )
         ],
        )
    );
  }
}