import 'package:flutter/material.dart';
import 'package:falack_app/core/font/font_size.dart';

class TextFormFieldTheme {
  static InputDecorationTheme darkTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
        hintStyle:
            TextStyle(color: colorScheme.surfaceContainerHigh, fontSize: FontsSize.s16),
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: _border(),
        focusedBorder: _border(color: colorScheme.onPrimary),
        enabledBorder: _border(),
        errorBorder: _border(color: colorScheme.error),
        focusedErrorBorder: _border(color: colorScheme.error),
        labelStyle:
            TextStyle(fontSize: FontsSize.s16, fontWeight: FontWeight.bold),
        errorStyle:
            TextStyle(fontSize: FontsSize.s12, fontWeight: FontWeight.w500));
  }

  static InputDecorationTheme lightTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      hintStyle: TextStyle(
        color: colorScheme.surfaceContainerHigh,
        fontSize: FontsSize.s16,
      ),
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      border: _border(),
      // focusedBorder: _border(color: colorScheme.primary),
      // enabledBorder: _border(),
      errorBorder: _border(color: colorScheme.error),
      focusedErrorBorder: _border(color: colorScheme.error),
      labelStyle: TextStyle(
        fontSize: FontsSize.s16,
        fontWeight: FontWeight.bold,
      ),
      errorStyle: TextStyle(
        fontSize: FontsSize.s12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: color ?? Colors.transparent.withOpacity(0), width: 1));
  }
}
