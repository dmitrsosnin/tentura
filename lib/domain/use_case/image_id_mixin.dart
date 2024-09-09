mixin ImageId {
  String get id;

  bool get hasPicture;

  String get imageId => hasPicture ? id : '';
}
