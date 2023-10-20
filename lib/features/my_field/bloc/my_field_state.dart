part of 'my_field_cubit.dart';

enum FetchStatus { initial, loading, success, failure }

final class MyFieldState extends Equatable {
  const MyFieldState({
    this.status = FetchStatus.initial,
    this.beacons = const <GBeaconFields>[],
    this.hasReachedMax = false,
  });

  final FetchStatus status;
  final List<GBeaconFields> beacons;
  final bool hasReachedMax;

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
  String toString() => jsonEncode({
        'MyFieldState': {
          'status': status,
          'items': beacons.length,
          'hasReachedMax': hasReachedMax,
        },
      });

  @override
  List<Object> get props => [
        status,
        beacons,
        hasReachedMax,
      ];
}
