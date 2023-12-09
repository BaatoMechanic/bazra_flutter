import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/common/widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/common/widgets/user_circle_avatar.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/home/presentation/home_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/home/tips_carousel.dart';
import 'package:bato_mechanic/src/features/menu/user_profile_menu.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:bato_mechanic/src/utils/helpers/user_helper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/domain/user.dart';
import '../repair_request/domain/vehicle_repair_request.dart';
import '../repair_request/presentation/request_mechanic/repair_request_controller.dart';
import 'service_buttons_grid.dart';
import 'service_type_button.dart';

class BuildHomeScreen extends ConsumerWidget {
  BuildHomeScreen({super.key});
  final controller = FlipCardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlipCard(
      speed: 300,
      direction: FlipDirection.HORIZONTAL,
      flipOnTouch: false,
      controller: controller,
      front: HomeScreen(flipCardController: controller),
      // back: TempScreen(flipCardController: controller),
      back: TrackMechanicScreen(flipCardController: controller),
    );
  }
}

class TempScreen extends StatelessWidget {
  const TempScreen({super.key, this.flipCardController});
  final FlipCardController? flipCardController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: flipCardController == null
            ? null
            : FloatingActionButton(
                // Giving a unique tag because exception of 'There are multiple heroes that share the same tag within a subtree.' was being thrown as front and back page use the floating action button which is within the same subtree

                heroTag: "unique_tag_for_back_fab",
                onPressed: () {
                  flipCardController!.toggleCard();
                },
                child: Image.asset('assets/images/parts/wheel.png'),
              ),
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key, this.flipCardController});
  final FlipCardController? flipCardController;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  TextEditingController _searchTextController = TextEditingController();

  FocusNode _searchFocusNode = FocusNode();

// Set this to true when first loading data when the app starts
  bool _loadingData = false;

  void _navigateToLogin(BuildContext context) {
    if (mounted) context.replaceNamed(appRoute.login.name);
  }

  Future<bool> _fetchUserInfoWithAccessToken(
      WidgetRef ref, String accessToken) async {
    final notifier = ref.read(homeScreenControllerProvider.notifier);
    return await notifier.fetchUserInfo(accessToken);
  }

  Future<bool> _refreshTokenAndFetchUserInfo(
      WidgetRef ref, String refreshToken) async {
    final notifier = ref.read(homeScreenControllerProvider.notifier);
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
      setState(() {
        _loadingData = true;
      });
      final isLoggedIn = ref.watch(authServiceProvider).currentUser != null;

      if (!isLoggedIn) {
        final sharedPreferences = ref.read(sharedPreferencesProvider);
        final accessToken = sharedPreferences.getString("access");
        final refreshToken = sharedPreferences.getString("refresh");

        if (accessToken != null) {
          if (!await _fetchUserInfoWithAccessToken(ref, accessToken)) {
            setState(() {
              _loadingData = false;
            });
            if (!mounted) return;
            _navigateToLogin(context);

            return;
          }
        } else if (refreshToken != null) {
          if (!await _refreshTokenAndFetchUserInfo(ref, refreshToken)) {
            setState(() {
              _loadingData = false;
            });
            if (!mounted) return;
            _navigateToLogin(context);
            return;
          }
        } else {
          setState(() {
            _loadingData = false;
          });
          if (!mounted) return;
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
      setState(() {
        _loadingData = false;
      });
      // if (mounted) context.replaceNamed(appRoute.home.name);
      // if (mounted) context.replaceNamed(appRoute.buildHome.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => ToastHelper.onWillPopToast(context),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: widget.flipCardController == null
              ? null
              : FloatingActionButton(
                  heroTag: "unique_tag_for_front_fab",
                  onPressed: () {
                    widget.flipCardController!.toggleCard();
                  },
                  shape: const RoundedRectangleBorder().copyWith(
                      borderRadius: BorderRadius.circular(
                    DefaultManager.borderRadiusFull,
                  )),
                  child: Image.asset('assets/images/parts/wheel.png'),
                ),
          drawer: Drawer(
            child: UserProfileMenu(),
          ),
          appBar: AppBar(
            elevation: AppHeight.h0,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: AppPadding.p8),
                child: UserCircleAvatar(
                  radius: AppRadius.r20,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              if (_loadingData)
                LinearProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.grey,
                    )),
              Stack(
                children: [
                  Container(
                    height: AppHeight.h150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft:
                              Radius.circular(DefaultManager.borderRadiusMd),
                          bottomRight:
                              Radius.circular(DefaultManager.borderRadiusMd)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                      vertical: AppPadding.p12,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppHeight.h40,
                          child: SearchBar(
                            controller: _searchTextController,
                            focusNode: _searchFocusNode,
                            hintText: 'Search'.hardcoded(),
                            leading: const Icon(Icons.search,
                                color: ThemeColor.dark),
                            onChanged: (value) {
                              _searchTextController.text = value;
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: AppPadding.p24),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: AppHeight.h14,
                                ),
                                TipsCarousel(),
                                SizedBox(
                                  height: AppHeight.h20,
                                ),
                                ServiceButtonsGrid(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
