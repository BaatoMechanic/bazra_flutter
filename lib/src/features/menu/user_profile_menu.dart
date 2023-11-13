import 'package:bato_mechanic/src/common/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:bato_mechanic/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/butons/submit_button.dart';
import '../../common/widgets/menu_tile_section_widget.dart';
import '../../common/widgets/menu_tile_widget.dart';
import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';
import '../../utils/helpers/helper_functions.dart';

class UserProfileMenu extends ConsumerWidget {
  UserProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = HelperFunctions.isDarkMode(context);

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
          onPressed: () => context.goNamed(appRoute.supportChat.name),
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
          onPressed: () => context.goNamed(appRoute.supportChat.name),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.warning,
        title: 'Privacy Policy ',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          onPressed: () => context.goNamed(appRoute.supportChat.name),
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
          onPressed: () => context.goNamed(appRoute.supportChat.name),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          ),
        ),
        isLast: true,
      ),
    ];

    List<MenuTile> profileTiles = [
      MenuTile(
        leadingIcon: Icons.settings,
        title: 'Manage data',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () {},
        ),
      ),
      MenuTile(
        leadingIcon: Icons.home,
        title: 'Manage Profile',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () {},
        ),
      ),
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
          onPressed: () => context.goNamed(appRoute.repairProgress.name),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.settings,
        title: 'Recent Repairs',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () => context.goNamed(appRoute.recentRepairs.name),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.settings,
        title: 'Settings',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () {},
        ),
        isLast: true,
      ),
    ];

    List<MenuTile> settingsTiles = [
      MenuTile(
        leadingIcon: Icons.notification_important,
        title: 'Notifications',
        trailingWidget: IconButton(
          iconSize: AppSize.s20,
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: isDarkMode ? ThemeColor.light : ThemeColor.dark,
          onPressed: () {},
        ),
      ),
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
          onPressed: () => context.goNamed(appRoute.feedback.name),
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
          onPressed: () => context.goNamed(appRoute.feedback.name),
        ),
        isLast: true,
      ),
    ];

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
                    CircleAvatar(
                      radius: AppHeight.h30,
                      child: Image.asset(
                        'assets/images/no-profile.png'.hardcoded(),
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppHeight.h30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Krishna Rimal',
                            style: Theme.of(context).textTheme.headlineMedium,
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
                    onPressed: () => context.replaceNamed(appRoute.login.name))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
