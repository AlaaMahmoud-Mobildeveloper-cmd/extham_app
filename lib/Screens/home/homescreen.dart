import 'package:extham_app/Provider/cart_provider.dart';
import 'package:extham_app/Screens/cart/cart.dart';
import 'package:extham_app/Screens/home/bloc/cubit.dart';
import 'package:extham_app/Screens/home/bloc/state.dart';
import 'package:extham_app/Screens/home/widget/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';





class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(title:Image.asset("assets/images/logo.png"),
          actions:[
            Stack(
              alignment: Alignment.center,
              children: [
               Positioned(
                 top: 4,
                 left: 4,
                 child: provider.cartCount != 0 ? Container(
                 padding: const EdgeInsets.symmetric(horizontal: 5),
                 decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: Text("${provider.cartCount}",
                   style: const TextStyle(
                     color: Colors.white,
                     fontSize: 12,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ):SizedBox(),),
                IconButton(onPressed: (){
                  Navigator.pushNamed(context, CartScreen.routeName);
                }, icon: Image.asset("assets/images/cart.png")),
              ],
            )
          ]
        ),
        body:ProductItems(),
      ),
    );
  }
}
