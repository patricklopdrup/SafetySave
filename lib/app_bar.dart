import 'package:flutter/material.dart';
import 'package:safety_save/my_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(title),
      ),
      backgroundColor: MyColors.green,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
