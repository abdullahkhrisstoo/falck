import 'package:flutter/cupertino.dart';

class SlideAnimation extends StatefulWidget {
  final Duration duration;
  final double startPosition;
  final double endPosition;
  final Widget child;

  const SlideAnimation({super.key, 
    this.duration = const Duration(seconds: 2),
    this.startPosition = -200.0,
    this.endPosition = 0.0,
    required this.child,
  });

  @override
  State createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(widget.startPosition, 0.0),
      end: Offset(widget.endPosition, 0.0),
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
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: _animation,
          child: widget.child,
        );
      },
    );
  }
}
// todo: example
// Center(
//             child: SlideAnimation(
              // duration: const Duration(seconds: 3),
              // startPosition: -200.0,
              // endPosition: 0.0,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 color: Colors.blue,
//               ),
//             ),
//           ),