import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaay/constants/app_defaults.dart';
import 'package:dawaay/constants/app_formats.dart';
import 'package:dawaay/constants/dawaay_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SingUpController extends GetxController {
  static CollectionReference usersCollection =
      firestore.collection(AppStrings.usersCollection);
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  static FirebaseAuth fireauth = FirebaseAuth.instance;
  String? userName, lastName, emailAddress, password;
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;

  /// Validate on the user data before signup to make sure that the data is valid.
  signUpValidator() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      isLoading.value = true;
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          UserCredential userCredential =
              await fireauth.createUserWithEmailAndPassword(
            email: emailAddress!,
            password: password!,
          );
          if (userCredential.user!.emailVerified == false) {
            await fireauth.currentUser!.sendEmailVerification();
            await fireauth.signOut();
            await usersCollection.doc(emailAddress).set({
              AppStrings.nameField: userName,
              AppStrings.lastNameField: lastName,
              AppStrings.emailField: emailAddress,
            });
            await usersCollection.doc(AppStrings.authUsersDocument).set(
              {
                AppStrings.emailsField: FieldValue.arrayUnion([emailAddress!])
              },
              SetOptions(merge: true),
            ).then(
              (value) => Get.offAllNamed(AppStrings.logInRoute),
            );
          } else {
            return userCredential;
          }
        } on FirebaseAuthException catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(
              AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        } catch (e) {
          isLoading.value = false;
          AppDefaults.defaultToast(
              AppFormats.myFormatter(e.toString(), AppStrings.spaceSign));
        }
      } else {
        isLoading.value = false;
        AppDefaults.defaultToast(AppStrings.connectionErrorToast);
      }
    }
  }

  /// Go to login screen if the signup operation is successful.
  void signupButtonOnClick() async {
    UserCredential res = await signUpValidator();
    if (res != null) {
      Get.offAllNamed(AppStrings.logInRoute);
    }
  }

  /// Change the password field text obscure by the Eye icon button.
  void passwordObscureOnClick() {
    isObscure.value = !isObscure.value;
  }

  /// Go to signup with phone number screen from signup screen by the Signup With Phone Number text button.
  void signupWithPhoneNumberTextOnClick() {
    //Get.toNamed(AppStrings.phoneSignupRoute);
  }

  /// Go to login screen from signup screen by the Login text button.
  void loginTextOnClick() {
    Get.offNamed(AppStrings.logInRoute);
  }
}
