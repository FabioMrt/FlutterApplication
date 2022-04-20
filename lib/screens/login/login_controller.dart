import 'package:flutter_application_1/core/errors/firebase/firebase_errors.dart';
import 'package:flutter_application_1/data/firebase/sign_in/firebase_sign_in.dart';
import 'package:flutter_application_1/widgets/warning_dialog.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _firebaseSignIn = FirebaseSignIn();

  Future signIn(String email, String password) async {
    final status = await _firebaseSignIn.signInWithEmailAndPassword(
      email,
      password,
    );
    if (status == AuthResultStatus.successful) {
      Get.toNamed('/home');
    } else {
      appWarningDialog(
        title: 'Erro!',
        middleText: 'E-Mail e/ou Senha incorretos',
      );
    }
  }
}
