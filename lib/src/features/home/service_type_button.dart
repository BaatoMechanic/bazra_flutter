// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/home/tips_carousel.dart';
import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';

class ServiceTypeButton extends StatelessWidget {
  const ServiceTypeButton({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  final Widget icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeColor.primary,
            borderRadius: BorderRadius.circular(DefaultManager.cardRadiusXs),
          ),
          child: IconButton(
            onPressed: () {},
            icon: icon,
          ),
        ),
        const SizedBox(
          height: AppHeight.h4,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
