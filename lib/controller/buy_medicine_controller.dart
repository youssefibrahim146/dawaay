import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaay/constants/app_defaults.dart';
import 'package:dawaay/constants/dawaay_strings.dart';
import 'package:dawaay/model/medicine.dart';
import 'package:get/get.dart';

class BuyMedicineController extends GetxController {
  Future<List<MedicineModel>> fetchMedicinesData() async {
    List<MedicineModel> medicines = [];
    try {
      QuerySnapshot<Map<String, dynamic>> medicinesList =
          await FirebaseFirestore.instance
              .collection(AppStrings.medicinesCollection)
              .get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> medicine
          in medicinesList.docs) {
        medicines.add(MedicineModel.fromJson(medicine.data(), medicine.id));
      }
    } catch (e) {
      AppDefaults.defaultToast(AppStrings.errorFetchingToast + e.toString());
    }
    return medicines;
  }

  void medicineOnClick(MedicineModel medicine) {
    Get.toNamed(AppStrings.medicineDetailsRoute, arguments: medicine);
  }
}
