import 'package:dawaay/view/screens/login_screen.dart';
import 'package:dawaay/view/screens/signup_screen.dart';
import 'package:get/get.dart';

class DawaayBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => const LoginScreen(),
      fenix: true,
    );
    Get.lazyPut(
      () => const SignupScreen(),
      fenix: true,
    );
  }
}
