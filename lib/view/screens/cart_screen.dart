import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.stramCartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = controller.stramCartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: DawaayColors.kprimaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              cartItem.imageUrl,
                              height: 120,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(cartItem.name),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        controller.removeFromCart(cartItem);
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.incrementQuantity(cartItem);
                                      },
                                      icon:
                                          const Icon(Icons.add_circle_outline),
                                    ),
                                    Text('Quantity: ${cartItem.quantity}'),
                                    IconButton(
                                      onPressed: () {
                                        controller.decrementQuantity(cartItem);
                                      },
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: DawaayColors.kprimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Price: ${cartItem.price * cartItem.quantity} EGP',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }),

              /* StreamBuilder(
                  stream: controller.fetchUserCartItems(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      print(snapshot);
                      print(snapshot.error);
                      return Icon(
                        Icons.error_outline,
                        color: DawaayColors.kprimaryColor,
                        size: 60,
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            final cartItem = controller.stramCartItems[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: DawaayColors.kprimaryColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    cartItem.imageUrl,
                                    height: 120,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(cartItem.name),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.add_circle_outline),
                                          ),
                                          Text('Quantity: ${cartItem.quantity}'),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.remove_circle_outline),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: DawaayColors.kprimaryColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'Price: ${cartItem.price * cartItem.quantity} EGP',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }),*/
              Obx(() {
                controller.calculateTotalPrice();
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: DawaayColors.kprimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Total Price: ${controller.totalPrice.value} EGP',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
