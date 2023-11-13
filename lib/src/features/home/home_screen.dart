import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/common/widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/home/tips_carousel.dart';
import 'package:bato_mechanic/src/features/menu/user_profile_menu.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';

import 'service_buttons_grid.dart';
import 'service_type_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _searchTextController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: () async {
      //   bool result = false;
      //   List<TextButton> options = [
      //     TextButton(
      //       onPressed: () {
      //         result = true;
      //       },
      //       child: Text(
      //         'Confirm',
      //         style: Theme.of(context)
      //             .textTheme
      //             .headlineSmall!
      //             .copyWith(color: ThemeColor.dark),
      //       ),
      //     ),
      //     TextButton(
      //       onPressed: () {
      //         result = false;
      //       },
      //       child: Text(
      //         'Cancel',
      //         style: Theme.of(context)
      //             .textTheme
      //             .headlineSmall!
      //             .copyWith(color: ThemeColor.dark),
      //       ),
      //     ),
      //   ];
      //   await ToastHelper.showCenterAlertWithOptions(context, options);
      //   return result;
      // },
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
        return shouldPop!;
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
