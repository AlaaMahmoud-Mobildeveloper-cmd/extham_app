import 'package:extham_app/Provider/cart_provider.dart';
import 'package:extham_app/Screens/cart/cart.dart';
import 'package:extham_app/Screens/home/bloc/cubit.dart';
import 'package:extham_app/Screens/home/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var provider = Provider.of<CartProvider>(context);
        var cubit = BlocProvider.of<HomeCubit>(context);

        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        else if (state is SuccessState) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: cubit.products.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        cubit.products[index].image ?? "",
                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/img.png',
                            fit: BoxFit.cover,
                          );
                        },

                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text(
                      " ${cubit.products[index].title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${cubit.products[index].price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: (){
                              provider.addToCart(cubit.products[index]);
                              showModalBottomSheet(context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      width: double.infinity,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            " ${cubit.products[index].title}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            spacing: 10,
                                            children: [
                                              Text("Added to cart",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(40),
                                                ),
                                                child: Icon(Icons.check,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              )

                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(12),
                                                backgroundColor: Color(0xff004AAC),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: (){
                                                Navigator.pop(context);
                                                Navigator.pushNamed(context, CartScreen.routeName);
                                              },
                                              child: Text("View Cart",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                )
                                              )
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(12),
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(color:Color(0xff004AAC),width: 2),
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              child: Text("Continue Shopping",
                                                  style: TextStyle(
                                                    color:Color(0xff004AAC),
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                              )
                                          ),
                                        ]
                                      )
                                    );
                                  } );
                            },
                            icon: Image.asset("assets/images/cart.png"

                            ))
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }

        else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
