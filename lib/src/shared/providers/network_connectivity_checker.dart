import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_connectivity_checker.g.dart';

enum NetworkStatus { NotDetermined, On, Off }

@riverpod
class NetworkConnectivityChecker extends _$NetworkConnectivityChecker {
  @override
  dynamic build() {
    state = NetworkStatus.NotDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      NetworkStatus newState;
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = NetworkStatus.On;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.Off;
          // TODO: Handle this case.
          break;
        default:
          newState = NetworkStatus.NotDetermined;
      }

      if (newState != state) {
        state = newState;
      }
    });
  }
}
