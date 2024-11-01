
import 'package:falack_app/shared/components/radio_box_setting_widget.dart';
import 'package:falack_app/shared/components/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';

class FollowSettingsScreen extends StatefulWidget {
  const FollowSettingsScreen({super.key});

  @override
  State<FollowSettingsScreen> createState() => _FollowSettingsScreenState();
}

class _FollowSettingsScreenState extends State<FollowSettingsScreen> {
  // Define options for each section
  final List<String> options = ['Yes', 'No'];

  // Define selected values for each section
  String selectedFollowerRequests = 'Yes';
  String selectedAcceptFollowerRequests = 'Yes';
  String selectedAccountSuggestions = 'No';

  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(
        appBarTitle: 'Following & followers',
        children: [
          const SizedBox(height: 16),

          RadioBoxSettingWidget(
              title: 'Follower requests',
              radioButton: DynamicRadioButton(
                  options: options,
                  selectedOption: selectedFollowerRequests,
                  onChanged: (value) {
                    setState(() {
                      selectedFollowerRequests = value!;
                    });
                  })),

          const SizedBox(height: 16),

          // Accept follower requests
          RadioBoxSettingWidget(
              title: 'Accept follower requests',
              radioButton: DynamicRadioButton(
                  selectedOption: selectedAcceptFollowerRequests,
                  onChanged: (value) {
                    setState(() {
                      selectedAcceptFollowerRequests = value!;
                    });
                  },
                  options: options)),

          const SizedBox(height: 16),

          // Account suggestions
          RadioBoxSettingWidget(
              title: 'Account suggestions',
              radioButton: DynamicRadioButton(
                  options: options,
                  selectedOption: selectedAccountSuggestions,
                  onChanged: (value) {
                    setState(() {
                      selectedAccountSuggestions = value!;
                    });
                  }))
        ]);
  }



}
