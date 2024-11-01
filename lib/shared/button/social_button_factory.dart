import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final String title;
  final Widget? logo;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  const SocialButtonWidget(
      {super.key, required this.title, this.logo, this.onTap, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: InkWell(
            onTap: onTap,
            child: Container(
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(maxWidth: double.infinity),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstant.BUTTON_RADIOS),
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (logo != null)
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                SizedBox(width: 30, height: 40, child: logo)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)))
                    ]))));
  }
}
