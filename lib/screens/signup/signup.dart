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

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = Get.find<SignUpController>();

  final formKey = GlobalKey<FormState>();

  final _loading = Get.find<LoadingController>();

  UserModel model = UserModel();
  String confirmPass = '';

  bool responseValue = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Scaffold(
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
                    height: 20,
                  ),
                  Padding(
                    padding: kDefaultPadding,
                    child: Form(
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
                          // AppInput(
                          //   hintText: 'Confirme a Senha',
                          //   isObscure: true,
                          //   validator: (value) {
                          //     if (value != model.password) {
                          //       return 'As senhas não conferem';
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: kDefaultPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: responseValue,
                              onChanged: (bool? value) {
                                setState(() {
                                  responseValue = value!;
                                  model.role = 'intern';
                                });
                              },
                              fillColor: MaterialStateProperty.all<Color>(
                                kPrimaryColor,
                              ),
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              'Sou estagiário',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: false,
                              groupValue: responseValue,
                              onChanged: (bool? value) {
                                setState(() {
                                  responseValue = value!;
                                  model.role = 'enterprise';
                                });
                              },
                              fillColor: MaterialStateProperty.all<Color>(
                                kPrimaryColor,
                              ),
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              'Sou empresa',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
        persistentFooterButtons: [
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
    );
  }
}
