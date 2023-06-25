part of 'my_beacons_cubit.dart';

enum MyBeaconsStatus { initial, isLoading, hasData, hasError }

class MyBeaconsState extends Equatable {
  final MyBeaconsStatus status;
  final List<Beacon> beacons;
  final Object? error;

  const MyBeaconsState({
    this.beacons = const [],
    this.status = MyBeaconsStatus.initial,
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        beacons,
        beacons.length,
      ];

  bool get isEmpty => beacons.isEmpty;

  bool get isLoading => status == MyBeaconsStatus.isLoading;

  MyBeaconsState copyWith({
    List<Beacon>? beacons,
    MyBeaconsStatus? status,
    Object? error,
    bool clearError = false,
  }) =>
      MyBeaconsState(
          error: clearError ? null : error ?? this.error,
          beacons: beacons ?? this.beacons,
          status: status ?? this.status);
}
