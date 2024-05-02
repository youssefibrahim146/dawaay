import 'medicine.dart';

class CartItemModel {
  final MedicineModel medicine;
  int quantity;

  CartItemModel({
    required this.medicine,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'medicine': medicine.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      medicine:
          MedicineModel.fromJson(json["medicine"], json["medicine"]["key"]),
      quantity: int.parse(json["quantity"]),
    );
  }
//
}
