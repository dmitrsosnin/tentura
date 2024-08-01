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
    required User me,
    required this.graphRepository,
    String? focus,
  })  : _egoNode = UserNode(
          id: me.id,
          label: 'Me',
          pinned: true,
          hasImage: me.has_picture,
          size: 80,
        ),
        super(GraphState(focus: focus ?? '')) {
    _users[me.id] = me;
    graphController.mutate((m) => m.addNode(_egoNode));
    _fetchLimits[super.state.focus] = 5;
    _fetch(state.focus);
  }

  final GraphRepository graphRepository;

  final graphController =
      GraphController<NodeDetails, EdgeDetails<NodeDetails>>();

  final UserNode _egoNode;

  final _users = <String, User>{};
  final _beacons = <String, Beacon>{};
  final _comments = <String, Comment>{};
  final _fetchLimits = <String, int>{};

  @override
  Future<void> close() {
    graphController.dispose();
    return super.close();
  }

  void jumpToEgo() => graphController.jumpToNode(_egoNode);

  void togglePositiveOnly() {
    graphController
      ..clear()
      ..mutate((m) => m.addNode(_egoNode));
    emit(state.copyWith(
      focus: '',
      positiveOnly: !state.positiveOnly,
    ));
    _fetch(state.focus);
  }

  void setFocus(NodeDetails node) {
    emit(state.copyWith(focus: node.id));
    graphController
      ..setPinned(node, true)
      ..jumpToNode(node);
    _fetch(node.id);
  }

  Future<void> _fetch(String focus) async {
    final limit = (_fetchLimits[focus] ?? 0) + 5;
    _fetchLimits[focus] = limit;
    try {
      await _update(focus, limit);
    } catch (e) {
      emit(state.copyWith(error: e));
      rethrow;
    }
  }

  Future<void> _update(String focus, int limit) async {
    final graph = await graphRepository.fetch(
      focus: focus,
      limit: limit,
      positiveOnly: state.positiveOnly,
    );

    // update cache
    for (final e in graph) {
      if (e.user != null) {
        _users.putIfAbsent(e.user!.id, () => e.user! as User);
      } else if (e.beacon != null) {
        _beacons.putIfAbsent(e.beacon!.id, () => e.beacon! as Beacon);
      }
    }

    // update graph
    graphController.mutate((mutator) {
      for (final e in graph) {
        final score = double.tryParse(e.score!.value);
        if (score == null) continue;
        if (state.positiveOnly && score < 0) continue;
        final src = _buildNodeDetails(node: e.src!);
        final dst = _buildNodeDetails(node: e.dst!);
        final edge = EdgeDetails<NodeDetails>(
          source: src,
          destination: dst,
          strokeWidth: (src == _egoNode || dst == _egoNode) ? 6 : 4,
          color: score < 0
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

  NodeDetails _buildNodeDetails({
    required String node,
    double size = 40,
    bool pinned = false,
  }) {
    final user = _users[node];
    if (user != null) {
      return UserNode(
        id: user.id,
        label: user.title,
        hasImage: user.has_picture,
        pinned: pinned,
        size: size,
      );
    }
    final beacon = _beacons[node];
    if (beacon != null) {
      return BeaconNode(
        id: beacon.id,
        userId: beacon.author.id,
        hasImage: beacon.has_picture,
        label: beacon.title,
        pinned: pinned,
        size: size,
      );
    }
    final comment = _comments[node];
    if (comment != null) {
      return CommentNode(
        id: comment.id,
        userId: comment.author.id,
        beaconId: comment.beacon_id,
        pinned: pinned,
        size: size,
      );
    }
    throw Exception('$node not cached!');
  }
}
