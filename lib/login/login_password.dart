import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:safety_save/my_colors.dart';

class MyLoginPassword extends StatefulWidget {
  const MyLoginPassword({super.key});

  @override
  _MyLoginPasswordState createState() => _MyLoginPasswordState();
}

class _MyLoginPasswordState extends State<MyLoginPassword> {
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            password,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: MyColors.green,
              letterSpacing: 10,
            ),
          ),
          const FractionallySizedBox(
            widthFactor: .75,
            child: Divider(
              thickness: 3,
              color: MyColors.green,
            ),
          ),
          NumericKeyboard(
            onKeyboardTap: _onKeyboardTap,
            textColor: MyColors.green,
            rightButtonFn: () {
              setState(() {
                password = password.substring(0, password.length-1);
              });
            },
            rightIcon: const Icon(
              Icons.backspace_outlined,
              color: MyColors.green,
            ),
            leftButtonFn: () {
              print('left button clicked');
            },
            leftIcon: const Icon(
              Icons.check,
              color: MyColors.green,
            ),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  void _onKeyboardTap(String value) {
    setState(() {
      password = password + value;
    });
  }
}