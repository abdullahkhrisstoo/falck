import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  final Duration duration;
  final double startAngle;
  final double endAngle;
  final Widget child;

  const RotationAnimation({
    super.key,
    this.duration = const Duration(seconds: 2),
    this.startAngle = 0.0,
    this.endAngle = 360.0,
    required this.child,
  });

  @override
  State createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: widget.startAngle,
      end: widget.endAngle,
    ).animate(_animationController);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
// todo:
// DynamicRotationAnimation(
//   duration: Duration(seconds: 2),
  // startAngle: 0.0,
  // endAngle: 360.0,
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
// )
