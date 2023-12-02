import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';
import '../../utils/helpers/helper_functions.dart';

class MenuTile extends ConsumerWidget {
  MenuTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.trailingWidget,
    this.isLast = false,
  }) : super(key: key);

  String title;
  IconData leadingIcon;
  Widget? trailingWidget;
  bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkTheme = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                    width: 1.0.doubleHardcoded(),
                    color: Theme.of(context).scaffoldBackgroundColor)),
      ),
      child: ListTile(
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
          trailing: trailingWidget),
    );
  }
}
