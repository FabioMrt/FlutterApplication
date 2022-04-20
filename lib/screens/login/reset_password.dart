import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login/components/primary_button.dart';
import 'package:flutter_application_1/screens/login/components/reset_form.dart';
import 'package:flutter_application_1/screens/login/login.dart';
import 'package:flutter_application_1/theme.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'Alterar Senha',
              style: titleText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Informe seu endereço de e-mail:',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            ResetForm(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ));
                },
                child: PrimaryButton(buttonText: 'Alterar Senha')),
          ],
        ),
      ),
    );
  }
}
