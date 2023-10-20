import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/beacon_utils.dart';
import 'package:gravity/features/my_field/data/_g/beacon_fetch_in_my_field.req.gql.dart';
import 'package:gravity/ui/ferry_utils.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  static const _requestId = 'FetchMyField';

  MyFieldCubit() : super(const MyFieldState());

  late final _subscription = GetIt.I<Client>()
      .request(GBeaconFetchInMyFieldReq(
    (b) => b
      ..requestId = _requestId
      ..fetchPolicy = FetchPolicy.CacheFirst
      ..vars.ego = GetIt.I<AuthRepository>().myId,
  ))
      .listen(
    (response) {
      if (response.loading) {
        emit(state.copyWith(status: FetchStatus.loading));
      } else if (response.hasErrors) {
        emit(state.copyWith(status: FetchStatus.failure));
      } else {
        final myId = GetIt.I<AuthRepository>().myId;
        final myField = [
          ...response.data!.scores!
              .map<GBeaconFields>((e) => e.beacon as GBeaconFields),
          ...response.data!.globalScores
              .map<GBeaconFields>((e) => e.beacon as GBeaconFields),
        ]
            .where((e) =>
                e.enabled &&
                !(e.is_hidden ?? false) &&
                !(e.is_pinned ?? false) &&
                e.author.id != myId)
            .toSet();
        emit(state.copyWith(
          beacons: myField.toList(),
          status: FetchStatus.success,
        ));
      }
    },
    // onError: (_) => emit( const MyFieldState(status: FetchStatus.failure)),
    cancelOnError: false,
  );

  Future<void> dispose() async {
    await _subscription.cancel();
  }

  Future<void> fetch() async {
    GetIt.I<Client>().requestController.add(GBeaconFetchInMyFieldReq(
          (b) => b
            ..requestId = _requestId
            ..fetchPolicy = FetchPolicy.NetworkOnly
            ..vars.ego = GetIt.I<AuthRepository>().myId,
        ));
  }
}
