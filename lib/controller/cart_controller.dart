import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:dawaay/model/medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  void onInit() async {
    await fetchUserCartItems();
    super.onInit();
  }

  RxDouble totalPrice = 0.0.obs;
  User? auth = FirebaseAuth.instance.currentUser;
  RxList<MedicineModel> stramCartItems = RxList<MedicineModel>();
  var cartCollection = FirebaseFirestore.instance
      .collection('carts')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  void addToCart(MedicineModel medicine) async {
    final itemQuery = await cartCollection
        .collection("items")
        .where("key", isEqualTo: medicine.key)
        .limit(1)
        .get();

    if (itemQuery.docs.isNotEmpty) {
      // If item already exists, update its quantity
      final docId = itemQuery.docs.first.id;
      await cartCollection
          .collection("items")
          .doc(docId)
          .update({AppStrings.quantityField: FieldValue.increment(1)});
    } else {
      // If item doesn't exist, add it to the cart
      await cartCollection.collection("items").add({
        "key": medicine.key,
        AppStrings.nameField: medicine.name,
        AppStrings.dosageField: medicine.dosage,
        AppStrings.imageUrlField: medicine.imageUrl,
        AppStrings.sideEffectsField: medicine.sideEffects,
        AppStrings.priceField: medicine.price,
        AppStrings.quantityField: 1,
      });
    }
    await fetchUserCartItems();
  }

  Future<List<MedicineModel>> fetchUserCartItems() async {
    QuerySnapshot snapshot = await cartCollection.collection("items").get();
    List<MedicineModel> cartItems = snapshot.docs.map((doc) {
      return MedicineModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
    stramCartItems.value = cartItems;
    return cartItems;
  }

  void removeFromCart(MedicineModel medicine) {
    cartCollection.collection("items").doc(medicine.key).delete();
  }

  void incrementQuantity(MedicineModel medicine) async {
    await cartCollection.collection("items").doc(medicine.key).update({
      'quantity': FieldValue.increment(1),
    });
    await fetchUserCartItems();
  }

  void decrementQuantity(MedicineModel medicine) async {
    await cartCollection.collection("items").doc(medicine.key).update({
      'quantity': FieldValue.increment(-1),
    });
    await fetchUserCartItems();
  }

  void calculateTotalPrice() {
    totalPrice.value = 0.0;
    fetchUserCartItems();
    for (MedicineModel cartItem in stramCartItems) {
      totalPrice.value += cartItem.price * cartItem.quantity;
    }
  }
}
