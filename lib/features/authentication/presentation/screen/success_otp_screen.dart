import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';

class SuccessOtpScreen extends StatefulWidget {
  const SuccessOtpScreen({super.key});

  @override
  State<SuccessOtpScreen> createState() => _SuccessOtpScreenState();
}

class _SuccessOtpScreenState extends State<SuccessOtpScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: AppConstant.APP_PADDING_ALIGNMENT,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Icon(Icons.verified,
                            size: 250,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                        Text('Password updated',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                            "Your password has been updated Successfully \n now you can login",
                            style: Theme.of(context).textTheme.bodyLarge
                            ),
                        const SizedBox(height: 50),
                        FilledButtonWidget( title: 'Login',onPressed: (){} )
                        
                      ])))),
          
        ]));
  }
}
