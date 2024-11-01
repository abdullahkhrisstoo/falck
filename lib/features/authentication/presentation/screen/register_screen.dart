import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/authentication/presentation/components/or_devider.dart';
import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:falack_app/shared/button/social_button_factory.dart';
import 'package:falack_app/shared/button/text_button_factory.dart';
import 'package:falack_app/shared/text_from_feaild/email_or_phone_form_feild.dart';
import 'package:falack_app/shared/text_from_feaild/fullname_form_feaild.dart';
import 'package:falack_app/shared/text_from_feaild/password_form_feaild.dart';
import 'package:falack_app/shared/text_from_feaild/username_form_feaild.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/shared/components/app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisibility = false;

  bool toggleVisibility() {
    setState(() {
      isVisibility = !isVisibility;
    });
    return isVisibility;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  void _navigateToRegister() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            height: context.h * 0.16,
            child: Column(children: [
              const OrDeviderWidget(),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: SocialButtonWidget(
                        logo: SvgAssets.google,
                        title: 'Google',
                        onPressed: _register)),
                const SizedBox(width: 10),
                Expanded(
                    child: SocialButtonWidget(
                        title: 'Yandex',
                        logo: SvgAssets.yandex,
                        onPressed: _register))
              ])
            ])),
        appBar: const CustomAppBar(title: ""),
        body: SingleChildScrollView(
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            child: Column(children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    color: Colors.amber,
                    height: 152,
                    width: 152,
                    child: SvgAssets.appIcon),
                SizedBox(height: context.w * 0.15),
                EmailOrPhoneFormFeild(_emailController),
                const SizedBox(height: 10),
                FullnameFormFeaild(_fullNameController),
                const SizedBox(height: 10),
                UsernameFormFeaild(_userNameController),
                const SizedBox(height: 10),
                PasswordFormField(_passwordController),
                SizedBox(height: context.h * 0.04),
                const FilledButtonWidget(title: 'Register'),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Do you have an account?",
                      style: TextStyle(fontSize: FontsSize.s14)),
                  TextButtonWidget(
                      title: 'Login', onPressed: _navigateToRegister)
                ]),
                const SizedBox(height: 10)
              ])
            ])));
  }
}
