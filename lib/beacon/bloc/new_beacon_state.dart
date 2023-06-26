part of 'new_beacon_cubit.dart';

class NewBeaconState extends StateBase {
  final bool isValid;
  final String imagePath;
  final GeoCoords? coordinates;
  final DateTimeRange? dateRange;

  const NewBeaconState({
    super.status,
    super.error,
    this.isValid = false,
    this.imagePath = '',
    this.coordinates,
    this.dateRange,
  });

  @override
  List<Object> get props => [
        status,
        isValid,
        imagePath,
        dateRange ?? 0,
        coordinates ?? 0,
      ];

  bool get isNotValid => !isValid;

  NewBeaconState copyWith({
    Object? error,
    bool clearError = false,
    BlocDataStatus? status,
    GeoCoords? coordinates,
    bool clearCoordinates = false,
    DateTimeRange? dateRange,
    bool clearDateRange = false,
    String? imagePath,
    bool? isValid,
  }) =>
      NewBeaconState(
        status: status ?? this.status,
        error: clearError ? null : error ?? this.error,
        coordinates: clearCoordinates ? null : coordinates ?? this.coordinates,
        dateRange: clearDateRange ? null : dateRange ?? this.dateRange,
        imagePath: imagePath ?? this.imagePath,
        isValid: isValid ?? this.isValid,
      );
}
