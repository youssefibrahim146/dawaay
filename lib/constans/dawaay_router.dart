import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:dawaay/view/screens/login_screen.dart';
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
  ];
}
