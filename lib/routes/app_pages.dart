import 'package:flutter_application_1/screens/login/login.dart';
import 'package:flutter_application_1/screens/onboarding/home.dart';
import 'package:flutter_application_1/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_application_1/screens/signup/signup.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LogInScreen(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => Onboarding(),
    ),
  ];
}
