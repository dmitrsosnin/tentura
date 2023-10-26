import 'package:gravity/ui/utils/state_base.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(const StatsState());
}
