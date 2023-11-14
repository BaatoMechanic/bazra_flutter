import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/common/widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/features/home/presentation/home_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/home/tips_carousel.dart';
import 'package:bato_mechanic/src/features/menu/user_profile_menu.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../repair_request/domain/vehicle_repair_request.dart';
import '../repair_request/presentation/request_mechanic/repair_request_controller.dart';
import 'service_buttons_grid.dart';
import 'service_type_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

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
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(homeScreenControllerProvider).hasRepairRequest("1").then(
          (value) {
            if (value) {
              VehicleRepairRequest? repairRequest =
                  ref.read(repairRequestControllerProvider).repairRequest;

              if (repairRequest != null) {
                if (repairRequest.status ==
                    VehicleRepairRequestStatus.WAITING_FOR_MECHANIC) {
                  if (mounted) context.pushNamed(appRoute.trackMechanic.name);
                  return;
                }
                if (mounted) context.pushNamed(appRoute.repairProgress.name);
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
          drawer: Drawer(
            child: UserProfileMenu(),
          ),
          appBar: AppBar(
            elevation: AppHeight.h0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p8),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/no-profile.png'.hardcoded()),
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              Container(
                height: AppHeight.h150,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
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
                        leading: Icon(Icons.search, color: ThemeColor.dark),
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
