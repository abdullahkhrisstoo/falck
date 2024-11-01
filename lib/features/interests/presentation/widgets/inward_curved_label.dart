import 'package:flutter/material.dart';

import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';

class InwardCurvedLabel extends StatelessWidget {
  final String icon;
  final String title;
  const InwardCurvedLabel(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Expanded(
                  flex: 4,
                  child: ClipPath(
                      clipper: InwardCurveClipper(),
                      child: Container(
                          alignment: Alignment.center,
                          height: context.h * 0.15,
                          color: Theme.of(context).colorScheme.primary,
                          child: Center(
                              child: Text(
                                  textAlign: TextAlign.center,
                                  icon,
                                  style: TextStyle(
                                      fontSize: FontsSize.s80,
                                      fontWeight: FontWeight.bold)))))),
              SizedBox(
                  height: context.h * 0.11,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(13, (index) {
                        return Container(
                            width: 2,
                            height: 8,
                            color: index.isEven
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent);
                      }))),
              Expanded(
                  flex: 7,
                  child: ClipPath(
                      clipper: InwardCurveClipper(),
                      child: Container(
                          alignment: Alignment.center,
                          height: context.h * 0.15,
                          color: Theme.of(context).colorScheme.primary,
                          child: Center(
                              child: Text(title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: FontsSize.s24,
                                      fontWeight: FontWeight.bold))))))
            ])));
  }
}

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveRadius = 20.0;
    Path path = Path()
      ..moveTo(curveRadius, 0)
      ..lineTo(size.width - curveRadius, 0)
      ..arcToPoint(Offset(size.width, curveRadius),
          radius: Radius.circular(curveRadius), clockwise: false)
      ..lineTo(size.width, size.height - curveRadius)
      ..arcToPoint(Offset(size.width - curveRadius, size.height),
          radius: Radius.circular(curveRadius), clockwise: false)
      ..lineTo(curveRadius, size.height)
      ..arcToPoint(Offset(0, size.height - curveRadius),
          radius: Radius.circular(curveRadius), clockwise: false)
      ..lineTo(0, curveRadius)
      ..arcToPoint(Offset(curveRadius, 0),
          radius: Radius.circular(curveRadius), clockwise: false)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
