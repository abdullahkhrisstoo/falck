import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  const TextF(
      {super.key,
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.maxLines,
      this.maxLength,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.onEditingComplete,
      this.suffixIconFunction,
      this.onTap,
      this.datePickerMode,
      this.isPass});
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? suffixIconFunction;
  final String? hintText;
  final CupertinoDatePickerMode? datePickerMode;
  final bool? isPass;

  @override
  Widget build(BuildContext context) {
    if (keyboardType == TextInputType.datetime) {
      return InkWell(
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            enabled: false,
            onTap: () {},
          ),
          onTap: () async {
            DateTime date = DateTime.now();
            final mode = datePickerMode ?? CupertinoDatePickerMode.date;
            await showCupertinoModalPopup<DateTime>(
                context: context,
                builder: (_) {
                  return Container(
                      height: 200,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(children: [
                        SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                                mode: mode,
                                initialDateTime: date,
                                onDateTimeChanged: (v) {
                                  if (controller == null) {
                                    log("WERRING : controller is null for date picker you need to pass controller");
                                  } else {
                                    controller?.text =
                                        v.toString().substring(0, 10);
                                  }
                                }))
                      ]));
                });
          });
    } else {
      return SizedBox(
        height: 60,
        child: TextFormField(
            obscuringCharacter: '⬤',
            obscureText: isPass ?? false,
            keyboardType: keyboardType,
            textInputAction: textInputAction ?? TextInputAction.next,
            validator: validator,
            maxLines: isPass != null ? 1 : maxLines,
            maxLength: maxLength,
            controller: controller,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            onTap: onTap,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
                counterText: '',
                hintText: hintText,
                suffixIcon: IconButton(
                    onPressed: suffixIconFunction,
                    icon: suffixIcon ?? const SizedBox()),
                prefixIcon: prefixIcon)),
      );
    }
  }
}


