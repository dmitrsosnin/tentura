import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/beacon/data/_g/beacon_hide_by_id.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_pin_by_id.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_in_my_field.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_in_my_field.var.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_in_my_field.data.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  static const _requestId = 'FetchMyField';

  MyFieldCubit() : super(const MyFieldState()) {
    _subscription = GetIt.I<Client>()
        .request(GBeaconFetchInMyFieldReq(
          (b) => b
            ..requestId = _requestId
            ..fetchPolicy = FetchPolicy.CacheFirst
            ..vars.ego = GetIt.I<AuthRepository>().myId,
        ))
        .listen(_onData, cancelOnError: false);
  }

  late final StreamSubscription<
      OperationResponse<GBeaconFetchInMyFieldData,
          GBeaconFetchInMyFieldVars>> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    GetIt.I<Client>().requestController.add(GBeaconFetchInMyFieldReq(
          (b) => b
            ..requestId = _requestId
            ..fetchPolicy = FetchPolicy.NetworkOnly
            ..vars.ego = GetIt.I<AuthRepository>().myId,
        ));
  }

  Future<bool?> pinBeacon(String beaconId) async => doRequest(
        request: GBeaconPinByIdReq((b) => b..vars.beacon_id = beaconId),
      ).then(
        (value) {
          if (value.hasNoErrors) {
            state.beacons.removeWhere((e) => e.id == beaconId);
            emit(state.copyWith(status: FetchStatus.hasData));
          }
          return value.hasNoErrors;
        },
      );

  Future<bool?> hideBeacon(String beaconId, Duration? hideFor) async =>
      hideFor == null
          ? null
          : doRequest(
              request: GBeaconHideByIdReq(
                (b) => b
                  ..vars.beacon_id = beaconId
                  ..vars.hidden_until = DateTime.timestamp().add(hideFor),
              ),
            ).then(
              (value) {
                if (value.hasNoErrors) {
                  state.beacons.removeWhere((e) => e.id == beaconId);
                  emit(state.copyWith(status: FetchStatus.hasData));
                }
                return value.hasNoErrors;
              },
            );

  void _onData(
      OperationResponse<GBeaconFetchInMyFieldData, GBeaconFetchInMyFieldVars>
          response) {
    if (response.loading) {
      emit(state.copyWith(status: FetchStatus.isLoading));
    } else if (response.hasErrors) {
      emit(state.copyWith(status: FetchStatus.hasError));
    } else {
      final beaconIds = <String>{};
      final myField = <GBeaconFields>[];
      final myId = GetIt.I<AuthRepository>().myId;
      final fetched = [
        if (response.data!.scores != null)
          ...response.data!.scores!
              .map<GBeaconFields>((e) => e.beacon as GBeaconFields),
        ...response.data!.globalScores
            .map<GBeaconFields>((e) => e.beacon as GBeaconFields),
      ];
      for (final beacon in fetched) {
        // TBD: remove that ugly hack when able filter in request
        if (beacon.enabled == false) continue;
        if (beacon.is_hidden ?? false) continue;
        if (beacon.is_pinned ?? false) continue;
        if (beacon.author.id == myId) continue;
        if (beaconIds.add(beacon.id)) myField.add(beacon);
      }
      emit(state.copyWith(beacons: myField, status: FetchStatus.hasData));
    }
  }
}
