import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/butons/submit_button.dart';
import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';

class UserProfileMenu extends StatelessWidget {
  UserProfileMenu({super.key});

  List<ProfileTile> profileTiles = [
    ProfileTile(
      leadingIcon: Icons.settings,
      title: 'Manage data',
      onPressed: () {},
    ),
    ProfileTile(
      leadingIcon: Icons.home,
      title: 'Manage Profile',
      onPressed: () {},
    ),
    ProfileTile(
      leadingIcon: Icons.person,
      title: 'Profile',
      onPressed: () {},
    ),
    ProfileTile(
      leadingIcon: Icons.settings,
      title: 'Settings',
      onPressed: () {},
    ),
  ];
  List<ProfileTile> settingsTiles = [
    ProfileTile(
      leadingIcon: Icons.notification_important,
      title: 'Notifications',
      onPressed: () {},
    ),
    ProfileTile(
      leadingIcon: Icons.dark_mode,
      title: 'Dark mode',
      onPressed: () {},
    ),
    ProfileTile(
      leadingIcon: Icons.miscellaneous_services,
      title: 'Misc',
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p45),
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
                          SizedBox(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ...tiles
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
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
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
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
        onPressed: () {},
        icon: Container(
          padding: EdgeInsets.all(AppPadding.p2),
          decoration: BoxDecoration(
            color: ColorManager.primaryTint80,
            borderRadius: BorderRadius.circular(5.0.doubleHardcoded()),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
