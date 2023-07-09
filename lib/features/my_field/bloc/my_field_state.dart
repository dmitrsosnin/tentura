part of 'my_field_cubit.dart';

class MyFieldState extends StateBase {
  final List<Beacon> beacons;

  const MyFieldState({
    this.beacons = const [],
  });

  @override
  List<Object?> get props => [
        error,
        status,
        beacons,
      ];
}
