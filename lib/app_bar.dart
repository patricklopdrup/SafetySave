import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(title),
      ),
      backgroundColor: Color.fromRGBO(50, 90, 50, 1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
