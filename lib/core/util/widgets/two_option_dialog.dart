import 'package:MAHR/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import '../resources/constants_manager.dart';
import 'myButton.dart';
import 'myText.dart';

class TwoOptionsDialog extends Dialog {
  final String message;
  final String pushButtonText;
  final String popButtonText;
  final VoidCallback pushButtonVoidCallback;
  final VoidCallback popButtonVoidCallback;
  final double height;

  const TwoOptionsDialog({
    required this.message,
    required this.popButtonText,
    required this.pushButtonText,
    required this.pushButtonVoidCallback,
    required this.popButtonVoidCallback,
    this.height = 160.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myText(
                  title: message, align: TextAlign.center, style: Style.medium),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: myButton(
                      onPressed: popButtonVoidCallback,
                      text: popButtonText,
                      fontSize: 20.rSp,
                    ),
                  ),
                  horizontalSpace(2.h),
                  Expanded(
                    child: myButton(
                      onPressed: pushButtonVoidCallback,
                      text: pushButtonText,
                      fontSize: 20.rSp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
