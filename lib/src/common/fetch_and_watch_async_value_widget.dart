import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/error_message_widget.dart';

class FetchAndWatchAsyncValueWidget<T> extends StatelessWidget {
  const FetchAndWatchAsyncValueWidget(
      {super.key,
      required this.fetchValue,
      required this.watchValue,
      required this.data,
      this.loadingShimmer});
  final AsyncValue<T> fetchValue;
  final AsyncValue<T> watchValue;
  final Widget Function(T) data;

  final Widget? loadingShimmer;

  @override
  Widget build(BuildContext context) {
    if (fetchValue.isLoading) {
      return loadingShimmer ?? HelperFunctions.loadingInidicator(context);
    }
    return watchValue.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () =>
          loadingShimmer ?? HelperFunctions.loadingInidicator(context),
    );
  }
}
