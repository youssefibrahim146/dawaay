import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:dawaay/controller/buy_medicine_controller.dart';
import 'package:dawaay/controller/cart_controller.dart';
import 'package:dawaay/model/medicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuyMedicineScreen extends GetWidget<BuyMedicineController> {
  const BuyMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppStrings.cartRoute);
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 25,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //search bar
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search for medicine',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                fillColor: DawaayColors.kprimaryColor,
                filled: true,
              ),
            ),
          ),
          //medicine list
          FutureBuilder<List<MedicineModel>>(
            future: controller.fetchMedicinesData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<MedicineModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Icon(
                  Icons.error_outline,
                  color: DawaayColors.kprimaryColor,
                  size: 50.sp,
                );
              } else {
                List<MedicineModel> medicines = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: medicines.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.medicineOnClick(medicines[index]);
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: DawaayColors.kprimaryColor,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    medicines[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  medicines[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                        "${medicines[index].price} EGP",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: DawaayColors.kprimaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          final cartController =
                                              Get.find<CartController>();
                                          cartController
                                              .addToCart(medicines[index]);
                                        },
                                        child: const Icon(
                                          Icons.add_shopping_cart,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
