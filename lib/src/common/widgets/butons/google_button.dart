import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
    required this.onPressed,
    required this.labelText,
  }) : super(key: key);
  final Function() onPressed;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle().copyWith(
        padding:
            const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all<Color>(ThemeColor.white),
      ),
      child: Container(
        decoration: const BoxDecoration().copyWith(
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(
              width: 0.9.doubleHardcoded(),
              color: ThemeColor.black,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                'assets/icons/google_logo.svg',
                height: 35,
                width: 35,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                labelText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
