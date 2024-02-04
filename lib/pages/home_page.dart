import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_page.dart';

import 'package:shopping_app/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> page = [
    const ProductList(),
    const ProductCart(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          
          onTap: (value) {
            setState(() {
        
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              label: '',
            )
          ]),
    );
  }
}
