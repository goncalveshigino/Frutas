
class GroceryProduct {

    const GroceryProduct({this.price, this.name, this.description, this.image, this.weight});

  final double price;
  final String name;
  final String description; 
  final String image;
  final String weight;

}

const groceryProducts = <GroceryProduct> [
  
    GroceryProduct(
       price: 200.00, 
       name: 'Ananas' ,
       description: 'A melhor banana do Lubango agora mais proximo de si com apenas um click',
       image: 'assets/images/ananas1.jpg',
      //image: 'https://i.pinimg.com/736x/0d/cc/83/0dcc8351a843740be6d9387d14ec527d.jpg',
       weight: '500g'
    ),


    GroceryProduct(
       price: 500.00, 
       name: 'Abacate' ,
       description: 'O melhor Morango do Lubango agora mais proximo de si com apenas um click',
       image: 'assets/images/abacate.jpg',
       //image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO1CLXxV6xupg8XW_AVQw9L03QI0J4DaN7v_k_sC779cNhCmF2aSnvPXfstOOZStfhfNA&usqp=CAU',
       weight: '400g'
    ),  


    GroceryProduct(
       price: 200.00, 
       name: 'Goibas' ,
       description: 'A melhor Manga do Lubango agora mais proximo de si com apenas um click',
       image: 'assets/images/goibas.jpg',
       //image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMim4YODZ5sWpJi9ewRGTiQMnRa-Z6UKv0AeOlZ3S-emWbr4krszYmARQWIKzajYmAIMA&usqp=CAU',
       weight: '500g'
    ),


    GroceryProduct(
       price: 350.00, 
       name: 'Laranja' ,
       description: 'A melhor Melancia do Lubango agora mais proximo de si com apenas um click',
       image: 'assets/images/laranja.jpg',
       //image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRto7DhPD_Um3tl3oyamPUmbJBkNrfgqe222T6IKoRYk8onr-4mnMlWsjmpNe8MFp5vtwU&usqp=CAU', 
       weight: '500g'
    ),  


    GroceryProduct(
       price: 200.00, 
       name: 'Morangos' ,
       description: 'A melhor Amora do Lubango agora mais proximo de si com apenas um click',
       image: 'assets/images/morangos.jpeg',
      // image: 'https://bemestaresaude.org/wp-content/uploads/2016/09/rom%C3%A32.jpg',
       weight: '500g'
    ), 

      GroceryProduct(
       price: 200.00, 
       name: 'Salada de frutas' ,
       description: 'As melhores Peras do Lubango agora mais proximo de si com apenas um click',
       image: 'assets/images/salada.jpeg',
      // image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKTSn7EDadoEDVr0xkTR2KC8BdAMaqfipJmA&usqp=CAU', 
       weight: '500g'
    ), 

    GroceryProduct(
       price: 500.00, 
       name: 'Melancia' ,
       description: 'As melhores Peras do Lubango agora mais proximo de si com apenas um click',
      image: 'assets/images/melancia.jpeg',
      // image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaRC02-hTDx501ECtHNqSnF4V0ggvTak7ZHZYAMGWoGLvgdeqj-3jre9Q27Rr2Rc8BL9o&usqp=CAU',
       weight: '500g'
    ),

];