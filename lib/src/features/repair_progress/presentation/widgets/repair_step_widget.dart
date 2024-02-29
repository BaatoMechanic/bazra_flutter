import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../domain/repair_step/repair_step.dart';
import 'repair_step_bottom_sheet.dart';

class RepairStepWidget extends StatelessWidget {
  const RepairStepWidget({
    super.key,
    required this.repairRequestIdx,
    required this.step,
  });

  final String repairRequestIdx;

  final RepairStep step;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(step.name),
        subtitle: Text(
            'Status: ${HelperFunctions.humanizeString(step.status.name).capitalize()}'),
        trailing: IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r16),
              ),
              context: context,
              builder: (BuildContext context) {
                return RepairStepBottomSheet(
                  repairRequestIdx: repairRequestIdx,
                  step: step,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
