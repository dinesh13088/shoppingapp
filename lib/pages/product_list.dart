import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_details_name.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}
class _ProductListState extends State<ProductList> {
   final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
     const border = OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)),
    );

    return  Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '\nShoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          label: Text(filter),
                          labelStyle: const TextStyle(fontSize: 16),
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                        ),
                      ));
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                        return ProductDetails(product: product);
                      }
                      ));
                      
                    },
                    child: ProductCard(
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 1),
                      title: product['title'] as String,
                      image: product['imageURl'] as String,
                      price: product['price'] as double,
                    ),
                  );
                },
              ),
            )
          ],
        );
  }
}