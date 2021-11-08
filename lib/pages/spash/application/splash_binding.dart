import 'package:get/get.dart';
import 'package:git_mentalhealth/pages/spash/application/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
