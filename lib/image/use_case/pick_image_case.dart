import 'package:get_it/get_it.dart';

import 'package:gravity/image/data/image_repository.dart';

mixin class PickImageCase {
  final _imageRepository = GetIt.I<ImageRepository>();

  Future<({String path, String name})?> pickImage() =>
      _imageRepository.pickImage();
}
