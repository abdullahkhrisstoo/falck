import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:falack_app/shared/components/radio_button.dart';
import 'package:flutter/material.dart';

class RadioBoxSettingWidget extends StatelessWidget {
  final String title;
  final DynamicRadioButton radioButton;
  const RadioBoxSettingWidget(
      {super.key,
      required this.title,
      required this.radioButton});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: FontsSize.s14,
                  fontWeight: Fonts.semiBold,
                  color: Theme.of(context).colorScheme.onPrimary)),
                  SizedBox(height: 10),
          Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [radioButton])),
          const SizedBox(height: 20)
        ]);
  }
}
