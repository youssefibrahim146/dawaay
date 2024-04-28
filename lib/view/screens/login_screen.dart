import 'package:dawaay/constans/dawaay_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
              image: AssetImage(''),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Image.asset("", scale: 3),
                // --------------   email field ---------------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  decoration: BoxDecoration(
                      color: DawaayColors.kSecondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    //controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Type your Email Here',
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
                  child: TextFormField(
                    obscureText: true,
                    //controller: contro,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintMaxLines: 1,
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
                ElevatedButton(
                  onPressed: () async {
                    //Get.off(()=>const HomeScreen());
                    /*if (controller.text.isEmpty || contro.text.isEmpty) {
                      Get.snackbar("!!! Error",
                          "Please make sure that the Email and Password was entered",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          colorText: Colors.red);
                    } else {
                      try {
                        User? user = await loginUsingEmailAndPassword(
                            email: controller.text,
                            password: contro.text,
                            context: context);
                        if (user != null) {
                          Get.off(() => const HomeScreen());
                        }
                      } on FirebaseAuthException catch (error) {
                        //      -------------
                      }
                    }*/
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 8)),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor:
                          MaterialStateProperty.all(DawaayColors.kkBlue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
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
                // -------------- or bar ---------------
                // Stack(
                //   alignment: Alignment.center,
                //   children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(
                //           horizontal: 30, vertical: 30),
                //       color: Colors.black,
                //       width: Get.width,
                //       height: 2,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //           color: kSecondaryColor,
                //           borderRadius: BorderRadius.circular(50),
                //           border: Border.all(color: Colors.black, width: 2.5)),
                //       child: const Text(
                //         'OR',
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                //--------------- log in with google ---------------
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all(kSecondaryColor),
                //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)))),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Image.asset('assets/images/google icon.png', scale: 42),
                //       const SizedBox(width: 4),
                //       const Text(
                //         'Login with Google',
                //         style: TextStyle(color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15),
                // ------------------ login with facebook -------------------
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all(kSecondaryColor),
                //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)))),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Image.asset('assets/images/facebook icon.png', scale: 25),
                //       const SizedBox(width: 4),
                //       const Text(
                //         'Login with Facebook',
                //         style: TextStyle(color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
