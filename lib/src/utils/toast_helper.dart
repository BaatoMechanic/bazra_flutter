import 'package:bato_mechanic/src/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'system_alerts_controller.dart';

class ToastHelper {
  // static showLoading(BuildContext ctx) {
  //   showGeneralDialog(
  //     barrierDismissible: true,
  //     barrierLabel: 'showLoading dismissed',
  //     context: ctx,
  //     pageBuilder: (ctx, a1, a2) {
  //       return Container();
  //     },
  //     transitionBuilder: (ctx, a1, a2, child) {
  //       var curve = Curves.easeInOut.transform(a1.value);
  //       return Transform.scale(
  //         scale: curve,
  //         child: AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15.0),
  //           ),
  //           backgroundColor: Colors.amberAccent[200],
  //           // contentPadding: EdgeInsets.symmetric(
  //           //   horizontal: 0,
  //           //   vertical: 15,
  //           // ),
  //           contentPadding: EdgeInsets.zero,
  //           content: SizedBox(
  //             // width: 10,
  //             height: 150,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 const CircularProgressIndicator(
  //                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 // if (Provider.of<SystemProvider>(ctx).loadingMessage != null)
  //                 //   Text(
  //                 //     Provider.of<SystemProvider>(ctx)
  //                 //         .loadingMessage
  //                 //         .toString(),
  //                 //     textAlign: TextAlign.center,
  //                 //     style: const TextStyle(
  //                 //       // color: Colors.white,
  //                 //       fontWeight: FontWeight.bold,
  //                 //     ),
  //                 //   ),
  //                 //   Text(
  //                 //     Provider.of<SystemProvider>(ctx)
  //                 //         .loadingMessage
  //                 //         .toString(),
  //                 //     textAlign: TextAlign.center,
  //                 //     style: const TextStyle(
  //                 //       // color: Colors.white,
  //                 //       fontWeight: FontWeight.bold,
  //                 //     ),
  //                 //   ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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
            backgroundColor: Colors.amberAccent[200],
            // contentPadding: EdgeInsets.symmetric(
            //   horizontal: 0,
            //   vertical: 15,
            // ),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              // width: 10,
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
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(),
                  ),
                  // Text(
                  //   state.value.toString(),
                  //   // Provider.of<SystemProvider>(ctx)
                  //   //     .loadingMessage
                  //   //     .toString(),
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(
                  //     // color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
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
                  style: Theme.of(ctx).textTheme.bodyLarge,
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.amberAccent[200],
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.amberAccent[700],
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        message.capitalize(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      duration: Duration(seconds: notificationDuration),
    ));
  }

  static showNotificationWithCloseButton(BuildContext context, String message,
      {String label = "Close", notificationDuration}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.amberAccent[700],
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        message.capitalize(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      duration: notificationDuration != null
          ? Duration(seconds: notificationDuration)
          // Making it seem like the durationis infinite
          : Duration(days: 9999999.intHardcoded()),
      action: SnackBarAction(
        label: label,
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }
}
