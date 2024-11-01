import 'package:flutter/material.dart';

class DynamicFlipAnimation extends StatefulWidget {
  final Widget front;
  final Widget back;
  final Duration duration;

  const DynamicFlipAnimation({super.key, 
    required this.front,
    required this.back,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
   createState() => _DynamicFlipAnimationState();
}

class _DynamicFlipAnimationState extends State<DynamicFlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isFrontVisible = true;
  double _dragStartX = 0.0;
  double _rotationValue = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFrontVisible = !_isFrontVisible;
        });
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_animationController.status == AnimationStatus.completed ||
        _animationController.status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  void _onPanStart(DragStartDetails details) {
    _dragStartX = details.localPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final dx = details.localPosition.dx;
    final dragDistance = dx - _dragStartX;
    final screenWidth = context.size?.width ?? 0;

    setState(() {
      _rotationValue = dragDistance / screenWidth;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_rotationValue.abs() > 0.5) {
      setState(() {
        _isFrontVisible = !_isFrontVisible;
        _rotationValue = _isFrontVisible ? 0.0 : 1.0;
      });
    } else {
      setState(() {
        _rotationValue = _isFrontVisible ? 0.0 : 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnimation,
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {

          final frontRotationY = _isFrontVisible ? 0.0 : 1.0;
          final backRotationY = _isFrontVisible ? 1.0 : 0.0;

          final rotationY = _rotationValue * (backRotationY - frontRotationY);

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003)
              ..rotateY(frontRotationY + rotationY),
            child: Stack(
              children: [
                Opacity(
                  opacity: _isFrontVisible ? 1.0 : 0.0,
                  child: widget.front,
                ),
                Opacity(
                  opacity: _isFrontVisible ? 0.0 : 1.0,
                  child: widget.back,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// todo
// DynamicFlipAnimation(
//             front: Container(
//               width: 200,
//               height: 200,
//               color: Colors.blue,
//               child: Center(child: Text('Front')),
//             ),
//             back: Container(
//               width: 200,
//               height: 200,
//               color: Colors.red,
//               child: Center(child: Text('Back')),
//             ),
//             duration: Duration(seconds: 1),
//           ),
//         ),
//       ),