import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:dawaay/controller/login_controller.dart';
import 'package:dawaay/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 35),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            // --------- background-------------
            image: DecorationImage(
              image: AssetImage('assets/bg/main sign in design.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
            key: controller.formState,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),*/
                    // --------------   email field ---------------------
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 15),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 45),
                      decoration: BoxDecoration(
                          color: DawaayColors.kSecondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.emailEmptyValidate;
                          } else if (!value.contains(AppStrings.atSign)) {
                            return AppStrings.emailMessingAtSignValidate;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.emailAddress = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Type your Email Here',
                          border: InputBorder.none,
                          hintMaxLines: 1,
                        ),
                      ),
                    ),
                    // -------------  password field -------------
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 15),
                      margin: const EdgeInsets.only(
                          top: 7, bottom: 20, left: 45, right: 45),
                      decoration: BoxDecoration(
                          color: DawaayColors.kSecondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        obscureText: true,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.passwordEmptyValidate;
                          } else if (value.length < 8) {
                            return AppStrings.passwordLessThen8Validate;
                          } else if (value.length > 24) {
                            return AppStrings.passwordLargerThen24Validate;
                          }
                          return null;
                        },
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
                      ),
                    ),
                    // ----------- forgot your password? ----------
                    // const Text(
                    //   "Forgot Your Password?",
                    //   style:
                    //       TextStyle(color: blackColor, fontWeight: FontWeight.bold),
                    // ),
                    // ---------------- login button -----------------
                    const SizedBox(height: 25),
                    SubmitButton(
                      AppStrings.loginText,
                      isLoading: controller.isLoading,
                      onTap: controller.loginButtonOnClick,
                    ),
                    // -------------- don't have account and register ---------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: DawaayColors.blackColor),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.signupTextOnClick();
                            //Get.to(const RegisterScreen());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: DawaayColors.kkBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
