// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bato_mechanic/src/features/core/domain/user_position/user_position.dart';

import '../../auth/domain/mechanic.dart';

class RepairProgressScreenState {
  RepairProgressScreenState({
    required this.currentUserLocation,
    required this.currentMechanicLocation,
    required this.mechanicInfo,
  });

  final UserPosition? currentUserLocation;
  final Stream<UserPosition?> currentMechanicLocation;
  final Mechanic? mechanicInfo;

  RepairProgressScreenState copyWith({
    UserPosition? currentUserLocation,
    Stream<UserPosition?>? currentMechanicLocation,
    Mechanic? mechanicInfo,
  }) {
    return RepairProgressScreenState(
      currentUserLocation: currentUserLocation ?? this.currentUserLocation,
      currentMechanicLocation:
          currentMechanicLocation ?? this.currentMechanicLocation,
      mechanicInfo: mechanicInfo ?? this.mechanicInfo,
    );
  }

  @override
  String toString() =>
      'TrackMechanicScreenState(currentUserLocation: $currentUserLocation, currentMechanicLocation: $currentMechanicLocation, mechanicInfo: $mechanicInfo)';

  @override
  bool operator ==(covariant RepairProgressScreenState other) {
    if (identical(this, other)) return true;

    return other.currentUserLocation == currentUserLocation &&
        other.currentMechanicLocation == currentMechanicLocation &&
        other.mechanicInfo == mechanicInfo;
  }

  @override
  int get hashCode =>
      currentUserLocation.hashCode ^
      currentMechanicLocation.hashCode ^
      mechanicInfo.hashCode;
}
