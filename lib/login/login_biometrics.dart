import 'package:flutter/material.dart';
import 'package:safety_save/app_bar.dart';
import 'package:safety_save/login/login_password.dart';
import 'package:safety_save/my_colors.dart';

import '../api/local_auth.dart';
import '../main.dart';

class MyLoginBiometrics extends StatelessWidget {
  const MyLoginBiometrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:  [
            const SizedBox(height: 150,),
            const MyLogo(),
            Expanded(child: Container(),),
            const AuthButton(),
            const SizedBox(height: 100,),
          ],
        ),
      )
    );
  }
}

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});
  final String name = "SafetySave";

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 8.0,
            color: Colors.black54,
          )
        ]
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: MyColors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Login',
            style: TextStyle(
                fontSize: 24,
            ),
          ),
          SizedBox(width: 5,),
          Icon(
            Icons.fingerprint,
          )
        ],
      ),
      onPressed: () async {
        final isAuthenticated = await LocalAuthApi.authenticate();

        if (isAuthenticated) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyLoginPassword())
          );
        }
      },
    );
  }
}