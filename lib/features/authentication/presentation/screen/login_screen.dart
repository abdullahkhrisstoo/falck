import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:falack_app/features/authentication/presentation/components/or_devider.dart';
import 'package:falack_app/features/authentication/presentation/screen/forget_password_screen.dart';
import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:falack_app/shared/button/social_button_factory.dart';
import 'package:falack_app/shared/button/text_button_factory.dart';
import 'package:falack_app/shared/text_from_feaild/email_or_phone_form_feild.dart';
import 'package:falack_app/shared/text_from_feaild/password_form_feaild.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/core/navigation/navigation.dart';
import 'package:falack_app/features/authentication/presentation/screen/register_screen.dart';
import 'package:falack_app/shared/components/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  void _navigateToRegister() {
    context.navigateTo(const RegisterScreen());
  }

  void _navigateToForgetPassword() {
    context.navigateTo(const ForgetPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: const CustomAppBar(title: ""),
        body: SingleChildScrollView(
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            child: Column(children: [
              Container(
                  color: Colors.amber,
                  height: 152,
                  width: 152,
                  child: SvgAssets.appIcon),
              SizedBox(height: context.w * 0.15),
              EmailOrPhoneFormFeild(_emailController),
              const SizedBox(height: 10),
              PasswordFormField(_passwordController),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButtonWidget(
                    title: 'Forgot Password?',
                    onPressed: _navigateToForgetPassword)
              ]),
              SizedBox(height: context.h * 0.04),
              FilledButtonWidget(title: 'Login', onPressed: _login),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Don't have an account?",
                    style: TextStyle(fontSize: FontsSize.s14)),
                TextButtonWidget(
                    title: 'Register', onPressed: _navigateToRegister)
              ]),
              SizedBox(height: context.bottom + 30)
            ])));
  }

  Widget? _bottomNavigationBar() => Container(
      padding: AppConstant.APP_PADDING_ALIGNMENT,
      height: context.h * 0.16,
      child: Column(children: [
        const OrDeviderWidget(),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(
              child: SocialButtonWidget(
                  title: 'Apple', logo: SvgAssets.apple, onPressed: _login)),
          const SizedBox(width: 10),
          Expanded(
              child: SocialButtonWidget(
                  logo: SvgAssets.google, title: 'Google', onPressed: _login))
        ])
      ]));
}
