import 'package:flutter/material.dart';

Widget LoadingInidicator(BuildContext context, {double? radius}) {
  return Center(
      child: SizedBox(
    height: radius,
    width: radius,
    child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ),
  ));
}
