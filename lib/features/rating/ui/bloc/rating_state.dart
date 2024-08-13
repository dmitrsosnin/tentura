part of 'rating_cubit.dart';

final class RatingState extends StateBase {
  const RatingState({
    this.items = const [],
    this.context = '',
    this.searchFilter = '',
    this.isSortedByAsc = false,
    this.isSortedByEgo = false,
    super.status,
    super.error,
  });

  final String context;
  final String searchFilter;
  final bool isSortedByAsc;
  final bool isSortedByEgo;
  final List<UserRating> items;

  @override
  List<Object?> get props => [
        isSortedByAsc,
        isSortedByEgo,
        searchFilter,
        items.length,
        items.firstOrNull,
        items.lastOrNull,
        context,
        status,
        error,
        items,
      ];

  @override
  RatingState copyWith({
    List<UserRating>? items,
    String? searchFilter,
    String? context,
    bool? isSortedByAsc,
    bool? isSortedByEgo,
    FetchStatus? status,
    Object? error,
  }) =>
      RatingState(
        items: items ?? this.items,
        context: context ?? this.context,
        searchFilter: searchFilter ?? this.searchFilter,
        isSortedByAsc: isSortedByAsc ?? this.isSortedByAsc,
        isSortedByEgo: isSortedByEgo ?? this.isSortedByEgo,
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  RatingState setError(Object error) => copyWith(
        status: FetchStatus.isFailure,
        error: error,
      );

  @override
  RatingState setLoading() => copyWith(
        status: FetchStatus.isLoading,
      );
}
