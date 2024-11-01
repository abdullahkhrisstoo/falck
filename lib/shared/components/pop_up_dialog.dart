import 'package:flutter/material.dart';
class PopUpDialog extends StatefulWidget {
  final String message;
  final String title;

  const PopUpDialog({super.key, required this.message, required this.title});

  @override
  State createState() => _PopUpDialogState();
}
class _PopUpDialogState extends State<PopUpDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
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
        builder: (BuildContext context, Widget? child) {
          return Opacity(
              opacity: _animation.value,
              child: Transform.scale(
                  scale: _animation.value,
                  child: AlertDialog(
                      title: Text(widget.title),
                      content: Text(widget.message),
                      actions: [
                        TextButton(
                            onPressed: () {
                              _animationController.reverse().then((_) {
                                Navigator.of(context).pop();
                              });
                            },
                            child: const Text('OK'))
                      ])));
        });
  }
}
