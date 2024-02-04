import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';


class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
   // final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart details'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartItem['imageURl'] as String),
              ),
              //delete part
              trailing:
                  IconButton(icon: const Icon(Icons.delete,color: Colors.red,), 
                  onPressed: () {

                     showDialog(context: context,
                     barrierDismissible: false,
                      builder: (context){
                      
                      return AlertDialog(
                        
                        title: Text('Delete product',style: Theme.of(context).textTheme.bodyMedium,),
                        content: const Text('Are you sure want to remove the product from your cart'),
                        

                        actions: [
                          
                          TextButton(onPressed: (){
                            setState(() {
                              //context.read<CartProvider>().removeProduct(cartItem);
                              Provider.of<CartProvider>(context,listen: false).removeProduct(
                              cartItem
                            );

                            }
                            );
                            Navigator.of(context).pop();
                            
                          }, child:  const Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                          
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child:  const Text('No',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),))

                        ],
                      );
                      
                     });

                  }),
              title: Text(
                cartItem['title'] as String
                ,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                (cartItem['size'] as int).toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }),
    );
  }
}
