import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key, this.onNextPressed, this.onBackPressed});
  final void Function()? onNextPressed;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
              onPressed: onBackPressed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(Icons.arrow_back))),
      Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
              onPressed: onNextPressed,
              icon: const Text('Next'),
              label: const Icon(Icons.arrow_forward_ios_rounded)))
    ]);
  }
}
