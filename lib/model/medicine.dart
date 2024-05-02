import 'package:dawaay/constans/dawaay_strings.dart';

class MedicineModel {
  final String name;
  final String dosage;
  final String imageUrl;
  final String sideEffects;
  final int price;
  final String key;

  MedicineModel({
    required this.name,
    required this.dosage,
    required this.imageUrl,
    required this.sideEffects,
    required this.price,
    required this.key,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json, String key) {
    return MedicineModel(
      key: key,
      name: json[AppStrings.nameField],
      dosage: json[AppStrings.dosageField],
      imageUrl: json[AppStrings.imageUrlField],
      sideEffects: json[AppStrings.sideEffectsField],
      price: json[AppStrings.priceField] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "dosage": dosage,
      "imageUrl": imageUrl,
      "sideEffects": sideEffects,
      "price": price,
      "key": key,
    };
  }

//
}
