import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/input/app_input.dart';
import 'package:flutter_application_1/controllers/loading_controller.dart';
import 'package:flutter_application_1/domain/form_validation/input_validator.dart';
import 'package:flutter_application_1/components/checkbox.dart';
import 'package:flutter_application_1/components/primary_button.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/screens/login/login.dart';
import 'package:flutter_application_1/screens/signup/signup_controller.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/utils/validate_form.dart';
import 'package:get/get.dart';

import '../../utils/overlay.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final controller = Get.find<SignUpController>();
  final formKey = GlobalKey<FormState>();
  final _loading = Get.find<LoadingController>();
  UserModel model = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: kDefaultPadding,
                  child: Text(
                    'Criar Conta',
                    style: titleText,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: kDefaultPadding,
                  child: Row(
                    children: [
                      Text(
                        'Já tem cadastro?',
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
                              builder: (context) => LogInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Entre',
                          style: textButton.copyWith(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: kDefaultPadding,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppInput(
                          hintText: 'Nome',
                          validator: (value) => validateForm(
                            value,
                            ValidationMethod.SIMPLE_FIELD,
                          ),
                          onSaved: (value) {
                            model.name = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        AppInput(
                          hintText: 'CPF',
                          validator: (value) => validateForm(
                            value,
                            ValidationMethod.SIMPLE_FIELD,
                          ),
                          onSaved: (value) {
                            model.cpf = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        AppInput(
                          hintText: 'Email',
                          validator: (value) => validateForm(
                            value,
                            ValidationMethod.EMAIL,
                          ),
                          onSaved: (value) {
                            model.email = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        AppInput(
                          hintText: 'Telefone',
                          validator: (value) => validateForm(
                            value,
                            ValidationMethod.SIMPLE_FIELD,
                          ),
                          onSaved: (value) {
                            model.phone = value!;
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
                            model.password = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        AppInput(hintText: 'Confirme a Senha', isObscure: true),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: kDefaultPadding,
                  child: CheckBox('Aceito os termos de condições.'),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: kDefaultPadding,
                  child: PrimaryButton(
                    buttonText: 'Inscrever-se',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();

                        try {
                          _loading.on();
                          await controller.signUp(model);
                        } finally {
                          _loading.out();
                        }
                      }
                    },
                  ),
                ),
              ],
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
