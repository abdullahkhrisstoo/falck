import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  final Duration duration;
  final double beginValue;
  final double endValue;
  final Widget child;

  const TweenAnimation({super.key, 
    this.duration = const Duration(seconds: 2),
    required this.beginValue,
    required this.endValue,
    required this.child,
  });

  @override
  State createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
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
      begin: widget.beginValue,
      end: widget.endValue,
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
// todo
// TweenAnimation(
//   duration: const Duration(seconds: 2),
//   beginValue: 0.5,
//   endValue: 1.0,
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
// ),