import 'package:flutter/material.dart';

class DynamicAnimatedContainer extends StatefulWidget {
  final Duration duration;
  final Color color;
  final double width;
  final double height;

  const DynamicAnimatedContainer({super.key, 
    this.duration = const Duration(seconds: 2),
    this.color = Colors.blue,
    this.width = 200,
    this.height = 200,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DynamicAnimatedContainerState createState() =>
      _DynamicAnimatedContainerState();
}

class _DynamicAnimatedContainerState extends State<DynamicAnimatedContainer> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedContainer(
        duration: widget.duration,
        color: widget.color,
        width: _isExpanded ? widget.width * 2 : widget.width,
        height: _isExpanded ? widget.height * 2 : widget.height,
      ),
    );
  }
}
//   todo
// DynamicAnimatedContainer(
//   duration: Duration(seconds: 2),
//   color: Colors.blue,
//   width: 200,
//   height: 200,
// ),
