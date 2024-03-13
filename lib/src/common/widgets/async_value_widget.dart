import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:bato_mechanic/src/utils/helpers/utility_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key,
      required this.value,
      required this.data,
      this.loadingShimmer});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  final Widget? loadingShimmer;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(
          child: ErrorMessageWidget(
              e is BaseException ? e.message : e.toString())),
      loading: () => loadingShimmer ?? WidgetUtils.loadingInidicator(context),
    );
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget(
      {super.key,
      required this.value,
      required this.data,
      this.loadingShimmer});
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loadingShimmer;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => SliverToBoxAdapter(
          child: Center(
              child: loadingShimmer ?? const CircularProgressIndicator())),
      error: (e, st) => SliverToBoxAdapter(
        child: Center(child: ErrorMessageWidget(e.toString())),
      ),
    );
  }
}
