import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';

import 'package:shopping_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //if i want to return multiple then i can use multiprovider which takes multiple
      // changenotifierprovider but inside the named argument called provider
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'MyApp',
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
               titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
            textTheme: const TextTheme(
                titleLarge: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                bodyMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                primary: const Color.fromRGBO(254, 206, 1, 1),
                seedColor: const Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(119, 119, 119, 1)))),
      ),
    );
  }
}
