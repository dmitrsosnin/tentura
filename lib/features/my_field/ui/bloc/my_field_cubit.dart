import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import 'package:tentura/features/beacon/domain/entity/beacon.dart';

import '../../data/gql/_g/beacon_fetch_my_field.req.gql.dart';
import '../../data/my_field_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit({
    MyFieldRepository? myFieldRepository,
    bool needFetch = true,
  })  : _myFieldRepository = myFieldRepository ?? MyFieldRepository(),
        super(const MyFieldState()) {
    _subscription.resume();
    if (needFetch) fetch();
  }

  final MyFieldRepository _myFieldRepository;

  late final _subscription =
      GetIt.I<Client>().request(GBeaconFetchMyFieldReq()).listen(
    (response) {
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
              .map((e) => e.beacon as Beacon)
              // TBD: remove that ugly hack when able filter in request
              .where((e) => e.enabled)
              .toList(),
        ));
      }
    },
    cancelOnError: false,
  );

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    GetIt.I<Client>().requestController.add(GBeaconFetchMyFieldReq());
  }

  Future<int> vote({
    required int amount,
    required String beaconId,
  }) async {
    final beacon = await _myFieldRepository.vote(id: beaconId, amount: amount);
    return beacon.my_vote ?? 0;
  }
}
