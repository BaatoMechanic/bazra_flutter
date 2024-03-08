import 'dart:convert';

import 'package:bato_mechanic/src/features/core/domain/user_position/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_progress/data/track_mechanic_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../utils/constants/managers/api_values_manager.dart';

class APITrackMechanicRepository implements TrackMechanicRepository {
  // @override
  // Stream<dynamic> watchUsersLocation(String repairRequestId) async {
  //   var url = Uri.parse(
  //       "${RemoteManager.WEB_SOCKET_BASE_URI}repair_userslocation/$repairRequestId");
  //   final channel = WebSocketChannel.connect(url);

  //   await channel.ready;

  //   channel.stream.listen((message) {
  //     print(message);
  //     channel.sink.add('received!');
  //     channel.sink.close(status.goingAway);
  //   });
  // }
}

final watchRepairRequestProvider = StreamProvider.autoDispose
    .family<VehicleRepairRequest, String>((ref, repairRequestIdx) async* {
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
});

final watchRepairRequestMechanicLocationProvider = StreamProvider.autoDispose
    .family<UserPosition, String>((ref, repairRequestIdx) async* {
  var url = Uri.parse(
      "${RemoteManager.WEB_SOCKET_BASE_URI}repair-request-mechanic-location/$repairRequestIdx");
  final channel = WebSocketChannel.connect(url);

  ref.onDispose(() => channel.sink.close());

  await for (final value in channel.stream) {
    final Map<String, dynamic> locations = jsonDecode(value);
    // final UserPosition userLocation =
    //     UserPosition.fromJson(jsonEncode(locations['user_location']));
    yield UserPosition.fromJson(locations['mechanic_location']);

    // yield {
    //   'user_location': userLocation,
    //   'mechanic_location': mechanicLocation
    // };
  }
});
