import 'package:bato_mechanic/src/common/widgets/butons/khalti_button.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PayBottomSheetWidget extends StatelessWidget {
  PayBottomSheetWidget({super.key, required this.children});
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: AppHeight.h100, // Set the minimum height here
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
