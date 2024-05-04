import 'package:dawaay/constants/app_defaults.dart';
import 'package:dawaay/constants/app_formats.dart';
import 'package:dawaay/constants/dawaay_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  static FirebaseAuth fireauth = FirebaseAuth.instance;
  RxBool isLoading = RxBool(false);
  RxBool isObscure = RxBool(true);
  String? emailAddress, password;

  /// Validate on the user data before login to make sure that the data is valid.
  loginValidator() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      isLoading.value = true;
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          UserCredential userCredential =
              await fireauth.signInWithEmailAndPassword(
            email: emailAddress!,
            password: password!,
          );
          return userCredential;
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

  /// Go to home screen if the user data is write and the user is exist on the data base.
  void loginButtonOnClick() async {
    UserCredential res = await loginValidator();
    if (res != null && FirebaseAuth.instance.currentUser!.emailVerified) {
      Get.offAllNamed(AppStrings.homeRoute);
    } else {
      isLoading.value = false;
      AppDefaults.defaultToast(AppStrings.verifyEmailFirstToast);
    }
  }

  /// Go to forgot password screen from login screen by the Forgot Password text button.
  void forgotPasswordClick() {
    //Get.toNamed(AppStrings.forgotPasswordRouteRoute);
  }

  /// Change the password field text obscure by the Eye icon button.
  void passwordObscureOnClick() {
    isObscure.value = !isObscure.value;
  }

  void loginWithPhoneNumberTextOnClick() {
    //Get.toNamed(AppStrings.phoneSignupRoute);
  }

  /// Go to signup screen from login screen by the Signup text button.
  void signupTextOnClick() {
    Get.offNamed(AppStrings.signUpRoute);
  }
}
