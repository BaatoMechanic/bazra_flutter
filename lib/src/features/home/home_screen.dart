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
      back: TrackMechanicScreen(),
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(watchUserStateChangesProvider).value;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ThemeColor.primary,
              title: Text(
                'Do you want to close the app?',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ThemeColor.dark,
                    ),
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    'Yes',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ThemeColor.dark,
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    'No',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ThemeColor.dark,
                        ),
                  ),
                ),
              ],
            );
          },
        );
        if (shouldPop != null) {
          return shouldPop;
        }
        return false;
      },
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
          body: Stack(
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
                        leading:
                            const Icon(Icons.search, color: ThemeColor.dark),
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
        ),
      ),
    );
  }
}
