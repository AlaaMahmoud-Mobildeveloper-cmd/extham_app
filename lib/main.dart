import 'package:extham_app/Provider/cart_provider.dart';
import 'package:extham_app/Screens/cart/cart.dart';
import 'package:extham_app/Screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
        CartScreen.routeName: (context) =>  CartScreen(),
      },
    );
  }
}
