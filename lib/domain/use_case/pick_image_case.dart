import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class PickImageCase {
  const PickImageCase();

  Future<({String name, Uint8List bytes})?> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // TBD: resize and convert by package:image
      maxWidth: 600,
    );
    return xFile == null
        ? null
        : (
            name: xFile.name,
            bytes: await xFile.readAsBytes(),
          );
  }
}
