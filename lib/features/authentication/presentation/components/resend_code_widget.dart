import 'package:falack_app/shared/button/outlined_button_factory.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class ResendCodeWidget extends StatefulWidget {
  final Function()? resend;

  const ResendCodeWidget({super.key, required this.resend});

  @override
   createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  late Timer _timer;
  int _remainingSeconds = 60;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _isButtonEnabled = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _isButtonEnabled = true;
          _timer.cancel();
        }
      });
    });
  }

  void _resendCode() {
    if (widget.resend != null) {
      widget.resend!();
    }
    setState(() {
      _remainingSeconds = 60;
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          _isButtonEnabled
              ? 'You can resend the code now.'
              : 'Resend code in $_remainingSeconds seconds',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
       OutlinedButtonWidget(
            
            title: 'Resend Code',
            onPressed: _isButtonEnabled ? _resendCode : null)
      ],
    );
  }
}
