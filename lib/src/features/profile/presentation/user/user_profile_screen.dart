import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/features/menu/presentation/widgets/menu_tile_section_widget.dart';
import 'package:bato_mechanic/src/common/widgets/user_circle_avatar.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/data/remote/fake_remote_auth_repository.dart';
import '../../../menu/presentation/widgets/menu_tile_widget.dart';
import '../../../auth/application/auth_service.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final user = ref.watch(authStateProvider).user;

    List<MenuTile> infoTiles = [
      MenuTile(
        leadingIcon: Icons.email,
        title: 'Email'.hardcoded(),
        trailingWidget: Text(
          user?.email ?? "No Email".hardcoded(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
              ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.phone,
        title: 'Phone',
        trailingWidget: Text(
          user?.phone ?? "No phone".hardcoded(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
              ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.location_on,
        title: 'Location'.hardcoded(),
        trailingWidget: Text(
          'Kathmandu'.hardcoded(),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
              ),
        ),
        isLast: true,
      ),
    ];

    List<MenuTile> utilityTiles = [
      MenuTile(
        leadingIcon: Icons.connect_without_contact,
        title: 'Connect with us'.hardcoded(),
        trailingWidget: IconButton(
          iconSize: FontSize.s20,
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
          ),
          onPressed: () {},
        ),
      ),
      MenuTile(
        leadingIcon: Icons.password,
        title: 'Change password'.hardcoded(),
        trailingWidget: IconButton(
          iconSize: FontSize.s20,
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
          ),
          onPressed: () => context.pushNamed(APP_ROUTE.confirmOldPassword.name),
        ),
        isLast: true,
      ),
      MenuTile(
        leadingIcon: Icons.logout,
        title: 'Logout'.hardcoded(),
        trailingWidget: IconButton(
          iconSize: FontSize.s20,
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
          ),
          onPressed: () {},
        ),
        isLast: true,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              AppHeight.h30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const UserCircleAvatar(
                        // radius: AppRadius.r60,
                        ),
                    Text(
                      // 'Krishna Rimal',
                      user?.name ?? "Unknown User".hardcoded(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Theme.of(context).primaryColor),
                        Text(
                          'Nepalgunj, Banke',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal Information'.hardcoded(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      onPressed: () =>
                          context.pushNamed(APP_ROUTE.editProfile.name),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.edit,
                            size: AppSize.s20,
                            color: ThemeColor.primary,
                          ),
                          const SizedBox(
                            width: AppWidth.h4,
                          ),
                          Text(
                            'Edit'.hardcoded(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ThemeColor.primary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                MenuTilesSection(tiles: infoTiles),
                const SizedBox(height: AppHeight.h50),
                Text(
                  'Utilites'.hardcoded(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                MenuTilesSection(tiles: utilityTiles)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
