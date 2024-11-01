import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicOTPInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final void Function(String) onChanged;

  const DynamicOTPInput({
    super.key,
    required this.controllers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(controllers.length, (index) {
      return Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: const InputDecoration(counter: SizedBox.shrink()),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < controllers.length - 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }

                    String otp = '';
                    for (var controller in controllers) {
                      otp += controller.text;
                    }

                    onChanged(otp);
                  })));
    }));
  }
}
// todo : exapmle
