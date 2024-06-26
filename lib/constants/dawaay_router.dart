import 'package:dawaay/constants/dawaay_strings.dart';
import 'package:dawaay/view/screens/ai_screen.dart';
import 'package:dawaay/view/screens/buy_medicine_screen.dart';
import 'package:dawaay/view/screens/cart_screen.dart';
import 'package:dawaay/view/screens/checkout_screen.dart';
import 'package:dawaay/view/screens/fast_treatment_screen.dart';
import 'package:dawaay/view/screens/home_screen.dart';
import 'package:dawaay/view/screens/login_screen.dart';
import 'package:dawaay/view/screens/medicine_details_screen.dart';
import 'package:dawaay/view/screens/signup_screen.dart';
import 'package:get/get.dart';

class DawaayRouter {
  static List<GetPage> dawaayPages = [
    GetPage(
      name: AppStrings.logInRoute,
      page: () => const LoginScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.signUpRoute,
      page: () => const SignupScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.homeRoute,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.buyMedicineRoute,
      page: () => const BuyMedicineScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.medicineDetailsRoute,
      page: () => MedicineDetailsScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.cartRoute,
      page: () => const CartScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.checkoutRoute,
      page: () => const CheckoutScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.fastTreatmentRoute,
      page: () => const FastTreatmentScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: AppStrings.aiRoute,
      page: () => const AiScreen(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
  ];
}
