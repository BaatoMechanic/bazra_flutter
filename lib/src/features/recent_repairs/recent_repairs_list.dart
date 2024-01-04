import 'package:bato_mechanic/src/common/widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    onPressed: () => context.goNamed(APP_ROUTE.categories.name),
                    icon:
                        Icon(Icons.add, color: Theme.of(context).primaryColor),
                    label: Text(
                      "New Order".hardcoded(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              const RecentRepairContainerWidget(),
              const RecentRepairContainerWidget(),
              const RecentRepairContainerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
