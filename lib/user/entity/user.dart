import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
class User extends Equatable {
  const User({
    this.id = '',
    this.uid = '',
    this.displayName = '',
    this.description = '',
  });

  factory User.fromJson(Map<String, Object?> json) => User(
        id: json['id'] as String,
        uid: json['uid'] as String,
        displayName: json['display_name'] as String,
        description: json['description'] as String,
      );

  final String id, uid, displayName, description;

  @override
  List<Object> get props => [id, uid, displayName, description];

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
      );
}
