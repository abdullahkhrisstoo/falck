import 'package:flutter/material.dart';

class DynamicAnimatedCrossFade extends StatefulWidget {
  final Duration duration;
  final Widget firstChild;
  final Widget secondChild;
  final bool initiallyVisible;

  const DynamicAnimatedCrossFade({super.key, 
    this.duration = const Duration(seconds: 1),
    required this.firstChild,
    required this.secondChild,
    this.initiallyVisible = false,
  });

  @override
  State createState() => _DynamicAnimatedCrossFadeState();
}

class _DynamicAnimatedCrossFadeState extends State<DynamicAnimatedCrossFade> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.initiallyVisible;
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleVisibility,
      child: AnimatedCrossFade(
        duration: widget.duration,
        firstChild: widget.firstChild,
        secondChild: widget.secondChild,
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}

// DynamicAnimatedCrossFade(
//   duration: Duration(seconds: 1),
//   firstChild: Container(
//     width: 200,
//     height: 200,
//     color: Colors.blue,
//   ),
//   secondChild: Container(
//     width: 200,
//     height: 200,
//     color: Colors.red,
//   ),
//   initiallyVisible: false,
// ),
