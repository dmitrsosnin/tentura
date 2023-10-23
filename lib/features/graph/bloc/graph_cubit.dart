import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:force_directed_graphview/force_directed_graphview.dart';

import 'package:gravity/data/utils.dart';
import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/domain/entity/edge_details.dart';
import 'package:gravity/domain/entity/node_details.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch.req.gql.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch.var.gql.dart';
import 'package:gravity/features/graph/data/_g/graph_fetch.data.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'graph_state.dart';

typedef _Response = OperationResponse<GGraphFetchData, GGraphFetchVars>;

class GraphCubit extends Cubit<GraphState> {
  static const _requestId = 'FetchGraph';

  GraphCubit({required String focus})
      : super(GraphState(
          focus: focus,
          status: FetchStatus.isLoading,
        )) {
    _subscription = GetIt.I<Client>()
        .request(GGraphFetchReq(
          (b) => b
            ..requestId = _requestId
            ..fetchPolicy = FetchPolicy.NoCache
            ..vars.positiveOnly = false
            ..vars.focus = focus.isEmpty ? null : focus,
        ))
        .listen(
          _onData,
          cancelOnError: false,
          onError: (Object? e) => emit(state.copyWith(error: e)),
        );
  }

  final graphController =
      GraphController<NodeDetails, EdgeDetails<NodeDetails>>();

  late final StreamSubscription<_Response> _subscription;

  final _myId = GetIt.I<AuthRepository>().myId;
  final _users = <String, GGraphFetchData_gravityGraph_users_user>{};
  final _beacons = <String, GGraphFetchData_gravityGraph_beacons_beacon>{};
  final _comments = <String, GGraphFetchData_gravityGraph_comments_comment>{};

  NodeDetails? _egoNode;

  @override
  Future<void> close() async {
    graphController.dispose();
    await _subscription.cancel();
    return super.close();
  }

  void jumpToEgo() => graphController.jumpToNode(_egoNode!);

  void setFocus(NodeDetails node) {
    graphController.jumpToNode(node);
    GetIt.I<Client>().requestController.add(GGraphFetchReq(
          (b) => b
            ..fetchPolicy = FetchPolicy.NoCache
            ..requestId = _requestId
            ..vars.focus = node.id
            ..vars.positiveOnly = false,
        ));
  }

  void _onData(_Response response) {
    final graph = response.data?.gravityGraph;
    if (graph == null) {
      emit(state.copyWith(error: 'No data or got error'));
      return;
    } else {
      for (final e in graph.users) {
        _users.putIfAbsent(e!.user!.id, () => e.user!);
      }
      for (final e in graph.beacons) {
        _beacons.putIfAbsent(e!.beacon!.id, () => e.beacon!);
      }
      for (final e in graph.comments) {
        _comments.putIfAbsent(e!.comment!.id, () => e.comment!);
      }
      emit(state.copyWith(status: FetchStatus.hasData));
    }
    graphController.mutate((mutator) {
      if (_egoNode == null) {
        _egoNode = _buildNodeDetails(
              node: _myId,
              pinned: true,
              size: 80,
            ) ??
            UserNode(
              id: _myId,
              label: 'Me',
              pinned: true,
              size: 80,
            );
        mutator.addNode(_egoNode!);
        Future.delayed(
          const Duration(milliseconds: 250),
          jumpToEgo,
        );
      }
      final missedIds = <String>[];
      for (final e in graph.edges) {
        final src = _buildNodeDetails(node: e!.src);
        if (src == null) missedIds.add(e.src);
        final dst = _buildNodeDetails(node: e.dest);
        if (dst == null) missedIds.add(e.dest);
        if (src == null || dst == null) continue;
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
        if (!mutator.controller.nodes.contains(src)) mutator.addNode(src);
        if (!mutator.controller.nodes.contains(dst)) mutator.addNode(dst);
        if (!mutator.controller.edges.contains(edge)) mutator.addEdge(edge);
      }
      if (missedIds.isNotEmpty) emit(state.copyWith(error: missedIds));
    });
  }

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
        final GGraphFetchData_gravityGraph_users_user n => UserNode(
            id: n.id,
            label: n.title,
            hasImage: n.has_picture,
            pinned: pinned,
            size: size,
          ),
        final GGraphFetchData_gravityGraph_beacons_beacon n => BeaconNode(
            id: n.id,
            userId: n.user_id,
            hasImage: n.has_picture,
            label: n.title,
            pinned: pinned,
            size: size,
          ),
        final GGraphFetchData_gravityGraph_comments_comment n => CommentNode(
            id: n.id,
            userId: n.user_id,
            beaconId: n.beacon_id,
            pinned: pinned,
            size: size,
          ),
        _ => null,
      };
}
