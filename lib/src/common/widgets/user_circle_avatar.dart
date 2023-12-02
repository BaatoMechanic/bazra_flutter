// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    Key? key,
    this.radius = AppRadius.r60,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r100),
        border: Border.all(
          width: AppWidth.h2,
          color: ThemeColor.primary,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
          'assets/images/no-profile.png'.hardcoded(),
        ),
      ),
    );
  }
}
