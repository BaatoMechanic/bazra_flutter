import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';
import 'package:bato_mechanic/src/features/splash/presentation/splash_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../repair_request/domain/vehicle_repair_request.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // final isLoggedIn = ref.watch(userServiceProvider).currentUser != null;
        // if (!isLoggedIn) {
        //   if (mounted) context.replaceNamed(appRoute.login.name);
        //   return;
        // } else {
        //   if (mounted) context.replaceNamed(appRoute.home.name);
        //   return;
        // }

        WidgetsBinding.instance.addObserver(this);

        WidgetsBinding.instance.addPostFrameCallback(
          (_) async {
            final result = await ref
                .read(splashScreenControllerProvider)
                .hasRepairRequest("1");
            if (result) {
              VehicleRepairRequest? repairRequest =
                  ref.read(repairRequestServiceProvider).activeRepairRequest;

              if (repairRequest != null) {
                if (repairRequest.status ==
                    VehicleRepairRequestStatus.IN_PROGRESS) {
                  // if (mounted) context.pushNamed(appRoute.repairProgress.name);
                  if (mounted) context.goNamed(appRoute.repairProgress.name);
                  return;
                }
                // if (mounted) context.pushNamed(appRoute.trackMechanic.name);
                if (mounted) context.goNamed(appRoute.trackMechanic.name);
                return;
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[200],
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.amberAccent[200],
    //   body: userRepairRequestsValue.when(
    //     data: (hasRequest) {
    //       if (hasRequest) {
    //         context.goNamed(appRoute.trackMechanic.name);
    //       }
    //       return Container();
    //     },
    //     error: (error, st) {
    //       return Container();
    //     },
    //     loading: () => const Center(
    //       child: CircularProgressIndicator(color: Colors.white),
    //     ),
    //   ),
    // );
  }
}
