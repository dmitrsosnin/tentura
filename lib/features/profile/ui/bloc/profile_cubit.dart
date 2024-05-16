import 'package:tentura/ui/bloc/state_base.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';

import '../../data/user_utils.dart';
import '../../data/gql/_g/user_update.req.gql.dart';
import '../../data/gql/_g/user_fetch_by_id.req.gql.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>
    with HydratedMixin<ProfileState> {
  ProfileCubit({
    required this.id,
  }) : super(ProfileState(user: UserFields(id: id))) {
    hydrate();
    _subscription.resume();
  }

  @override
  final String id;

  final _gqlClient = GetIt.I<Client>();

  late final _request =
      GUserFetchByIdReq((GUserFetchByIdReqBuilder b) => b.vars.id = id);

  late final _subscription = _gqlClient.request(_request).listen(
    (response) {
      if (response.loading) {
        emit(state.setLoading());
      } else if (response.hasErrors) {
        emit(state.setError(
          response.linkException ??
              response.graphqlErrors ??
              Exception('Profile: Unknown error while fetch data!'),
        ));
      } else if (response.data != null) {
        emit(ProfileState(user: response.data!.user_by_pk! as GUserFields));
      }
    },
    cancelOnError: false,
  );

  @override
  ProfileState? fromJson(Map<String, dynamic> json) =>
      ProfileState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ProfileState state) => state.toJson(state);

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void fetch() => _gqlClient.requestController.add(_request);

  Future<void> update({
    required String title,
    required String description,
    required bool hasPicture,
  }) async {
    if (title == state.user.title &&
        description == state.user.description &&
        hasPicture == state.user.has_picture) return;
    final response = await _gqlClient
        .request(GUserUpdateReq(
          (b) => b.vars
            ..id = id
            ..title = title
            ..description = description
            ..has_picture = hasPicture,
        ))
        .firstWhere((e) => e.dataSource == DataSource.Link);
    if (response.hasErrors) {
      throw Exception(response.linkException ??
          response.graphqlErrors ??
          'Profile: unknown error while update!');
    } else {
      emit(ProfileState(user: response.data!.update_user_by_pk!));
    }
  }
}
