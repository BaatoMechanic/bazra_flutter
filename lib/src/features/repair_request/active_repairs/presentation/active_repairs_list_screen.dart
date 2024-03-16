import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/recent_repair_container_widget.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'active_repairs_list_controller.dart';

class ActiveRepairsListScreen extends ConsumerWidget {
  const ActiveRepairsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentRepairsValue = ref.watch(fetchActiveRepairRequestsProvider);
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () =>
              ref.refresh(fetchActiveRepairRequestsProvider.future),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi there, ${ref.watch(authStateNotifierProvider).user?.name}'
                      .hardcoded(),
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
                      'Active repairs',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    TextButton.icon(
                      onPressed: () => context.goNamed(APP_ROUTE.home.name),
                      icon: Icon(Icons.add,
                          color: Theme.of(context).primaryColor),
                      label: Text(
                        "New Order".hardcoded(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Flexible(
                    child: AsyncValueWidget(
                      value: recentRepairsValue,
                      data: (repairRequests) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: repairRequests.length,
                        itemBuilder: (context, index) =>
                            RecentRepairContainerWidget(
                          onPressed: () => context
                              .pushNamed(APP_ROUTE.repairProgress.name, extra: {
                            "repairRequestIdx": repairRequests[index].idx
                          }),
                          repairRequest: repairRequests[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
