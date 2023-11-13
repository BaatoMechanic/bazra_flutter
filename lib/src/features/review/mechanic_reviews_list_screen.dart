// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/common/widgets/mechanic_review_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';

class MechanicReviewsListScreen extends StatelessWidget {
  const MechanicReviewsListScreen({
    Key? key,
    required this.mechanicId,
  }) : super(key: key);

  final String mechanicId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (_, idx) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: MechanicReviewWidget(),
              );
            }),
      ),
    );
  }
}
