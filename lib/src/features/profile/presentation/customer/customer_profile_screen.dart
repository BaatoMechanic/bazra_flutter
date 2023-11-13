import 'package:bato_mechanic/src/common/widgets/menu_tile_section_widget.dart';
import 'package:bato_mechanic/src/features/menu/user_profile_menu.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/mechanic_review_widget.dart';
import '../../../../common/widgets/menu_tile_widget.dart';

class CustomerProfileScreen extends StatelessWidget {
  CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    List<MenuTile> infoTiles = [
      MenuTile(
        leadingIcon: Icons.email,
        title: 'Email',
        trailingWidget: Text(
          'mail@bato_mechanic.com',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
              ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.phone,
        title: 'Phone',
        trailingWidget: Text(
          '9863748593',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: isDarkTheme ? ThemeColor.light : ThemeColor.dark,
              ),
        ),
      ),
      MenuTile(
        leadingIcon: Icons.location_on,
        title: 'Locaiont',
        trailingWidget: Text(
          'Kathmandu',
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
        title: 'Connect with us',
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
        leadingIcon: Icons.logout,
        title: 'Logout',
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
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r100),
                          border: Border.all(
                              width: AppWidth.h2, color: ThemeColor.primary)),
                      child: CircleAvatar(
                        radius: AppHeight.h50,
                        backgroundImage: AssetImage(
                          'assets/images/no-profile.png'.hardcoded(),
                        ),
                      ),
                    ),
                    Text(
                      'Krishna Rimal',
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
                          context.pushNamed(appRoute.editProfile.name),
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
                SizedBox(height: AppHeight.h50),
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
