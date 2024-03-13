import 'dart:convert';

import 'package:bato_mechanic/src/features/core/domain/user_position/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_progress/data/track_mechanic_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../utils/constants/managers/api_values_manager.dart';
part 'api_track_mechanic_repository.g.dart';

class APITrackMechanicRepository implements TrackMechanicRepository {}

@riverpod
Stream<VehicleRepairRequest> watchRepairRequest(
    WatchRepairRequestRef ref, String repairRequestIdx) async* {
  var url = Uri.parse(
      "${RemoteManager.WEB_SOCKET_BASE_URI}repair-request/$repairRequestIdx");
  final channel = WebSocketChannel.connect(url);

  ref.onDispose(() => channel.sink.close());

  await for (var value in channel.stream) {
    if (value is String) {
      value = jsonDecode(value);
    }
    try {
      yield VehicleRepairRequest.fromJson(value);
    } catch (e) {
      yield VehicleRepairRequest.fromJson(jsonDecode(value));
    }
  }
}

@riverpod
Stream<UserPosition> watchRepairRequestMechanicLocation(
    WatchRepairRequestMechanicLocationRef ref, String repairRequestIdx) async* {
  var url = Uri.parse(
      "${RemoteManager.WEB_SOCKET_BASE_URI}repair-request-mechanic-location/$repairRequestIdx");
  final channel = WebSocketChannel.connect(url);

  ref.onDispose(() => channel.sink.close());

  await for (final value in channel.stream) {
    final Map<String, dynamic> locations = jsonDecode(value);
    yield UserPosition.fromJson(locations['mechanic_location']);
  }
}
