import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void navigateTo(Widget page,
      {Duration duration = const Duration(milliseconds: 300)}) {
    Navigator.push(
        this,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
            transitionDuration: duration));
  }

  void navigateToReplacement(Widget page,
      {Duration duration = const Duration(milliseconds: 300)}) {
    Navigator.pushReplacement(
        this,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
            transitionDuration: duration));
  }

  void navigateToAndRemoveUntil(Widget page,
      {Duration duration = const Duration(milliseconds: 300)}) {
    Navigator.pushAndRemoveUntil(
        this,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
            transitionDuration: duration),
        (Route<dynamic> route) => false);
  }

  void pop() {
    Navigator.pop(this);
  }
}
