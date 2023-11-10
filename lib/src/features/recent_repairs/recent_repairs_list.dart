import 'package:bato_mechanic/src/common_widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/extensions/string_extension.dart';
import 'package:bato_mechanic/src/managers/values_manager.dart';
import 'package:flutter/material.dart';

class RecentRepairsList extends StatelessWidget {
  const RecentRepairsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi there, Krishna'.hardcoded(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppHeight.h8,
              ),
              Text(
                "Let's get your vehicle back on the road".hardcoded(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppHeight.h30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent repairs',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text(
                      "New Order".hardcoded(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              RecentRepairContainerWidget(),
              RecentRepairContainerWidget(),
              RecentRepairContainerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
