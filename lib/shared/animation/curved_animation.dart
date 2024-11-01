import 'package:flutter/material.dart';

class CurvedAnimations extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final Widget child;

  const CurvedAnimations({super.key, 
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
    required this.child,
  });

  @override
  State createState() => _CurvedAnimationsState();
}

class _CurvedAnimationsState extends State<CurvedAnimations>
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
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    );
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
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
// todo
// DynamicCurvedAnimation(
//   duration: Duration(seconds: 2),
//   curve: Curves.easeInOut,
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
// ),
