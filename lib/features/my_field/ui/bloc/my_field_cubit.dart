import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/domain/entity/beacon.dart';

import '../../data/my_field_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit(this._repository) : super(const MyFieldState()) {
    _fetchSubscription.resume();
  }

  final MyFieldRepository _repository;

  late final _fetchSubscription = _repository.stream.listen(
    (e) => emit(MyFieldState(beacons: e.toList())),
    onError: (dynamic e) => emit(state.setError(e.toString())),
    cancelOnError: false,
  );

  @override
  Future<void> close() {
    _fetchSubscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    emit(state.setLoading());
    return _repository.fetch();
  }

  Future<int> vote({
    required int amount,
    required String beaconId,
  }) async {
    final beacon = await _repository.vote(id: beaconId, amount: amount);
    return beacon.my_vote ?? 0;
  }
}
