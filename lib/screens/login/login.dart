import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/input/app_input.dart';
import 'package:flutter_application_1/components/primary_button.dart';
import 'package:flutter_application_1/controllers/loading_controller.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/login/login_controller.dart';
import 'package:flutter_application_1/screens/reset/reset_password.dart';
import 'package:flutter_application_1/screens/signup/signup.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/utils/overlay.dart';
import 'package:flutter_application_1/utils/validate_form.dart';
import 'package:get/get.dart';

import '../../domain/form_validation/input_validator.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();
  final formKey = GlobalKey<FormState>();
  final _loading = Get.find<LoadingController>();
  UserModel model = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    'Bem Vindo',
                    style: titleText,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Não tem cadastro?',
                        style: subTitle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Inscrever-se',
                          style: textButton.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppInput(
                          hintText: 'Email',
                          validator: (value) => validateForm(
                            value,
                            ValidationMethod.EMAIL,
                          ),
                          onSaved: (value) {
                            model.email = value ?? '';
                          },
                        ),
                        SizedBox(height: 10),
                        AppInput(
                          hintText: 'Senha',
                          isObscure: true,
                          validator: (value) => validateForm(
                            value,
                            ValidationMethod.PASSWORD,
                          ),
                          onSaved: (value) {
                            model.password = value ?? '';
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()));
                    },
                    child: Text(
                      'Esqueceu a Senha?',
                      style: TextStyle(
                        color: kZambeziColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    buttonText: 'Entre',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();

                        try {
                          _loading.on();
                          await controller.signIn(
                            model.email,
                            model.password,
                          );
                        } finally {
                          _loading.out();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: _loading.status.value,
              child: AppOverlay(),
            ),
          ),
        ],
      ),
    );
  }
}
