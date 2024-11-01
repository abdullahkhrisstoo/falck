import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
 


class TextButtonWidget extends StatelessWidget {
     final String title;
   final Widget? logo;
   final VoidCallback? onTap;
   final VoidCallback? onPressed;
  const TextButtonWidget({super.key, required this.title, this.logo, this.onTap, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontWeight: Fonts.regular,
              fontSize: FontsSize.s14,
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppConstant.BUTTON_RADIOS))),
        child: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ));
  }
}