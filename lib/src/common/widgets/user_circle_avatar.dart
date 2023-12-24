// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/application/auth_service.dart';
import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';
import '../../utils/helpers/user_helper.dart';

class UserCircleAvatar extends ConsumerWidget {
  const UserCircleAvatar({
    Key? key,
    this.radius = AppRadius.r60,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(watchUserStateChangesProvider).value;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r100),
          border: Border.all(
            width: AppWidth.h2,
            color: ThemeColor.primary,
          ),
        ),
        child: user != null && user.profilePic != null
            ? CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(
                  UserHelperFunctions.getProfileImageUrl(
                    user.profilePic as String,
                  ),
                ),
              )
            : CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(
                  'assets/images/no-profile.png'.hardcoded(),
                ),
              ));
  }
}
