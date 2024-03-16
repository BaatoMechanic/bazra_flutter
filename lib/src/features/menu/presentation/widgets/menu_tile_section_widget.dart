import 'package:bato_mechanic/src/shared/utils/extensions/build_context_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/constants/managers/color_manager.dart';
import '../../../../shared/utils/constants/managers/values_manager.dart';
import 'menu_tile_widget.dart';

class MenuTilesSection extends StatelessWidget {
  const MenuTilesSection({
    Key? key,
    required this.tiles,
    this.sectionTitle,
  }) : super(key: key);

  final String? sectionTitle;
  final List<MenuTile> tiles;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: const BoxDecoration().copyWith(
        color: context.isDarkMode
            ? ThemeColor.darkContainer
            : ColorManager.primaryTint90,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sectionTitle != null)
            Text(
              sectionTitle ?? "".hardcoded(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ...tiles
        ],
      ),
    );
  }
}
