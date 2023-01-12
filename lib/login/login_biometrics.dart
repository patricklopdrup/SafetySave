import 'package:flutter/material.dart';

import '../api/local_auth.dart';
import '../app_bar.dart';
import '../main.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 90, 50, 1),
      appBar: const MyAppBar('SafetySave'),
      body: TextButton(
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
      ),
    );
  }
}
