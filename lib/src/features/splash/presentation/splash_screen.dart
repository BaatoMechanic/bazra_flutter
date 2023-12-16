import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';
import 'package:bato_mechanic/src/features/splash/presentation/splash_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/extensions/async_value_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/helpers/toast_helper.dart';
import '../../repair_request/domain/vehicle_repair_request.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with WidgetsBindingObserver {
  void _navigateToLogin(BuildContext context) {
    if (mounted) context.replaceNamed(APP_ROUTE.login.name);
  }

  Future<bool> _fetchUserInfoWithAccessToken(
      WidgetRef ref, String accessToken) async {
    final notifier = ref.read(splashScreenControllerProvider.notifier);
    return await notifier.fetchUserInfo(accessToken);
  }

  Future<bool> _refreshTokenAndFetchUserInfo(
      WidgetRef ref, String refreshToken) async {
    final notifier = ref.read(splashScreenControllerProvider.notifier);
    if (!await notifier.refreshToken(refreshToken)) {
      return false;
    }
    final accessToken = ref.read(sharedPreferencesProvider).getString("access");
    return await notifier.fetchUserInfo(accessToken!);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isLoggedIn = ref.watch(authServiceProvider).currentUser != null;
      if (!isLoggedIn) {
        _navigateToLogin(context);
        return;
      }

      final sharedPreferences = ref.read(sharedPreferencesProvider);
      final accessToken = sharedPreferences.getString("access");
      final refreshToken = sharedPreferences.getString("refresh");

      if (accessToken != null) {
        if (!await _fetchUserInfoWithAccessToken(ref, accessToken)) {
          _navigateToLogin(context);
          return;
        }
      } else if (refreshToken != null) {
        if (!await _refreshTokenAndFetchUserInfo(ref, refreshToken)) {
          _navigateToLogin(context);
          return;
        }
      }

      // TODO: Uncomment this code to check for available repair request and to act accordingly

      // final result = await ref
      //     .read(splashScreenControllerProvider.notifier)
      //     .hasRepairRequest("1");
      // if (result) {
      //   VehicleRepairRequest? repairRequest =
      //       ref.read(repairRequestServiceProvider).activeRepairRequest;

      //   if (repairRequest != null) {
      //     if (repairRequest.status ==
      //         VehicleRepairRequestStatus.IN_PROGRESS) {
      //       // if (mounted) context.pushNamed(appRoute.repairProgress.name);
      //       if (mounted) context.goNamed(appRoute.repairProgress.name);
      //       return;
      //     }
      //     // if (mounted) context.pushNamed(appRoute.trackMechanic.name);
      //     if (mounted) context.goNamed(appRoute.trackMechanic.name);
      //     return;
      //   }
      // }

      if (mounted) context.replaceNamed(APP_ROUTE.home.name);
      // if (mounted) context.replaceNamed(appRoute.buildHome.name);
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashScreenControllerProvider,
        (previousState, state) => state.showError(context));

    return Scaffold(
      backgroundColor: Colors.amberAccent[200],
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
