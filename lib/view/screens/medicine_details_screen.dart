import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/model/medicine.dart';
import 'package:dawaay/view/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineDetailsScreen extends StatelessWidget {
  MedicineDetailsScreen({super.key});

  final MedicineModel medicine = Get.arguments as MedicineModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              medicine.imageUrl,
              height: 170,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: DawaayColors.kprimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      medicine.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const GapWidget(25),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Medicine price"),
                      ),
                      const GapWidget(50),
                      Text(
                        "${medicine.price} EGP",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(medicine.dosage),
                  Text(medicine.sideEffects),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
