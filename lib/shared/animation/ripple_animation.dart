import 'package:flutter/material.dart';

class DynamicRippleAnimation extends StatefulWidget {
  final Duration duration;
  final double maxSize;
  final Color rippleColor;
  final Widget child;

  const DynamicRippleAnimation({super.key, 
    this.duration = const Duration(seconds: 1),
    this.maxSize = 200.0,
    this.rippleColor = Colors.blue,
    required this.child,
  });

  @override
   createState() => _DynamicRippleAnimationState();
}

class _DynamicRippleAnimationState extends State<DynamicRippleAnimation>
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
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startRippleAnimation(Offset position) {
    _animationController.reset();
    _animationController.forward();

    setState(() {
      _animation = Tween<double>(
        begin: 0.0,
        end: widget.maxSize,
      ).animate(_animationController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        startRippleAnimation(details.localPosition);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: RipplePainter(
              position: _animation.value,
              maxSize: widget.maxSize,
              rippleColor: widget.rippleColor,
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  final double position;
  final double maxSize;
  final Color rippleColor;

  RipplePainter({
    required this.position,
    required this.maxSize,
    required this.rippleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = position * 0.5 * maxSize;
    final paint = Paint()..color = rippleColor.withOpacity(0.5);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return position != oldDelegate.position;
  }
}


// todo
// DynamicRippleAnimation(
//   duration: Duration(milliseconds: 500),
//   maxSize: 200.0,
//   rippleColor: Colors.blue,
//   child: Container(
//     width: 200,
//     height: 200,
//     color: Colors.transparent,
//     child: Center(
//       child: Text('Tap me'),
//     ),
//   ),
// ),
