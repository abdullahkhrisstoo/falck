import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';

class FilledButtonWidget extends StatelessWidget {
  final String title;
  final Widget? logo;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;

  const FilledButtonWidget(
      {super.key, required this.title, this.logo, this.onTap, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.w;
    final double buttonWidth =
        screenWidth > 600 ? screenWidth * 0.7 : screenWidth * 0.9;
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SizedBox(
            width: buttonWidth,
            height: AppConstant.buttonHeight,
            child: FilledButton(
                onPressed: onPressed,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstant.BUTTON_RADIOS)))),
                child: Text(title,
                    style: TextStyle(
                        fontSize: FontsSize.s16, fontWeight: Fonts.medium)))));
  }
}
