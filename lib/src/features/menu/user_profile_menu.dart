import 'package:bato_mechanic/src/common/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:bato_mechanic/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/butons/submit_button.dart';
import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';
import '../../utils/helpers/helper_functions.dart';

class UserProfileMenu extends StatelessWidget {
  UserProfileMenu({super.key});

  List<ProfileTile> profileTiles = [
    ProfileTile(
      leadingIcon: Icons.settings,
      title: 'Manage data',
      onPressed: (BuildContext context, WidgetRef ref) {},
    ),
    ProfileTile(
      leadingIcon: Icons.home,
      title: 'Manage Profile',
      onPressed: (BuildContext context, WidgetRef ref) {},
    ),
    ProfileTile(
      leadingIcon: Icons.person,
      title: 'Profile',
      onPressed: (BuildContext context, WidgetRef ref) {},
    ),
    ProfileTile(
      leadingIcon: Icons.settings,
      title: 'Settings',
      onPressed: (BuildContext context, WidgetRef ref) {},
    ),
  ];
  List<ProfileTile> settingsTiles = [
    ProfileTile(
      leadingIcon: Icons.notification_important,
      title: 'Notifications',
      onPressed: (BuildContext context, WidgetRef ref) {},
    ),
    ProfileTile(
      leadingIcon: Icons.dark_mode,
      title: 'Dark mode',
      onPressed: (BuildContext ctx, WidgetRef ref) {
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

        ToastHelper.showCenterAlertWithOptions(ctx, [darkTile, lightTile]);
        // final themeMode =
        //     ref.read(userSettingsRepositoryProvider).getThemeMode();
        // if (themeMode == ThemeMode.dark) {
        //   ref
        //       .read(userSettingsRepositoryProvider)
        //       .setThemeMode(ThemeMode.light);
        //   return;
        // }
        // ref.read(userSettingsRepositoryProvider).setThemeMode(ThemeMode.dark);
        // return;
      },
    ),
    ProfileTile(
      leadingIcon: Icons.miscellaneous_services,
      title: 'Misc',
      onPressed: (BuildContext context, WidgetRef ref) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p4, vertical: AppPadding.p45),
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
                ProfileTilesSection(
                    sectionTitle: 'Profile', tiles: profileTiles),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                ProfileTilesSection(
                    sectionTitle: 'Settings', tiles: settingsTiles),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                SubmitButton(label: 'Logout', onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTilesSection extends StatelessWidget {
  ProfileTilesSection({
    Key? key,
    required this.tiles,
    required this.sectionTitle,
  }) : super(key: key);

  String sectionTitle;
  List<ProfileTile> tiles;
  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: const BoxDecoration().copyWith(
        color:
            isDarkTheme ? ThemeColor.darkContainer : ColorManager.primaryTint90,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          ...tiles
        ],
      ),
    );
  }
}

class ProfileTile extends ConsumerWidget {
  ProfileTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward_ios,
    required this.onPressed,
  }) : super(key: key);

  String title;
  IconData leadingIcon;
  IconData trailingIcon;
  Function(BuildContext ctx, WidgetRef ref) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkTheme = HelperFunctions.isDarkMode(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.primaryTint50,
        ),
        child: Icon(leadingIcon),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      trailing: IconButton(
        iconSize: AppSize.s20,
        onPressed: () => onPressed(context, ref),
        icon: Icon(
          Icons.arrow_forward_ios,
          size: AppSize.s14,
          color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
        ),
      ),
    );
  }
}
