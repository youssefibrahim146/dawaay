import 'package:dawaay/constans/dawaay_strings.dart';

class MedicineModel {
  final String name;
  final String dosage;
  final String imageUrl;
  final String sideEffects;
  final int price;
  final String key;
  int quantity;

  MedicineModel({
    required this.name,
    required this.dosage,
    required this.imageUrl,
    required this.sideEffects,
    required this.price,
    required this.key,
    required this.quantity,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json, String key) {
    return MedicineModel(
      key: key,
      name: json[AppStrings.nameField] ?? "xx",
      dosage: json[AppStrings.dosageField] ?? "xx",
      imageUrl: json[AppStrings.imageUrlField] ?? "xx",
      sideEffects: json[AppStrings.sideEffectsField] ?? "xx",
      price: json[AppStrings.priceField] as int ?? 00,
      quantity: json["quantity"] as int ?? 00,
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
      "quantity": quantity,
    };
  }

//
}
