import 'package:flutter/material.dart';
import 'login/login_biometrics.dart';

void main() {
  runApp(MaterialApp(
    title: 'SafetySave',
    theme: ThemeData(fontFamily: 'Quicksand'),
    home: const MyLoginPage(),
  ));
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged in!'),
      ),
    );
  }
}