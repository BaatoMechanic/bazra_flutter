import 'package:bato_mechanic/src/extensions/string_extension.dart';
import 'package:flutter/material.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // body: EmptyPlaceholderWidget(
        //   message: '404 - Page not found!'.hardcoded,
        // ),
        body: Text(
          '404 - Page not found!'.hardcoded as String,
        ));
  }
}
