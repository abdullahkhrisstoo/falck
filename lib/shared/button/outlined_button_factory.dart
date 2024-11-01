import 'package:flutter/material.dart';
import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';


class OutlinedButtonWidget extends StatelessWidget {
    final String title;
   final Widget? logo;
   final VoidCallback? onTap;
  final  VoidCallback? onPressed;

  const OutlinedButtonWidget({super.key, required this.title, this.logo, this.onTap, this.onPressed});


  @override
  Widget build(BuildContext context) {
     final screenWidth = context.w;
    final buttonWidth = screenWidth > 600 ? screenWidth * 0.7 : screenWidth * 0.9;
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SizedBox(
            width: buttonWidth,
            height: AppConstant.buttonHeight,
            child: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstant.BUTTON_RADIOS)),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0)),
                child:
                    Text(title, style: TextStyle(fontSize: FontsSize.s16)))));
  }
}