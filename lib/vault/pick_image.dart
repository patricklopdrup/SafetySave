import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safety_save/app_bar.dart';
import 'package:safety_save/vault/picture.dart';


class MyImagePicker extends StatefulWidget {
  const MyImagePicker({Key? key}) : super(key: key);

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? imageFile;
  Future _openGallary() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      print('hej ${picture!.path}');
      imageFile = File(picture!.path);
    });
  }

  final String dict = '';
  final List<Picture> _items = [
    Picture('https://images.pexels.com/photos/1772973/pexels-photo-1772973.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Picture('https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    // Picture('/storage/emulated/0/Pictures/cfef5ce601689564e0a39b4773f20815.png'),
    // Picture('/storage/emulated/0/Pictures/galafruit_mele.jpg'),
    // Picture('/storage/emulated/0/Pictures/IMG_20230115_180850.jpg'),
    // Picture('/storage/emulated/0/Pictures/storage/emulated/0/Pictures/SnapdragonNEW.png'),
  ];

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text('Add image');
    } else {
      return Image.file(imageFile!, height: 300, width: 300,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyBurgerAppBar('Select image'),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteTwo(
                      image: _items[index].path
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: FileImage(File(_items[index].path)),
                  image: NetworkImage(_items[index].path),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  final String image;

  const RouteTwo({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyDefaultAppBar('Photo'),
      body: AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          width: double.infinity,
          child: Image(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}