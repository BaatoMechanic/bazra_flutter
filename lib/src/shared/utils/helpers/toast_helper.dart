import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/system_alerts_controller.dart';

class ToastHelper {
  static showLoading(BuildContext ctx) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: 'showLoading dismissed',
      context: ctx,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Theme.of(ctx).primaryColor,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Consumer(
                    builder: (context, ref, _) =>
                        (ref.watch(systemAlertProvider).message != null)
                            ? Text(
                                ref
                                    .watch(systemAlertProvider)
                                    .message
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showCenterAlert(BuildContext ctx, String message) {
    showGeneralDialog(
      barrierDismissible: false,
      barrierLabel: 'Center alert dismissed',
      context: ctx,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Close'.hardcoded(),
                  style: Theme.of(ctx)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: ThemeColor.dark),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Theme.of(ctx).primaryColor,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(ctx)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ThemeColor.dark),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showCenterAlertWithListOptions(
      BuildContext ctx, List<Widget> options) {
    showGeneralDialog(
      barrierDismissible: false,
      barrierLabel: 'Center alert dismissed',
      context: ctx,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            backgroundColor: Theme.of(ctx).primaryColor,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Close'.hardcoded(),
                  style: Theme.of(ctx).textTheme.bodyLarge,
                ),
              ),
            ],
            actionsPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: AppPadding.p4, horizontal: AppPadding.p4),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [...options],
            ),
          ),
        );
      },
    );
  }

  static showCenterAlertWithOptions(
    BuildContext ctx,
    List<TextButton> actions, {
    String? message,
  }) {
    showGeneralDialog(
      barrierDismissible: false,
      barrierLabel: 'Center alert dismissed',
      context: ctx,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            backgroundColor: ThemeColor.primary,
            actions: [...actions],
            actionsPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: AppPadding.p4, horizontal: AppPadding.p4),
            content: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message ?? 'Confirm exit the app?',
                    textAlign: TextAlign.center,
                    style: Theme.of(ctx)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: ThemeColor.dark),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showNotification(BuildContext context, String message,
      {notificationDuration = 3}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      key: UniqueKey(),
      backgroundColor: Theme.of(context).primaryColor,
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        message.capitalize(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: ThemeColor.dark),
      ),
      duration: Duration(seconds: notificationDuration),
    ));
  }

  static showNotificationWithCloseButton(BuildContext context, String message,
      {String label = "Close", notificationDuration}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        message.capitalize(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: ThemeColor.dark),

        // ),
      ),
      duration: notificationDuration != null
          ? Duration(seconds: notificationDuration)
          // Making it seem like the durationis infinite
          : Duration(days: 9999999.intHardcoded()),
      action: SnackBarAction(
        label: label,
        textColor: ThemeColor.dark,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  static showNotificationWithLinkButton(
      BuildContext context, String message, APP_ROUTE route,
      {String label = "Go", int? notificationDuration, Object? extraParams}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        message.capitalize(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: ThemeColor.dark),

        // ),
      ),
      duration: notificationDuration != null
          ? Duration(seconds: notificationDuration)
          // Making it seem like the durationis infinite
          : Duration(days: 9999999.intHardcoded()),
      action: SnackBarAction(
        label: label,
        textColor: ThemeColor.dark,
        onPressed: () {
          context.goNamed(route.name, extra: extraParams);
        },
      ),
    ));
  }

  static Future<bool> onWillPopToast(BuildContext context) async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ThemeColor.primary,
          title: Text(
            'Do you want to close the app?',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ThemeColor.dark,
                ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'Yes',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ThemeColor.dark,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'No',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ThemeColor.dark,
                    ),
              ),
            ),
          ],
        );
      },
    );
    if (shouldPop != null) {
      return shouldPop;
    }
    return false;
  }
}
