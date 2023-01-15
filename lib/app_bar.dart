import 'package:flutter/material.dart';
import 'package:safety_save/my_colors.dart';

class MyDefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyDefaultAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: MyColors.green,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}


class MyBurgerAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const MyBurgerAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () => _onAddPressed(),
          icon: const Icon(Icons.add),
        ),
        IconButton(
            onPressed: () => _onSettingPressed(),
            icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  _onAddPressed() {
    print('add pressed');
  }

  _onSettingPressed() {
    print('setting pressed');
  }

}
