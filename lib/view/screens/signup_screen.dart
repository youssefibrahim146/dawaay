import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:dawaay/constants/dawaay_strings.dart';
import 'package:dawaay/controller/singup_contoller.dart';
import 'package:dawaay/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetWidget<SingUpController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            // --------- background-------------
            image: DecorationImage(
              image: AssetImage('assets/bg/main sign up design.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // --------------- name -----------------------------
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 45),
                    decoration: BoxDecoration(
                        color: DawaayColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      onSaved: (value) {
                        controller.userName = value!;
                      },
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.nameEmptyValidate;
                        } else if (value.length < 4) {
                          return AppStrings.nameLessThen4Validate;
                        } else if (value.length > 24) {
                          return AppStrings.nameLargerThen24Validate;
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                        border: InputBorder.none,
                        hintMaxLines: 1,
                      ),
                    ),
                  ),
                  // ---------------- Last Name ---------------------
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 45),
                    decoration: BoxDecoration(
                        color: DawaayColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        controller.lastName = value!;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.nameEmptyValidate;
                        } else if (value.length < 4) {
                          return AppStrings.nameLessThen4Validate;
                        } else if (value.length > 24) {
                          return AppStrings.nameLargerThen24Validate;
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                        border: InputBorder.none,
                        hintMaxLines: 1,
                      ),
                    ),
                  ),
                  // --------------   email field ---------------------
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 45),
                    decoration: BoxDecoration(
                        color: DawaayColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      onSaved: (String? value) {
                        controller.emailAddress = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.emailEmptyValidate;
                        } else if (!value.contains(AppStrings.atSign)) {
                          return AppStrings.emailMessingAtSignValidate;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                        hintMaxLines: 1,
                      ),
                    ),
                  ),
                  // -------------  password field -------------

                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    margin: const EdgeInsets.only(
                        top: 7, bottom: 20, left: 45, right: 45),
                    decoration: BoxDecoration(
                        color: DawaayColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Obx(() {
                      return TextFormField(
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.passwordEmptyValidate;
                          } else if (value.length < 8) {
                            return AppStrings.passwordLessThen8Validate;
                          } else if (value.length > 24) {
                            return AppStrings.passwordLargerThen24Validate;
                          }
                          return null;
                        },
                        obscureText: controller.isObscure.value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          hintMaxLines: 1,
                          suffixIcon: InkWell(
                            onTap: controller.passwordObscureOnClick,
                            child: Icon(
                              controller.isObscure.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: DawaayColors.kBlueColor,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  // ------------ re type your password ----------
                  /*Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    margin: const EdgeInsets.only(
                        top: 7, bottom: 20, left: 45, right: 45),
                    decoration: BoxDecoration(
                        color: DawaayColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.passwordEmptyValidate;
                        } else if (value.length < 8) {
                          return AppStrings.passwordLessThen8Validate;
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Re-enter Password',
                        border: InputBorder.none,
                        hintMaxLines: 1,
                      ),
                    ),
                  ),*/
                  // ---------------- signup button -----------------
                  const SizedBox(height: 10),
                  SubmitButton(
                    AppStrings.signupText,
                    isLoading: controller.isLoading,
                    onTap: controller.signupButtonOnClick,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
