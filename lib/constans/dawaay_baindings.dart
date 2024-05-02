import 'package:dawaay/controller/buy_medicine_controller.dart';
import 'package:dawaay/controller/cart_controller.dart';
import 'package:dawaay/controller/login_controller.dart';
import 'package:dawaay/controller/singup_contoller.dart';
import 'package:get/get.dart';

class DawaayBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SingUpController(),
      fenix: true,
    );
    Get.lazyPut(
      () => BuyMedicineController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CartController(),
      fenix: true,
    );
  }
}
