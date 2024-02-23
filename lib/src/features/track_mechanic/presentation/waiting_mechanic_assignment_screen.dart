import 'package:flutter/material.dart';

class WaitingMechanicAssignmentScreen extends StatelessWidget {
  const WaitingMechanicAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Waiting Mechanic')),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
