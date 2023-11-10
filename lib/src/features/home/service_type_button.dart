// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/home/tips_carousel.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/extensions/string_extension.dart';

import '../../managers/color_manager.dart';
import '../../managers/values_manager.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primaryOpacity70,
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: AppHeight.h4,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
