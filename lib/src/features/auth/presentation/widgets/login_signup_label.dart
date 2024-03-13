import 'dart:io';

import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/managers/color_manager.dart';

class LoginSignUpLabel extends StatelessWidget {
  const LoginSignUpLabel({
    Key? key,
    required this.labelText,
    required this.infoText,
    required this.onPressed,
  }) : super(key: key);
  final String labelText;
  final String infoText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: onPressed,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    infoText,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    labelText,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        : InkWell(
            splashColor: ColorManager.primary,
            onTap: onPressed,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: AppMargin.m12,
              ),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    infoText,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    labelText,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
  }
}
