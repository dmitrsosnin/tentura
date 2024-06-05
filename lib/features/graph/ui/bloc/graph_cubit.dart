import 'dart:async';
import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/comment.dart';
import 'package:tentura/domain/entity/user.dart';
import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/graph_repository.dart';
import '../../domain/entity/edge_details.dart';
import '../../domain/entity/node_details.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'graph_state.dart';

class GraphCubit extends Cubit<GraphState> {
  GraphCubit({
    required this.id,
    required this.graphRepository,
    bool fetchOnCreate = true,
    String focus = '',
  }) : super(GraphState(focus: focus)) {
    _fetchLimits = {super.state.focus: 5};
    if (fetchOnCreate) fetch(focus);
  }

  final GraphRepository graphRepository;

  final graphController =
      GraphController<NodeDetails, EdgeDetails<NodeDetails>>();

  final String id;

  final _users = <String, User>{};
  final _beacons = <String, Beacon>{};
  final _comments = <String, Comment>{};

  late final Map<String, int> _fetchLimits;

  late final _defaultEgo = UserNode(
    id: id,
    label: 'Me',
    pinned: true,
    size: 80,
  );

  late NodeDetails _egoNode = _defaultEgo;

  @override
  Future<void> close() {
    graphController.dispose();
    return super.close();
  }

  void jumpToEgo() => graphController.jumpToNode(_egoNode);

  void togglePositiveOnly() {
    graphController.clear();
    emit(state.copyWith(
      focus: '',
      positiveOnly: !state.positiveOnly,
    ));
    fetch(state.focus);
  }

  void setFocus(NodeDetails node) {
    emit(state.copyWith(focus: node.id));
    graphController
      ..setPinned(node, true)
      ..jumpToNode(node);
    fetch(node.id);
  }

  Future<void> fetch(String focus) async {
    final limit = (_fetchLimits[focus] ?? 0) + 3;
    _fetchLimits[focus] = limit;
    try {
      await _fetch(focus, limit);
    } catch (e) {
      emit(state.copyWith(
        error: 'No data or got error',
      ));
    }
  }

  Future<void> _fetch(String focus, int limit) async {
    final graph = await graphRepository.fetch(
      focus: focus,
      limit: limit,
      positiveOnly: state.positiveOnly,
    );

    // update cache
    for (final e in graph.users) {
      final user = e?.user;
      if (user != null) {
        _users.putIfAbsent(user.id, () => user as User);
      }
    }
    for (final e in graph.beacons) {
      final beacon = e?.beacon;
      if (beacon != null) {
        _beacons.putIfAbsent(beacon.id, () => beacon as Beacon);
      }
    }
    for (final e in graph.comments) {
      final comment = e?.comment;
      if (comment != null) {
        _comments.putIfAbsent(comment.id, () => comment as Comment);
      }
    }

    // update graph
    graphController.mutate((mutator) {
      _egoNode = _buildNodeDetails(
            node: id,
            pinned: true,
            size: 80,
          ) ??
          _defaultEgo;
      if (!mutator.controller.nodes.contains(_egoNode)) {
        mutator.addNode(_egoNode);
      }
      for (final e in graph.edges) {
        if (state.positiveOnly && e!.weight < 0) continue;
        final src = _buildNodeDetails(node: e!.src);
        if (src == null) continue;
        final dst = _buildNodeDetails(node: e.dest);
        if (dst == null) continue;
        final edge = EdgeDetails<NodeDetails>(
          source: src,
          destination: dst,
          strokeWidth: (src == _egoNode || dst == _egoNode) ? 6 : 4,
          color: e.weight < 0
              ? Colors.redAccent
              : src == _egoNode || dst == _egoNode
                  ? Colors.amberAccent
                  : Colors.cyanAccent,
        );
        if (!mutator.controller.nodes.contains(src)) mutator.addNode(src);
        if (!mutator.controller.nodes.contains(dst)) mutator.addNode(dst);
        if (!mutator.controller.edges.contains(edge)) mutator.addEdge(edge);
      }
    });
  }

  /// return null if noy in cache
  NodeDetails? _buildNodeDetails({
    required String node,
    double size = 40,
    bool pinned = false,
  }) =>
      switch (switch (node.substring(0, 1)) {
        'U' => _users[node],
        'B' => _beacons[node],
        'C' => _comments[node],
        _ => throw Exception('Wrong id type'),
      }) {
        final User n => UserNode(
            id: n.id,
            label: n.title,
            hasImage: n.has_picture,
            pinned: pinned,
            size: size,
          ),
        final Beacon n => BeaconNode(
            id: n.id,
            userId: n.author.id,
            hasImage: n.has_picture,
            label: n.title,
            pinned: pinned,
            size: size,
          ),
        final Comment n => CommentNode(
            id: n.id,
            userId: n.author.id,
            beaconId: n.beacon_id,
            pinned: pinned,
            size: size,
          ),
        _ => null,
      };
}
