import 'dart:async';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:tentura/ui/bloc/state_base.dart';

import 'package:tentura/features/rating/data/_g/fetch_users_rating.data.gql.dart';
import 'package:tentura/features/rating/data/_g/fetch_users_rating.req.gql.dart';
import 'package:tentura/features/rating/data/_g/fetch_users_rating.var.gql.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit({
    required this.myId,
  }) : super(const RatingState()) {
    _subscription.resume();
  }

  final String myId;

  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  final _request = GUsersRatingReq();

  late final _subscription = GetIt.I<Client>().request(_request).listen(
        _onData,
        cancelOnError: false,
        onError: (Object? e) => emit(state.copyWith(error: e)),
      );

  List<GUsersRatingData_usersStats> _items = [];

  @override
  Future<void> close() async {
    searchController.dispose();
    await _subscription.cancel();
    return super.close();
  }

  void toggleSortingByAsc() {
    emit(state.copyWith(isSortedByAsc: !state.isSortedByAsc));
    _sort();
  }

  void toggleSortingByEgo() {
    emit(state.copyWith(isSortedByEgo: !state.isSortedByEgo));
    _sort();
  }

  void setSearchFilter(String f) => emit(state.copyWith(
        searchFilter: f,
        items: _items
            .where((e) => e.user!.title.toLowerCase().contains(f.toLowerCase()))
            .toList(),
      ));

  void clearSearchFilter() {
    searchController.clear();
    emit(state.copyWith(
      searchFilter: '',
      items: _items,
    ));
  }

  void _onData(OperationResponse<GUsersRatingData, GUsersRatingVars> response) {
    if (response.data == null) return;
    _items =
        response.data!.usersStats.where((e) => e.user?.id != myId).toList();
    emit(state.copyWith(
      status: FetchStatus.isSuccess,
      items: _items,
    ));
    _sort();
  }

  void _sort() {
    if (state.isSortedByEgo) {
      state.items.sort((a, b) {
        final c = state.isSortedByAsc
            ? a.egoScore - b.egoScore
            : b.egoScore - a.egoScore;
        return (c * 10000).toInt();
      });
    } else {
      state.items.sort((a, b) {
        final c = state.isSortedByAsc
            ? a.nodeScore - b.nodeScore
            : b.nodeScore - a.nodeScore;
        return (c * 10000).toInt();
      });
    }
  }
}
