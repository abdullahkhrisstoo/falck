import 'package:falack_app/core/navigation/navigation.dart';
import 'package:falack_app/features/authentication/presentation/screen/auth_otp_screen.dart';
import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: AppConstant.APP_PADDING_ALIGNMENT,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: SvgAssets.forgetPassword,
              ),
              Text(
                'Forget Password',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Provide Your Account Email or Phone for Which you wan't to reset your Password!",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              TextF(
                hintText: "Email or Phone number",
                controller: _phoneController,
              ),
              SizedBox(height: context.h * 0.05),
             FilledButtonWidget(
              
                title: 'Send',
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(height: 10),
                Text(
                  'Is this you?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                    'We found an existing account linked to the mobile you just entered',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                ListTile(
                    leading: const CircleAvatar(child: Text('A')),
                    title: const Text('Abdullah'),
                    subtitle: Text(_phoneController.text)),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      context.navigateTo(AuthOtpScreen(isPhone: true, contactInfo: _phoneController.text,));
                    },
                    child: const Text("Yes, It's me")),
                const SizedBox(height: 10),
                TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No, this is not me"))
              ]));
        });
  }
}
