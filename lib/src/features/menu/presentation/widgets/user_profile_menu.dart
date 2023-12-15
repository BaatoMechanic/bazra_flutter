import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/user_circle_avatar.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:bato_mechanic/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/butons/submit_button.dart';
import 'menu_tile_section_widget.dart';
import 'menu_tile_widget.dart';
import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../core/application/user_service.dart';

class UserProfileMenu extends ConsumerWidget {
  UserProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = HelperFunctions.isDarkMode(context);

    List<MenuTile> profileTiles = [
      MenuTile(
        leadingIcon: Icons.person,
        title: 'Profile',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () => context.pushNamed(appRoute.customerProfile.name),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.settings,
        title: 'Active Repair',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () => context.pushNamed(appRoute.repairProgress.name),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.settings,
        title: 'Recent Repairs',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () => context.pushNamed(appRoute.recentRepairs.name),
        ),
      ),
    ];

    List<MenuTile> settingsTiles = [
      MenuTile(
        leadingIcon: Icons.dark_mode,
        title: 'Dark mode',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () {
            final darkTile = ListTile(
                title: Text(
                  'Dark mode',
                  style: const TextStyle().copyWith(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  ref
                      .read(userSettingsRepositoryProvider)
                      .setThemeMode(ThemeMode.dark);
                  return;
                });

            final lightTile = ListTile(
                title: Text(
                  'Light mode',
                  style: const TextStyle().copyWith(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  ref
                      .read(userSettingsRepositoryProvider)
                      .setThemeMode(ThemeMode.light);
                  return;
                });

            final systemTile = ListTile(
                title: Text(
                  'System',
                  style: const TextStyle().copyWith(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  ref
                      .read(userSettingsRepositoryProvider)
                      .setThemeMode(ThemeMode.system);
                  return;
                });

            ToastHelper.showCenterAlertWithListOptions(
                context, [darkTile, lightTile, systemTile]);
          },
        ),
      ),
      MenuTile(
        leadingIcon: Icons.miscellaneous_services,
        title: 'Misc',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () {},
        ),
        isLast: true,
      )
    ];

    final List<MenuTile> moreTiles = [
      MenuTile(
        leadingIcon: Icons.notifications,
        title: 'Notifications',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.warning,
        title: 'About',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          onPressed: () => context.pushNamed(appRoute.supportChat.name),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.warning,
        title: 'Report an issue',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          onPressed: () => context.pushNamed(appRoute.feedback.name),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.policy,
        title: 'Privacy Policy ',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          onPressed: () => context.pushNamed(appRoute.supportChat.name),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.key,
        title: 'Terms and Conditions',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          onPressed: () => context.pushNamed(appRoute.supportChat.name),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
        isLast: true,
      ),
    ];

    List<MenuTile> connectTiles = [
      MenuTile(
        leadingIcon: Icons.feedback,
        title: 'Feedback',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
          onPressed: () => context.pushNamed(appRoute.feedback.name),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.wechat,
        title: 'Chat Support',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () => context.pushNamed(appRoute.supportChat.name),
        ),
        isLast: true,
      ),
    ];

    final user = ref.watch(watchUserStateChangesProvider).value;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const UserCircleAvatar(
                      radius: AppRadius.r50,
                    ),
                    const SizedBox(
                      width: AppHeight.h30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? "Unknown user",
                            style: Theme.of(context).textTheme.headlineMedium,
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: AppHeight.h12,
                          ),
                          Text(
                            'Joined',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: ColorManager.primaryTint10),
                          ),
                          Text(
                            '1 year ago',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                MenuTilesSection(sectionTitle: 'Profile', tiles: profileTiles),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                MenuTilesSection(
                    sectionTitle: 'Settings', tiles: settingsTiles),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                MenuTilesSection(sectionTitle: 'More', tiles: moreTiles),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                MenuTilesSection(sectionTitle: 'Connect', tiles: connectTiles),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                SubmitButton(
                    label: 'Logout',
                    onPressed: () {
                      final result = ref.read(authServiceProvider).logOut();
                      if (result) {
                        context.goNamed(appRoute.login.name);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
