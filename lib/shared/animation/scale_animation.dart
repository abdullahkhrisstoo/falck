import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Duration duration;
  final double startScale;
  final double endScale;
  final Widget child;

  const ScaleAnimation({super.key, 
    this.duration = const Duration(seconds: 2),
    this.startScale = 0.0,
    this.endScale = 1.0,
    required this.child,
  });

  @override
  State createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
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
      begin: widget.startScale,
      end: widget.endScale,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
// todo : example
// DynamicScaleAnimation(
//   duration: Duration(seconds: 1),
//   startScale: 0.5,
//   endScale: 1.0,
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
// )
