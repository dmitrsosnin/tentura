import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/beacon/data/beacon_utils.dart';

import '../../data/gql/_g/beacon_fetch_my_field.data.gql.dart';
import '../../data/gql/_g/beacon_fetch_my_field.req.gql.dart';
import '../../data/gql/_g/beacon_fetch_my_field.var.gql.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit({bool needFetch = true}) : super(const MyFieldState()) {
    _subscription.resume();
    if (needFetch) fetch();
  }

  final _request = GBeaconFetchMyFieldReq();

  late final _subscription = GetIt.I<Client>().request(_request).listen(
        _onData,
        cancelOnError: false,
      );

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    GetIt.I<Client>().requestController.add(_request);
  }

  void _onData(
      OperationResponse<GBeaconFetchMyFieldData, GBeaconFetchMyFieldVars>
          response) {
    if (response.loading) {
      emit(state.copyWith(
        status: FetchStatus.isLoading,
      ));
    } else if (response.hasErrors) {
      emit(state.copyWith(
        status: FetchStatus.isFailure,
      ));
    } else if (response.data != null) {
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        beacons: response.data!.scores
            .where((e) => e.beacon != null)
            .map<GBeaconFields>((e) => e.beacon as GBeaconFields)
            // TBD: remove that ugly hack when able filter in request
            .where((e) => e.enabled)
            .toList(),
      ));
    }
  }
}
