import 'package:flutter/material.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/core/utils/constant/app_constant.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/authentication/presentation/components/bottom_naviagtion_widget.dart';
import 'package:falack_app/shared/components/custom_drop_down_button.dart';
import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';

class EarnWithWaslineScreen extends StatefulWidget {
  const EarnWithWaslineScreen({super.key});

  @override
  State<EarnWithWaslineScreen> createState() => _EarnWithWaslineScreenState();
}

class _EarnWithWaslineScreenState extends State<EarnWithWaslineScreen> {
  String? _selectedCity;

  final List<String> _cities = [
    'City 1',
    'City 2',
    'City 3',
    'City 4',
    'City 5',
    'City 6',
    'City 7',
    'City 8',
    'City 9',
    'City 10'
  ];

  final TextEditingController _referralCodeController = TextEditingController();
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
                            Row(children: [
                              SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: SvgAssets.money),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                      "Earn With ${AppConstant.APP_NAME}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium))
                            ]),
                            const SizedBox(height: 30),
                            Text('Decide when, where, and how you want to earn',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                            CustomDropDownComponent(
                                dropDownList: _cities,
                                hint: 'Select a city',
                                label: 'Where would you like to earn?',
                                selectedItem: _selectedCity,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCity = newValue;
                                  });
                                }),
                            const SizedBox(height: 30),
                            Text("Referral code",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            TextF(
                                maxLength: 10,
                                hintText: 'optional',
                                controller: _referralCodeController),
                            const SizedBox(height: 10),
                            const Text(
                                'By proceeding, I agree that ${AppConstant.APP_NAME} or its representatives may contact me by email, phone, or SMS (including by automatic telephone dialing system) at the email address or number I provide, including for marketing purposes.')
                          ]))),
              Padding(
                  padding: AppConstant.APP_PADDING_ALIGNMENT,
                  child: Column(children: [
                    BottomNavigationWidget(
                        onBackPressed: () {}, onNextPressed: () {})
                  ])),
              SizedBox(height: context.bottom + 20)
            ]));
  }
}
