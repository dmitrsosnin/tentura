import 'package:image_picker/image_picker.dart';

class PlatformService {
  const PlatformService();

  Future<PlatformService> init() async {
    return this;
  }

  Future<({String path, String name})?> pickImage() async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // TBD: resize and convert by packagr:image
      maxWidth: 600,
    );
    return xFile == null ? null : (path: xFile.path, name: xFile.name);
  }
}
