part of 'my_field_cubit.dart';

final class MyFieldState extends Equatable {
  const MyFieldState({
    this.status = FetchStatus.isEmpty,
    this.beacons = const <GBeaconFields>[],
    this.hasReachedMax = false,
  });

  final FetchStatus status;
  final List<GBeaconFields> beacons;
  final bool hasReachedMax;

  bool get isLoading => status == FetchStatus.isLoading;
  bool get isSuccess => status == FetchStatus.hasData;
  bool get hasError => status == FetchStatus.hasError;
  bool get isEmpty => beacons.isEmpty;

  MyFieldState copyWith({
    FetchStatus? status,
    List<GBeaconFields>? beacons,
    bool? hasReachedMax,
  }) =>
      MyFieldState(
        status: status ?? this.status,
        beacons: beacons ?? this.beacons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object> get props => [
        status,
        beacons,
        beacons.length,
        hasReachedMax,
      ];
}
