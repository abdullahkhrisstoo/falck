import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordFormField(this.controller, {super.key});

  @override
  createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isVisible = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextF(
        hintText: "Password",
        controller: widget.controller,
        isPass: !isVisible,
        suffixIcon: IconButton(
            onPressed: toggleVisibility,
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off)));
  }
}
