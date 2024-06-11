import 'dart:async';

import 'package:tentura/ui/bloc/state_base.dart';

import '../../data/rating_repository.dart';
import '../../entity/user_rating.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit({
    required RatingRepository ratingRepository,
    required Stream<bool> hasTokenChanges,
  })  : _repository = ratingRepository,
        super(const RatingState()) {
    hasTokenChanges
        .firstWhere((e) => e)
        .then((e) => _fetchSubscription.resume());
  }

  final RatingRepository _repository;

  late final _fetchSubscription = _repository.stream.listen(
    (e) {
      _items = e.toList(growable: false);
      emit(state.copyWith(
        status: FetchStatus.isSuccess,
        items: _items,
      ));
      _sort();
    },
    onError: (dynamic e) => emit(state.setError(e.toString())),
    cancelOnError: false,
  );

  List<UserRating> _items = [];

  @override
  Future<void> close() async {
    await _fetchSubscription.cancel();
    return super.close();
  }

  Future<void> fetch() async {
    emit(state.setLoading());
    return _repository.fetch();
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
