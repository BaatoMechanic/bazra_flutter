import 'package:bato_mechanic/src/managers/color_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KhaltiButton extends StatelessWidget {
  const KhaltiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.khaltiColor,
      ),
      onPressed: () {},
      // icon: Text(
      //   'K',
      // ),
      child: Text('Pay with Kahlti'),
    );
  }
}
