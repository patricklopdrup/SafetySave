import 'package:flutter/material.dart';
import 'package:safety_save/app_bar.dart';
import 'package:safety_save/my_colors.dart';
import 'login/login_biometrics.dart';

void main() {
  runApp(MaterialApp(
    title: 'SafetySave',
    theme: ThemeData(
      fontFamily: 'Quicksand',
      colorScheme: const ColorScheme(
        background: MyColors.green,
        brightness: Brightness.dark,
        primary: Colors.white70,
        secondary: Colors.orange,
        error: Colors.red,
        onBackground: Colors.white70,
        onError: Colors.white70,
        onPrimary: Colors.white70,
        onSecondary: Colors.black26,
        onSurface: Colors.white70,
        surface: MyColors.green,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w600),
        displayMedium: TextStyle(fontSize: 36.0, fontWeight: FontWeight.normal),
        displaySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      )
    ),
    home: const MyLoginBiometrics(),
  ));
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar('Home Screen'),
    );
  }
}