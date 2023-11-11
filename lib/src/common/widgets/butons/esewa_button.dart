import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EsewaButton extends StatelessWidget {
  const EsewaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThirdPartyColor.esewaColor,
      ),
      onPressed: () {},
      // icon: Text(
      //   'K',
      // ),
      child: Text('Pay with e-Sewa'),
    );
  }
}
