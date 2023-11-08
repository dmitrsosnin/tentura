import 'dart:async';

import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/beacon/data/_g/beacon_hide_by_id.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_pin_by_id.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_my_field.req.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_my_field.var.gql.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_my_field.data.gql.dart';
import 'package:gravity/ui/utils/ferry_utils.dart';
import 'package:gravity/ui/utils/state_base.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

typedef _Response
    = OperationResponse<GBeaconFetchMyFieldData, GBeaconFetchMyFieldVars>;

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit() : super(const MyFieldState(status: FetchStatus.isLoading)) {
    _subscription = GetIt.I<Client>().request(_request).listen(
          _onData,
          cancelOnError: false,
        );
  }

  final _request = GBeaconFetchMyFieldReq();

  late final StreamSubscription<_Response> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    GetIt.I<Client>().requestController.add(_request);
  }

  Future<bool?> pinBeacon(String beaconId) async => doRequest(
        request: GBeaconPinByIdReq((b) => b..vars.beacon_id = beaconId),
      ).then(
        (value) {
          if (value.hasNoErrors) {
            state.beacons.removeWhere((e) => e.id == beaconId);
            emit(state.copyWith(
              status: FetchStatus.hasData,
            ));
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
                  emit(state.copyWith(
                    status: FetchStatus.hasData,
                  ));
                }
                return value.hasNoErrors;
              },
            );

  void _onData(_Response response) {
    if (response.loading) {
      emit(state.copyWith(
        status: FetchStatus.isLoading,
      ));
    } else if (response.hasErrors) {
      emit(state.copyWith(
        status: FetchStatus.hasError,
      ));
    } else if (response.data != null) {
      emit(state.copyWith(
        status: FetchStatus.hasData,
        beacons: response.data!.scores
            .where((e) => e.beacon != null)
            .map<GBeaconFields>((e) => e.beacon as GBeaconFields)
            // TBD: remove that ugly hack when able filter in request
            .where((e) =>
                e.enabled &&
                !(e.is_hidden ?? false) &&
                !(e.is_pinned ?? false) &&
                (e.my_vote ?? 0) >= 0)
            .toList(),
      ));
    }
  }
}
