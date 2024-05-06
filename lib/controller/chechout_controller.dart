import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaay/model/medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constants/dawaay_strings.dart';

class CheckoutController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  var cartCollection = FirebaseFirestore.instance
      .collection('carts')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  var confirmedOrderCollection = FirebaseFirestore.instance
      .collection('confirmed orders')
      .doc(FirebaseAuth.instance.currentUser!.email);

  RxBool isCashOnDelivery = false.obs;
  RxBool isCreditCard = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLocation = false.obs;
  ExpandedTileController expandedTileController = ExpandedTileController();
  var position = Position(
    latitude: 0,
    longitude: 0,
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    headingAccuracy: 0,
    timestamp: DateTime.now(),
    altitudeAccuracy: 0,
  ).obs;

  cashOnDeliveryOnClick() {
    isCashOnDelivery.value
        ? isCashOnDelivery.value = false
        : isCashOnDelivery.value = true;
    isCreditCard.value = false;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position.value = await Geolocator.getCurrentPosition();
    isLocation.value = true;
    return await Geolocator.getCurrentPosition();
  }

  void confirmYourOrderOnClick(List<MedicineModel> medicine) async {
    isLoading.value = true;
    if (isLocation.value) {
      if (isCashOnDelivery.value ||
          (isCreditCard.value &&
              cardNumberController.value.text.isNotEmpty &&
              cardHolderNameController.value.text.isNotEmpty &&
              expiryDateController.value.text.isNotEmpty &&
              cvvController.value.text.isNotEmpty)) {
        /// confirm code here
        for (var medicineModel in medicine) {
          await confirmedOrderCollection.collection('items').add({
            AppStrings.nameField: medicineModel.name,
            AppStrings.priceField: medicineModel.price,
            AppStrings.quantityField: medicineModel.quantity,
            'key': medicineModel.key,
          });
          await cartCollection
              .collection("items")
              .doc(medicineModel.key)
              .delete();
        }
        Get.offAllNamed(AppStrings.homeRoute);
        Get.snackbar(
          'Order Confirmed',
          'Your order has been confirmed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        isLoading.value = false;
      } else if (isCreditCard.value &&
          (cardNumberController.value.text.isEmpty ||
              cardHolderNameController.value.text.isEmpty ||
              expiryDateController.value.text.isEmpty ||
              cvvController.value.text.isEmpty)) {
        Get.snackbar(
          'Payment Method',
          'Please fill all the fields',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
      } else {
        Get.snackbar(
          'Payment Method',
          'Please select a payment method',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        'Location',
        'Please add your location',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
    }
  }
}
