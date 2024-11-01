import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/features/authentication/presentation/components/resend_code_widget.dart';
import 'package:falack_app/shared/components/otp_components.dart';

class AuthOtpScreen extends StatefulWidget {
  final bool isPhone;
  final String contactInfo;

  const AuthOtpScreen({
    super.key,
    required this.isPhone,
    required this.contactInfo,
  });

  @override
  State<AuthOtpScreen> createState() => _AuthOtpScreenState();
}

class _AuthOtpScreenState extends State<AuthOtpScreen> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      widget.isPhone
                          ? 'Enter the OTP sent to your phone: ${widget.contactInfo}'
                          : 'Enter the OTP sent to your email: ${widget.contactInfo}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  SizedBox(height: 250, width: 250, child: SvgAssets.authOtp),
                  DynamicOTPInput(
                      controllers: otpControllers, onChanged: (otp) {}),
                  ResendCodeWidget(resend: () {}),
                 FilledButtonWidget(
                    
                    title: 'Verify OTP',
                    onPressed: (){}
                  ),
                ])));
  }
}
