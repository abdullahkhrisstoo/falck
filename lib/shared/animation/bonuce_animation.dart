import 'package:flutter/material.dart';

class DynamicBounceAnimation extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const DynamicBounceAnimation({super.key, 
    this.duration = const Duration(seconds: 1),
    required this.child,
  });

  @override
  State createState() => _DynamicBounceAnimationState();
}

class _DynamicBounceAnimationState extends State<DynamicBounceAnimation>
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
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    ));
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
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 - _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
// todo
// DynamicBounceAnimation(
//   duration: Duration(seconds: 1),
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
// ),
