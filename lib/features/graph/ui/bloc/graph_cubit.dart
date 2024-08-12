import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:tentura/domain/entity/beacon.dart';
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
    _fetch();
  }

  final GraphRepository graphRepository;

  final graphController =
      GraphController<NodeDetails, EdgeDetails<NodeDetails>>();

  final UserNode _egoNode;

  final _users = <String, User>{};
  final _beacons = <String, Beacon>{};
  final _fetchLimits = <String, int>{};

  @override
  Future<void> close() {
    graphController.dispose();
    return super.close();
  }

  void jumpToEgo() => graphController.jumpToNode(_egoNode);

  void setFocus(NodeDetails node) {
    if (state.focus != node.id) {
      emit(state.copyWith(focus: node.id));
      graphController
        ..setPinned(node, true)
        ..jumpToNode(node);
    }
    _fetch();
  }

  void setContext(String? context) {
    graphController
      ..clear()
      ..mutate((m) => m.addNode(_egoNode));
    emit(state.copyWith(
      context: context,
      focus: '',
    ));
    _fetchLimits.clear();
    _fetch();
  }

  void togglePositiveOnly() {
    emit(state.copyWith(
      positiveOnly: !state.positiveOnly,
      focus: '',
    ));
    graphController
      ..clear()
      ..mutate((m) => m.addNode(_egoNode));
    _fetchLimits.clear();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final (users, beacon) = await graphRepository.fetch(
        positiveOnly: state.positiveOnly,
        context: state.context,
        focus: state.focus,
        limit: _fetchLimits[state.focus] = (_fetchLimits[state.focus] ?? 0) + 5,
      );

      for (final e in users) {
        if (e.user != null) {
          _users.putIfAbsent(e.user!.id, () => e.user! as User);
        }
      }
      if (beacon != null) _beacons.putIfAbsent(beacon.id, () => beacon);

      final graph = users
          .map((e) => e.src == null || e.dst == null || e.score == null
              ? null
              : (
                  src: e.src!,
                  dst: e.dst!,
                  score: double.parse(e.score!.value),
                ))
          .nonNulls;

      if (graph.isNotEmpty) _updateGraph(graph);
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _updateGraph(Iterable<({String src, String dst, double score})> graph) =>
      graphController.mutate((mutator) {
        for (final e in graph) {
          if (state.positiveOnly && e.score < 0) continue;
          final src = _buildNodeDetails(node: e.src);
          final dst = _buildNodeDetails(node: e.dst);
          if (src == null || dst == null) continue;
          final edge = EdgeDetails<NodeDetails>(
            source: src,
            destination: dst,
            strokeWidth: (src == _egoNode || dst == _egoNode) ? 6 : 4,
            color: e.score < 0
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

  NodeDetails? _buildNodeDetails({
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
    if (kDebugMode) print('$node not cached!');
    return null;
  }
}
