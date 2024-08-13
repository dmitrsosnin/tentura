part of 'my_field_cubit.dart';

final class MyFieldState extends StateBase {
  const MyFieldState({
    this.beacons = const <Beacon>[],
    this.context = '',
    super.status,
    super.error,
  });

  final List<Beacon> beacons;
  final String context;

  @override
  List<Object?> get props => [
        error,
        status,
        context,
        beacons,
        beacons.length,
      ];

  @override
  MyFieldState copyWith({
    Object? error,
    FetchStatus? status,
    List<Beacon>? beacons,
    String? context,
  }) =>
      MyFieldState(
        error: error ?? this.error,
        status: status ?? (error == null ? this.status : FetchStatus.isFailure),
        beacons: beacons ?? this.beacons,
        context: context ?? this.context,
      );

  @override
  MyFieldState setError(Object error) => MyFieldState(
        status: FetchStatus.isFailure,
        beacons: beacons,
        error: error,
      );

  @override
  MyFieldState setLoading() => MyFieldState(
        status: FetchStatus.isLoading,
        beacons: beacons,
      );
}
