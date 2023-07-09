import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gravity/bloc/state_base.dart';
import 'package:gravity/entity/beacon.dart';
import 'package:gravity/entity/comment.dart';

part 'beacon_details_state.dart';

class BeaconDetailsCubit extends Cubit<BeaconDetailsState> {
  BeaconDetailsCubit({required Beacon beacon})
      : super(BeaconDetailsState(beacon: beacon));

  Future<void> refresh() async {}
}
