import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = controller.cartItems[index];
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
                            cartItem.medicine.imageUrl,
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
                                  Text(cartItem.medicine.name),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      controller
                                          .removeFromCart(cartItem.medicine);
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
                                      controller
                                          .incrementQuantity(cartItem.medicine);
                                      controller.calculateTotalPrice();
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                  Text('Quantity: ${cartItem.quantity}'),
                                  IconButton(
                                    onPressed: () {
                                      controller
                                          .decrementQuantity(cartItem.medicine);
                                      controller.calculateTotalPrice();
                                    },
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
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
                                  'Price: ${cartItem.medicine.price * cartItem.quantity} EGP',
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
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: DawaayColors.kprimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Total Price: ${controller.totalPrice} EGP',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
