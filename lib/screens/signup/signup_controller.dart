import 'package:flutter_application_1/core/errors/firebase/firebase_errors.dart';
import 'package:flutter_application_1/data/firebase/sign_up/firebase_sign_up.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/widgets/warning_dialog.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _firebaseSignUp = FirebaseSignUp();

  Future signUp(UserModel model) async {
    final status = await _firebaseSignUp.createUserWithEmailAndPassword(
      model,
    );
    if (status == AuthResultStatus.successful) {
      Get.toNamed('/home');
    } else {
      appWarningDialog(
        title: 'Erro!',
        middleText: 'Tente novamente',
      );
    }
  }
}
