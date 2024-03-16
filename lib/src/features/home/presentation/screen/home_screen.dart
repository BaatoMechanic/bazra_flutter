import 'package:bato_mechanic/src/shared/providers/system_alerts_controller.dart';
import 'package:bato_mechanic/src/shared/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/shared/widgets/user_circle_avatar.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/features/home/presentation/screen/home_screen_controller.dart';
import 'package:bato_mechanic/src/features/home/presentation/widget/service_buttons_grid_shimmer.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/data/mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/presentaiton/widgets/tips_carousel_shimmer.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/default_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/presentaiton/widgets/tips_carousel.dart';
import 'package:bato_mechanic/src/features/menu/presentation/widgets/user_profile_menu.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/helpers/toast_helper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/providers/network_connectivity_checker.dart';
import '../../../../shared/providers/user_settings.dart';
import '../../../repair_progress/presentation/screens/repair_progress_screen.dart';
import '../../../repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import '../../../services/data/service_type_repository.dart';
import '../widget/service_buttons_grid.dart';

final flipControllerProvider = Provider<FlipCardController>((ref) {
  // Everything works properly without this for home screen and repair progress screen (uncomment the controllers). But what if we need to flip home screen from another page? Like from review mechanic screen which is accessed from repair progress screen. So when we navigate to home screen from there we go to repair progress screen. so with this approach first we flip to home screen and then navigate.
  return FlipCardController();
});

class BuildHomeScreen extends ConsumerWidget {
  BuildHomeScreen({super.key});
  final controller = FlipCardController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(watchRepairRequestProvider,
    //     (previousState, state) => state.showError(context));
    ref.listen(networkConnectivityCheckerProvider, (previous, next) {
      if (next == NetworkStatus.On) {
        if (ModalRoute.of(context)?.isCurrent != true) {
          Navigator.pop(context);
        }
      }
      if (next == NetworkStatus.Off) {
        String message = "No Internet Connection".hardcoded();
        ToastHelper.showCenterAlert(context, message);
      }
    });

    final activeRepair = ref.watch(activeRepairRequestProvider);
    return FlipCard(
      speed: 300,
      direction: FlipDirection.HORIZONTAL,
      flipOnTouch: false,
      // controller: controller,
      controller: ref.watch(flipControllerProvider),
      // front: HomeScreen(flipCardController: controller),
      front: HomeScreen(flipCardController: ref.watch(flipControllerProvider)),
      back: activeRepair == null
          ? Container()
          : RepairProgressScreen(
              repairRequestIdx: activeRepair.idx,
              // flipCardController: controller),
              flipCardController: ref.watch(flipControllerProvider)),
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
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.flipCardController});
  final FlipCardController flipCardController;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  final TextEditingController _searchTextController = TextEditingController();

  final FocusNode _searchFocusNode = FocusNode();

// Set this to true when first loading data when the app starts
  bool _loadingData = false;

  void _navigateToLogin(BuildContext context) {
    if (mounted) context.replaceNamed(APP_ROUTE.login.name);
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
      final isLoggedIn = ref.watch(authStateNotifierProvider).user != null;

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

      // Fetch user repair requests when the app starts
      await ref
          .read(homeScreenControllerProvider.notifier)
          .fetchUserRepairRequests();

      setState(() {
        _loadingData = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeScreenControllerProvider,
        (previousState, state) => state.showError(context));

    final mechanicTipsVAlue = ref.watch(fetchMechanicTipsProvider);

    // return PopScope(
    //   canPop: true,
    //   onPopInvoked: (didPop) => ToastHelper.onWillPopToast(context),
    return WillPopScope(
      onWillPop: () {
        if (widget.flipCardController.state?.isFront == false) {
          widget.flipCardController.toggleCard();
          return Future.value(false);
        }
        return ToastHelper.onWillPopToast(context);
      },
      child: SafeArea(
        child: Scaffold(
          floatingActionButton:
              ref.watch(fetchUserRepairRequestProvider).value == null
                  ? null
                  : FloatingActionButton(
                      heroTag: "unique_tag_for_front_fab",
                      onPressed: () {
                        widget.flipCardController.toggleCard();
                      },
                      shape: const RoundedRectangleBorder().copyWith(
                          borderRadius: BorderRadius.circular(
                        DefaultManager.borderRadiusFull,
                      )),
                      child: Image.asset('assets/images/parts/wheel.png'),
                    ),
          drawer: const Drawer(
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
          body: RefreshIndicator(
            onRefresh: () => ref.refresh(fetchAllServiceTypesProvider.future),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
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
                              bottomLeft: Radius.circular(
                                  DefaultManager.borderRadiusMd),
                              bottomRight: Radius.circular(
                                  DefaultManager.borderRadiusMd)),
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
                            if (mechanicTipsVAlue.hasValue &&
                                mechanicTipsVAlue.value != null &&
                                mechanicTipsVAlue.value!.isNotEmpty)
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: AppPadding.p24),
                                child: Consumer(builder: (context, ref, child) {
                                  return AsyncValueWidget(
                                    loadingShimmer: const TipsCarouselShimmer(),
                                    value: mechanicTipsVAlue,
                                    data: (tips) => TipsCarousel(
                                      tips: tips,
                                    ),
                                  );
                                }),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Consumer(builder: (context, ref, child) {
                    final servicesValue =
                        ref.watch(fetchAllServiceTypesProvider);
                    return AsyncValueWidget(
                      loadingShimmer: const ServiceButtonsGridShimmerWidget(),
                      value: servicesValue,
                      data: (services) => ServiceButtonsGridWidget(
                        services: services,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
