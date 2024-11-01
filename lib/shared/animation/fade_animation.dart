import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Duration duration;
  final double opacity;
  final Widget child;

  const FadeAnimation({
    super.key,
    this.duration = const Duration(seconds: 2),
    this.opacity = 1.0, required this.child,
  });

  @override
  State createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
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
    _animation = Tween<double>(begin: 0.0, end: widget.opacity)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
// todo : example
//  FadeAnimation(
//                         child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: ImgAssets.emptyNotification,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       )),