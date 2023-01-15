import 'picture.dart';


class IFolder {
  void renameFolder(String newName) {}
  void addPicture() {}
  void deletePicture() {}
  void movePicture(Folder folderToMoveTo) {}
}

class Folder {
  String? name;
  List<Picture>? pictures;
}