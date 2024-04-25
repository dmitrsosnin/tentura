part of 'rating_cubit.dart';

final class RatingState extends StateBase {
  const RatingState({
    this.items = const [],
    this.searchFilter = '',
    this.isSortedByAsc = false,
    this.isSortedByEgo = false,
    super.status,
    super.error,
  });

  final String searchFilter;
  final bool isSortedByAsc;
  final bool isSortedByEgo;
  final List<GUsersRatingData_usersStats> items;

  RatingState copyWith({
    List<GUsersRatingData_usersStats>? items,
    String? searchFilter,
    bool? isSortedByAsc,
    bool? isSortedByEgo,
    FetchStatus? status,
    Object? error,
  }) =>
      RatingState(
        items: items ?? this.items,
        searchFilter: searchFilter ?? this.searchFilter,
        isSortedByAsc: isSortedByAsc ?? this.isSortedByAsc,
        isSortedByEgo: isSortedByEgo ?? this.isSortedByEgo,
        status: status ?? (error == null ? this.status : FetchStatus.isFailure),
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        isSortedByAsc,
        isSortedByEgo,
        searchFilter,
        items.length,
        items.firstOrNull,
        items.lastOrNull,
        status,
        error,
        items,
      ];
}
