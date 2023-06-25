import 'package:image_picker/image_picker.dart';

class ImageService {
  const ImageService();

  Future<String?> pickImage() async {
    final xPath = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
    );
    return xPath?.path;
  }
}
