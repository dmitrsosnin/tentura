import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  const ImageService();

  Future<XFile?> pickImage() => ImagePicker().pickImage(
        source: ImageSource.gallery,
        // TBD: resize and convert by packagr:image
        maxWidth: 600,
      );

  Reference getRef(String path) => FirebaseStorage.instance.ref(path);
}
