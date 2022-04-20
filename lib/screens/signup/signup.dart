import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/input/app_input.dart';
import 'package:flutter_application_1/domain/form_validation/input_validator.dart';
import 'package:flutter_application_1/components/checkbox.dart';
import 'package:flutter_application_1/components/primary_button.dart';
import 'package:flutter_application_1/screens/login/login.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/utils/validate_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              child: Column(
                children: [
                  AppInput(
                    hintText: 'Nome',
                    validator: (value) => validateForm(
                      value,
                      ValidationMethod.SIMPLE_FIELD,
                    ),
                  ),
                  SizedBox(height: 10),
                  AppInput(hintText: 'CPF'),
                  SizedBox(height: 10),
                  AppInput(
                    hintText: 'Email',
                    validator: (value) => validateForm(
                      value,
                      ValidationMethod.EMAIL,
                    ),
                  ),
                  SizedBox(height: 10),
                  AppInput(hintText: 'Telefone'),
                  SizedBox(height: 10),
                  AppInput(
                    hintText: 'Senha',
                    isObscure: true,
                    validator: (value) => validateForm(
                      value,
                      ValidationMethod.PASSWORD,
                    ),
                  ),
                  SizedBox(height: 10),
                  AppInput(hintText: 'Confirme a Senha', isObscure: true),
                ],
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
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
