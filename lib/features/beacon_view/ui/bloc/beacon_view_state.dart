import 'package:tentura/domain/entity/beacon.dart';
import 'package:tentura/domain/entity/comment.dart';
import 'package:tentura/ui/bloc/state_base.dart';

part 'beacon_view_state.freezed.dart';

@freezed
class BeaconViewState with _$BeaconViewState, StateFetchMixin {
  const factory BeaconViewState({
    required Beacon beacon,
    @Default('') String focusCommentId,
    @Default([]) List<Comment> comments,
    @Default(FetchStatus.isSuccess) FetchStatus status,
    Object? error,
  }) = _BeaconViewState;

  const BeaconViewState._();

  bool get hasFocusedComment => focusCommentId.isNotEmpty;
  bool get hasNoFocusedComment => focusCommentId.isEmpty;

  BeaconViewState setLoading() => copyWith(status: FetchStatus.isLoading);

  BeaconViewState setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );
}
