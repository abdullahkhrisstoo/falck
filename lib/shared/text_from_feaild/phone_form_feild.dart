import 'package:flutter/material.dart';

import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class WidgetPhoneField extends StatefulWidget {
  final Function(Country)? onCountryChanged;
  final TextEditingController phoneController;
  final String? initialCountryCode;
  final String? Function(dynamic)? validator;

  const WidgetPhoneField(
      {super.key,
      required this.onCountryChanged,
      required this.phoneController,
      this.validator,
      this.initialCountryCode});

  @override
  State<WidgetPhoneField> createState() => _WidgetPhoneFieldState();
}

class _WidgetPhoneFieldState extends State<WidgetPhoneField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onCountryChanged: widget.onCountryChanged,
      controller: widget.phoneController,
      invalidNumberMessage: null,
      validator: widget.validator,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration:
          const InputDecoration(counter: SizedBox(), hintText: 'Phone Number'),
      initialCountryCode: widget.initialCountryCode ?? 'JO'
    );
  }
}
