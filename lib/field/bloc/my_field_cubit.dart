import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gravity/_shared/bloc/state_base.dart';
import 'package:gravity/beacon/entity/beacon.dart';

export 'package:get_it/get_it.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

part 'my_field_state.dart';

class MyFieldCubit extends Cubit<MyFieldState> {
  MyFieldCubit() : super(const MyFieldState()) {
    refresh();
  }

  Future<void> refresh() async {}
}
