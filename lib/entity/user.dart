import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool hasPicture;

  const User({
    this.id = '',
    this.title = '',
    this.description = '',
    this.hasPicture = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        hasPicture: json['has_picture'] as bool,
      );

  @override
  List<Object> get props => [
        id,
        title,
        description,
        hasPicture,
      ];

  bool get isEmpty => id.isEmpty;

  bool get hasNoPicture => !hasPicture;

  User copyWith({
    String? id,
    String? title,
    String? description,
    bool? hasPicture,
  }) =>
      User(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        hasPicture: hasPicture ?? this.hasPicture,
      );
}
