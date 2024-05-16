import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/beacon/data/beacon_utils.dart';

import '../../data/gql/_g/beacons_fetch_by_user_id.req.gql.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'beacon_state.dart';

class BeaconCubit extends Cubit<BeaconState> with HydratedMixin<BeaconState> {
  BeaconCubit({
    required this.id,
  }) : super(const BeaconState.empty()) {
    hydrate();
    _subscription.resume();
  }

  @override
  final String id;

  final _gqlClient = GetIt.I<Client>();

  late final _request = GBeaconsFetchByUserIdReq((b) => b.vars.user_id = id);

  late final _subscription = _gqlClient.request(_request).listen(
    (response) {
      if (response.loading) {
        emit(state.setLoading());
      } else if (response.hasErrors) {
        emit(state.setError(
          response.linkException ??
              response.graphqlErrors ??
              Exception('Profile: Unknown error while fetch data!'),
        ));
      } else if (response.data != null) {
        emit(BeaconState(
          beacons: {for (final b in response.data!.beacon) b.id: b},
        ));
      }
    },
    cancelOnError: false,
  );

  @override
  BeaconState? fromJson(Map<String, dynamic> json) =>
      BeaconState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(BeaconState state) => state.toJson(state);

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void fetch() => _gqlClient.requestController.add(_request);
}
