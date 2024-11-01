import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  final Object tag;
  final Tween<Rect?> Function(Rect?, Rect?)? createRectTween;
  final Widget Function(BuildContext, Animation<double>, HeroFlightDirection, BuildContext, BuildContext)? flightShuttleBuilder;
  final Widget Function(BuildContext, Size, Widget)? placeholderBuilder;
  final bool transitionOnUserGestures;
  final Widget child;

   const HeroAnimation({super.key, 
    required this.tag,
    this.createRectTween,
    this.flightShuttleBuilder,
    this.placeholderBuilder,
    this.transitionOnUserGestures = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      placeholderBuilder: placeholderBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      child: child,
    );
  }
}
// todo
// DynamicHeroAnimation(
//   tag: 'imageHero',
//   createRectTween: (begin, end) => RectTween(begin: begin, end: end),
//   flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
//     return SomeCustomWidget(
//       // Implement your custom shuttle widget here
//     );
//   },
//   placeholderBuilder: (context, size, child) {
//     return SizedBox(
//       width: size.width,
//       height: size.height,
//       child: child,
//     );
//   },
//   transitionOnUserGestures: true,
//   child: Image.asset('assets/images/image.png'),
// ),
