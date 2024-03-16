import 'package:bato_mechanic/src/shared/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';

class PayBottomSheetWidget extends StatelessWidget {
  const PayBottomSheetWidget({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: AppHeight.h100,
      ),
      child: BottomSheet(
          onClosing: () {},
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.r20),
            topRight: Radius.circular(AppRadius.r20),
          )),
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p12,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: children.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0.doubleHardcoded(),
                    mainAxisSpacing: 20.0.doubleHardcoded(),
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height * 0.12),
                  ),
                  itemBuilder: (context, index) {
                    return children[index];
                  }),
            );
          }),
    );
  }
}
