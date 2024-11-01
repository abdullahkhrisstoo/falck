import 'package:falack_app/shared/components/radio_box_setting_widget.dart';
import 'package:falack_app/shared/components/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';

class BirthdaySettingsScreen extends StatefulWidget {
  const BirthdaySettingsScreen({super.key});

  @override
  State<BirthdaySettingsScreen> createState() => _BirthdaySettingsScreenState();
}

class _BirthdaySettingsScreenState extends State<BirthdaySettingsScreen> {
  final List<String> options = ['Yes', 'No'];

  String selectedBirthdayNotify = 'Yes';
  

  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(appBarTitle: 'Birthday', children: [
      const SizedBox(height: 16),

      RadioBoxSettingWidget(
          title: 'We will notify for people who choose to tell',
          radioButton: DynamicRadioButton(
              options: options,
              selectedOption: selectedBirthdayNotify,
              onChanged: (value) {
                setState(() {
                  selectedBirthdayNotify = value!;
                });
              })),


    ]);
  }
}
