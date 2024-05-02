import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaay/model/cart_item_model.dart';
import 'package:dawaay/model/medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    getUserCartItems();
    super.onInit();
  }

  final _cartItems = <CartItemModel>[].obs;

  List<CartItemModel> get cartItems => _cartItems.toList();

  void addToCart(MedicineModel medicine) {
    final existingItem = _cartItems.firstWhereOrNull(
      (item) => item.medicine.key == medicine.key,
    );

    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      _cartItems.add(CartItemModel(medicine: medicine, quantity: 1));
    }

    saveCartToFirebase();
  }

  Future<void> saveCartToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final cartItemsJson = _cartItems.map((item) => item.toJson()).toList();

    await FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .set({'items': cartItemsJson});
  }

  Future<void> getUserCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final cartDoc = await FirebaseFirestore.instance
        .collection('carts')
        .doc(user.uid)
        .get();

    if (cartDoc.exists) {
      final cartItemsJson = cartDoc.data()?['items'] as List;
      _cartItems.value = cartItemsJson
          .map((itemJson) => CartItemModel.fromJson(itemJson))
          .toList();
    }
  }

  void removeFromCart(MedicineModel medicine) {
    final existingItem = _cartItems.firstWhereOrNull(
      (item) => item.medicine.key == medicine.key,
    );

    if (existingItem != null) {
      _cartItems.remove(existingItem);
      saveCartToFirebase();
    }
  }

  void incrementQuantity(MedicineModel medicine) {
    final existingItem = _cartItems.firstWhereOrNull(
      (item) => item.medicine.key == medicine.key,
    );

    if (existingItem != null) {
      existingItem.quantity++;
      saveCartToFirebase();
    }
  }

  void decrementQuantity(MedicineModel medicine) {
    final existingItem = _cartItems.firstWhereOrNull(
      (item) => item.medicine.key == medicine.key,
    );

    if (existingItem != null && existingItem.quantity > 1) {
      existingItem.quantity--;
      saveCartToFirebase();
    }
  }

  void calculateTotalPrice() {
    for (var item in _cartItems) {
      totalPrice.value += (item.medicine.price * item.quantity);
    }
  }
}
