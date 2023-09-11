import 'package:ddea_web/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonTemplate extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final double? buttonWidth;
  final double buttonHeight;
  final Function() buttonAction;
  final Color fontColor;
  final double? textSize;
  final double buttonBorderRadius;
  final bool loading;

  const ButtonTemplate({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    this.buttonWidth,
    required this.buttonHeight,
    required this.buttonAction,
    required this.fontColor,
    this.textSize = 15,
    required this.buttonBorderRadius,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading
          ? () {
              debugPrint("Please wait");
            }
          : buttonAction,
      color: buttonColor,
      splashColor: buttonColor,
      elevation: 2,
      minWidth: buttonWidth,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonBorderRadius),
      ),
      padding: const EdgeInsets.all(15),
      child: loading
          ? SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                backgroundColor: AppColors.white,
                strokeWidth: 1,
              ),
            )
          : Text(
              buttonName,
              style: TextStyle(
                color: fontColor,
                fontSize: textSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}
