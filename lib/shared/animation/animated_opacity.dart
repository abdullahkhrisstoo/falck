import 'package:flutter/material.dart';

class DynamicAnimatedOpacity extends StatefulWidget {
  final Duration duration;
  final double initialOpacity;
  final Widget child;

  const DynamicAnimatedOpacity({super.key, 
    this.duration = const Duration(seconds: 2),
    this.initialOpacity = 1.0,
    required this.child,
  });

  @override
  State createState() => _DynamicAnimatedOpacityState();
}

class _DynamicAnimatedOpacityState extends State<DynamicAnimatedOpacity> {
  double _opacity = 1.0;

  void _setOpacity(double newOpacity) {
    setState(() {
      _opacity = newOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: widget.duration,
      child: GestureDetector(
        onTap: () {
          if (_opacity == 1.0) {
            _setOpacity(0.0);
          } else {
            _setOpacity(1.0);
          }
        },
        child: widget.child,
      ),
    );
  }
}
// todo 
// DynamicAnimatedOpacity(
//   duration: Duration(seconds: 2),
//   initialOpacity: 1.0,
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
// ),
