import 'package:flutter/material.dart';

import '../api/local_auth.dart';
import '../main.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(80, 144, 80, 1.0),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 90.0),
            child: Center(
              child: MyLogo(),
            ),
          ),
          AuthButton(),
        ],
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
        backgroundColor: Colors.red,
      ),
      child: const Text(
        'Auth',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () async {
        final isAuthenticated = await LocalAuthApi.authenticate();
        print("hej $isAuthenticated");

        if (isAuthenticated) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomePage())
          );
        }
      },
    );
  }
}