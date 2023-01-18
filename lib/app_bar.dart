import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class MyAppBarWithPlus extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBarWithPlus(this.title, {Key? key}) : super(key: key);

  @override
  State<MyAppBarWithPlus> createState() => _MyAppBarWithPlusState(title);

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _MyAppBarWithPlusState extends State<MyAppBarWithPlus> {
  final String title;
  _MyAppBarWithPlusState(this.title);

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

  File? _image;
  Future _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
    });
  }

  _onAddPressed() {

  }

  _onSettingPressed() {
    print('setting pressed');
  }

}
