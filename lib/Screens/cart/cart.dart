import 'package:extham_app/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(title: Text("My Cart",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        )
      ),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              child:Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Items Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text("\$${provider.getTotalPrice()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Free",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text("Free",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text("\$${provider.getTotalPrice()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(

                  itemBuilder: (context, index){
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              child:  Expanded(
                                child: Image.network(
                                  provider.cart[index].image ?? "",
                                  fit: BoxFit.cover,

                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/tv.png',
                                      height:60,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              spacing: 10,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        " ${provider.cart[index].title}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(onPressed: (){},
                                        icon: Icon(Icons.delete_outline_outlined,
                                          color: Colors.red,
                                          size: 30,
                                        )
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text(
                                      "\$${provider.cart[index].price}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 80,),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                             provider.decrementCount(provider.cart[index]);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Color(0xffc8c7c7),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Icon(Icons.remove,
                                                color: Colors.black,
                                                size: 20,
                                              )
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "${provider.getCount(provider.cart[index])}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: (){
                                              provider.incrementCount(provider.cart[index]);
                                            },
                                            child: Container(
                                                padding: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Color(0xff004AAC),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Icon(Icons.add,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                  ],
                                )
                              ],
                            )
                          ]
                      ),
                    );
                  } ,
                  separatorBuilder: (context, index) =>  SizedBox(height: 10),
                  itemCount: provider.cart.length),
            ),
            SizedBox(height: 10),
            ElevatedButton(

                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  backgroundColor: Color(0xff004AAC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Order Placed Successfully",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Text("Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                )
            ),
          ],
        ),
      )
    );
  }
}
