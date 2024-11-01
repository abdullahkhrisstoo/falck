import 'package:flutter/material.dart';
import 'package:falack_app/shared/components/pop_up_dialog.dart';

class Msg {
  // todo : Snackbar error
  static errorSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      content: Text(text,
          style: TextStyle(
              // fontSize: FontsSize.s16,
              color: Theme.of(context).colorScheme.onError)),
      backgroundColor: Theme.of(context).colorScheme.error,
    ));
  }

  // todo: Snackbar success
  static sucessSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      content: Text(text,
          style: TextStyle(
              // fontSize: FontsSize.s16,
              color: Theme.of(context).colorScheme.inverseSurface)),
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
    ));
  }

  // todo: popUp Error
  static errorPopUp({required BuildContext context, required String message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopUpDialog(message: message, title: 'Error');
        });
  } // todo: popUp Error

  // todo: popUp success
  static sucessPopUp({required BuildContext context, required String message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopUpDialog(message: message, title: 'success');
        });
  }
}



