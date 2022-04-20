import 'package:flutter_application_1/app_initial.dart';
import 'package:flutter_application_1/controllers/loading_controller.dart';
import 'package:flutter_application_1/screens/login/login_controller.dart';
import 'package:flutter_application_1/screens/signup/signup_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // CONTROLLERS
    Get.lazyPut<AppInitial>(() => AppInitial());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<LoadingController>(() => LoadingController());
  }
}
