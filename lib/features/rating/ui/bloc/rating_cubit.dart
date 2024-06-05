import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/rating_repository.dart';
import '../../entity/user_rating.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit({
    required this.userId,
    required this.ratingRepository,
    bool fetchOnCreate = true,
  }) : super(const RatingState()) {
    if (fetchOnCreate) fetch();
  }

  final String userId;
  final RatingRepository ratingRepository;

  List<UserRating> _items = [];

  Future<void> fetch() async {
    try {
      _items = (await ratingRepository.fetchUsersRating())
          .where((e) => e.user.id != userId)
          .toList();
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        items: _items,
      ));
      _sort();
    } catch (e) {
      emit(state.setError(e));
    }
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
            .where((e) => e.user.title.toLowerCase().contains(f.toLowerCase()))
            .toList(),
      ));

  void clearSearchFilter() => emit(state.copyWith(
        searchFilter: '',
        items: _items,
      ));

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
            ? a.userScore - b.userScore
            : b.userScore - a.userScore;
        return (c * 10000).toInt();
      });
    }
  }
}
