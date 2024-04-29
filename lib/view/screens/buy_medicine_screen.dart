import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyMedicineScreen extends StatelessWidget {
  const BuyMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppStrings.medicineDetailsRoute);
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
                              "https://cdn.sanity.io/images/8f2jlyhn/production/481b3cdbde095ebb65b6dbf43d1a7612f8d4f7ce-2000x2000.jpg?w=600&auto=format&q=75",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text(
                            "title",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                            child: const Text(
                              "30 EGP",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
