import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
class User extends Equatable {
  const User({
    this.id = '',
    this.uid = '',
    this.displayName = '',
    this.description = '',
    this.photoUrl = '',
  });

  factory User.fromJson(Map<String, Object?> json) => User(
        id: json['id'] as String,
        uid: json['uid'] as String,
        displayName: json['display_name'] as String,
        description: json['description'] as String,
        photoUrl: json['photo_url'] as String,
      );

  final String id, uid, displayName, description, photoUrl;

  @override
  List<Object> get props => [id, uid, displayName, description, photoUrl];

  User copyWith({
    String? id,
    String? uid,
    String? displayName,
    String? description,
    String? photoUrl,
  }) =>
      User(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        photoUrl: photoUrl ?? this.photoUrl,
      );
}
