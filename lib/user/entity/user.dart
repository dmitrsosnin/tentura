import 'package:equatable/equatable.dart';

import 'package:gravity/_shared/types.dart';

class User extends Equatable {
  final String id;
  final String uid;
  final String displayName;
  final String description;
  final bool hasPicture;

  const User({
    this.id = '',
    this.uid = '',
    this.displayName = '',
    this.description = '',
    this.hasPicture = false,
  });

  factory User.fromJson(Json json) => User(
        id: json['id'] as String,
        uid: json['uid'] as String,
        displayName: json['display_name'] as String,
        description: json['description'] as String,
        hasPicture: json['has_picture'] as bool,
      );

  @override
  List<Object> get props => [
        id,
        uid,
        displayName,
        description,
        hasPicture,
      ];

  bool get isEmpty => id.isEmpty;

  bool get hasNoPicture => !hasPicture;

  User copyWith({
    String? id,
    String? uid,
    String? displayName,
    String? description,
    bool? hasPicture,
  }) =>
      User(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        hasPicture: hasPicture ?? this.hasPicture,
      );
}
