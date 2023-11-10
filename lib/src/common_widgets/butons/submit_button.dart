// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../managers/color_manager.dart';
import '../../managers/values_manager.dart';

class SubmitButton extends StatefulWidget {
  SubmitButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showSpinner = false,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  bool showSpinner;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.showSpinner
          ? () {
              setState(() {
                widget.showSpinner = !widget.showSpinner;
              });
              Future.delayed(Duration(seconds: 1)).then((_) {
                if (mounted) {
                  setState(() {
                    widget.showSpinner = !widget.showSpinner;
                  });
                }
              });
              widget.onPressed();
            }
          : null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          color: widget.showSpinner ? ColorManager.lightestGrey : null,
          gradient: widget.showSpinner
              ? null
              : LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                      Theme.of(context).primaryColor.withAlpha(200),
                      Theme.of(context).primaryColorDark.withAlpha(200),
                    ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.showSpinner)
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p12),
                child: SizedBox(
                  height: AppHeight.h20,
                  width: AppHeight.h20,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: ColorManager.primary,
                  ),
                ),
              ),
            if (widget.showSpinner)
              // LoadingHelper.showTextLoading('Signing in')
              Row(
                children: [
                  Text('Signing in'.hardcoded()),
                ],
              )
            else
              Text(
                widget.label,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
