import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WaitingMechanicAssignmentScreen extends StatelessWidget {
  const WaitingMechanicAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Waiting Mechanic')),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
