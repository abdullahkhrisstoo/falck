import 'package:flutter/material.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/authentication/presentation/components/bottom_naviagtion_widget.dart';
import 'package:falack_app/features/authentication/presentation/components/terms_rich_text.dart';

class AcceptTermsConditionScreen extends StatefulWidget {
  const AcceptTermsConditionScreen({super.key});

  @override
  State<AcceptTermsConditionScreen> createState() =>
      _AcceptTermsConditionScreenState();
}

class _AcceptTermsConditionScreenState
    extends State<AcceptTermsConditionScreen> {
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: AppConstant.APP_PADDING_ALIGNMENT,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: SvgAssets.termsAndConditionRegister,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Accept ${AppConstant.APP_NAME} Terms & Review Privacy Notice",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TermsRichTextComponents(
                    privacyNoticeMethod: () {},
                    termsOfUseMethod: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: AppConstant.APP_PADDING_ALIGNMENT,
            child: Column(
              children: [
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("I Agree",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    Checkbox(
                      value: _isAgree,
                      onChanged: (value) {
                        setState(() {
                          _isAgree = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                BottomNavigationWidget(
                  onBackPressed: () {},
                  onNextPressed: _isAgree
                      ? () {
                          // Proceed to the next step
                        }
                      : null, // Disable the button if not agreed
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.bottom + 20,
          )
        ],
      ),
    );
  }
}
