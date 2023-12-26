import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart'
    show EdgeBase, NodeBase;

@immutable
final class EdgeDetails<N extends NodeBase> extends EdgeBase<N>
    with EquatableMixin {
  const EdgeDetails({
    required super.source,
    required super.destination,
    required this.color,
    this.strokeWidth = 2,
  });

  final Color color;
  final double strokeWidth;

  @override
  List<Object> get props => [source, destination];

  @override
  EdgeDetails<N> replaceNode({
    N? source,
    N? destination,
    double? strokeWidth,
    Color? color,
  }) =>
      EdgeDetails(
        source: source ?? this.source,
        destination: destination ?? this.destination,
        strokeWidth: strokeWidth ?? this.strokeWidth,
        color: color ?? this.color,
      );
}
