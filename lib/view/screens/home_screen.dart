import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:dawaay/constants/dawaay_strings.dart';
import 'package:dawaay/view/widgets/gap_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset("assets/bg/ai icon.png"),
      ),
      appBar: AppBar(elevation: 0, actions: [
        TextButton(
          child: const Text(
            "LogOut",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            FirebaseAuth.instance
                .signOut()
                .then((value) => Get.offAllNamed(AppStrings.logInRoute));
          },
        )
      ]),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 60),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // --------- background-------------
          image: DecorationImage(
            image: AssetImage('assets/bg/homePage bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // ----------------- what do you need ------------
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: DawaayColors.blackColor, width: 1.5),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "What you need ?",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 35 - 12),
                  ),
                ),
              ],
            ),
            // ------------- row that have 2 buttons ----------
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppStrings.fastTreatmentRoute);
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8)),
                        elevation: MaterialStateProperty.all(1),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Fast treatment',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppStrings.buyMedicineRoute);
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8)),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Buy Medicine',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 23,
                    ),
                  ),
                ),
                const GapWidget(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
