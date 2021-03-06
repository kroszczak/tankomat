import 'package:flutter/material.dart';
import 'package:tankomat/components/Background.dart';
import 'package:tankomat/components/Button.dart';
import 'package:tankomat/components/Form.dart';
import 'package:tankomat/components/Input.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController;
  final Function onSendPress;

  Body({
    Key key,
    this.onSendPress,
    this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AuthForm(
              children: <Widget>[
                Input(
                  isPassword: false,
                  isEmail: true,
                  placeholder: 'E-mail',
                  controller: emailController,
                  icon: Icons.email,
                ),
                Button(
                  text: 'Zresetuj hasło',
                  press: onSendPress,
                )
              ],
            ),
            Button(
              text: 'Powrót',
              press: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
