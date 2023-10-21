import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/data/utils.dart';
import 'package:gravity/features/graph/entity/edge_details.dart';
import 'package:gravity/features/graph/entity/node_details.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch_for_ego.req.gql.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch_for_ego.var.gql.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch_for_ego.data.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'graph_state.dart';

typedef _Response
    = OperationResponse<GGraphFetchForEgoData, GGraphFetchForEgoVars>;

class GraphCubit extends Cubit<GraphState> {
  static const _requestId = 'FetchGraph';

  GraphCubit({required this.ego})
      : super(const GraphState(status: FetchStatus.isLoading)) {
    _subscription = GetIt.I<Client>()
        .request(GGraphFetchForEgoReq(
          (b) => b
            ..requestId = _requestId
            ..fetchPolicy = FetchPolicy.NoCache
            ..vars.ego = ego,
        ))
        .listen(
          _onData,
          cancelOnError: false,
          onError: (Object? e) => emit(state.copyWith(error: e)),
        );
  }

  final String ego;

  final users = <String, GGraphFetchForEgoData_gravityGraph_users_user>{};
  final beacons = <String, GGraphFetchForEgoData_gravityGraph_beacons_beacon>{};
  final comments = <String, GGraphFetchForEgoData_gravityGraph_comments>{};
  final graphController =
      GraphController<NodeDetails, EdgeDetails<NodeDetails>>();

  late final StreamSubscription<_Response> _subscription;

  NodeDetails? _egoNode;

  @override
  Future<void> close() async {
    graphController.dispose();
    await _subscription.cancel();
    return super.close();
  }

  void jumpToCenter() => graphController.jumpToNode(_egoNode!);

  void setFocus(NodeDetails node) {
    // graphController.jumpToNode(node);
    GetIt.I<Client>().requestController.add(GGraphFetchForEgoReq(
          (b) => b
            ..fetchPolicy = FetchPolicy.NoCache
            ..requestId = _requestId
            ..vars.ego = ego
            ..vars.focus = node.id,
        ));
  }

  void _onData(_Response response) {
    final graph = response.data?.gravityGraph;
    if (ego.isEmpty) {
      emit(state.copyWith(error: 'Ego was not set'));
      return;
    } else if (graph == null) {
      emit(state.copyWith(error: 'No data or got error'));
      return;
    } else {
      if (graph.users.isNotEmpty) {
        for (final e in graph.users) {
          if (e?.user != null) {
            users.putIfAbsent(e!.user!.id, () => e.user!);
          }
        }
      }
      if (graph.beacons.isNotEmpty) {
        for (final e in graph.beacons) {
          if (e?.beacon != null) {
            beacons.putIfAbsent(e!.beacon!.id, () => e.beacon!);
          }
        }
      }
      if (graph.comments.isNotEmpty) {
        for (final e in graph.comments) {
          if (e != null) comments.putIfAbsent(e.node, () => e);
        }
      }
      emit(state.copyWith(status: FetchStatus.hasData));
    }
    graphController.mutate((mutator) {
      if (_egoNode == null) {
        _egoNode ??= _buildNodeDetails(
          node: ego,
          pinned: true,
          size: 80,
        );
        mutator.addNode(_egoNode!);
        Future.microtask(() => graphController.jumpToNode(_egoNode!));
      }
      for (final e in graph.edges) {
        if (e == null) continue;
        final src = _buildNodeDetails(node: e.src);
        final dst = _buildNodeDetails(node: e.dest);
        final edge = EdgeDetails<NodeDetails>(
          source: src,
          destination: dst,
          strokeWidth: (src == _egoNode || dst == _egoNode) ? 4 : 2,
          color: e.weight < 0
              ? Colors.redAccent
              : src == _egoNode || dst == _egoNode
                  ? Colors.amberAccent
                  : Colors.cyanAccent,
        );
        if (!mutator.controller.edges.contains(edge)) {
          if (!mutator.controller.nodes.contains(src)) mutator.addNode(src);
          if (!mutator.controller.nodes.contains(dst)) mutator.addNode(dst);
          mutator.addEdge(edge);
        }
      }
    });
  }

  NodeDetails _buildNodeDetails({
    required String node,
    double size = 40,
    bool pinned = false,
  }) =>
      switch (switch (node.substring(0, 1)) {
        'U' => users[node],
        'B' => beacons[node],
        'C' => comments[node],
        _ => throw Exception('Wrong id type'),
      }) {
        final GGraphFetchForEgoData_gravityGraph_users_user n => UserNode(
            id: n.id,
            label: n.title,
            hasImage: n.has_picture,
            pinned: pinned,
            size: size,
          ),
        final GGraphFetchForEgoData_gravityGraph_beacons_beacon n => BeaconNode(
            id: n.id,
            userId: n.user_id,
            hasImage: n.has_picture,
            label: n.title,
            pinned: pinned,
            size: size,
          ),
        final GGraphFetchForEgoData_gravityGraph_comments n => CommentNode(
            id: n.node,
            pinned: pinned,
            size: size / 2,
          ),
        _ => throw Exception('Object not found: $node'),
      };
}
