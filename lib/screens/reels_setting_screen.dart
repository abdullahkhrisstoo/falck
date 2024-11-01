import 'package:falack_app/shared/components/radio_box_setting_widget.dart';
import 'package:falack_app/shared/components/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';

class ReelsSettingScreen extends StatefulWidget {
  const ReelsSettingScreen({super.key});

  @override
  State<ReelsSettingScreen> createState() => _ReelsSettingScreenState();
}

class _ReelsSettingScreenState extends State<ReelsSettingScreen> {
  // Define options for each section
  final List<String> options = ['Yes', 'No'];

  // Define selected values for each section
  String selectedRecentlyUploadedReels = 'Yes';
  String selectedRecentlyUploadedBookReels = 'Yes';
  String selectedMostWatchedReels = 'No';
  String selectedOpenedBookReels = 'No';

  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(appBarTitle: 'Reels and book reel', children: [
      const SizedBox(height: 16),

      RadioBoxSettingWidget(
          title: 'Recently uploaded reels',
          radioButton: DynamicRadioButton(
              options: options,
              selectedOption: selectedRecentlyUploadedReels,
              onChanged: (value) {
                setState(() {
                  selectedRecentlyUploadedReels = value!;
                });
              })),

      // Accept follower requests
      RadioBoxSettingWidget(
          title: 'Recently uploaded book reel',
          radioButton: DynamicRadioButton(
              selectedOption: selectedRecentlyUploadedBookReels,
              onChanged: (value) {
                setState(() {
                  selectedRecentlyUploadedBookReels = value!;
                });
              },
              options: options)),

      // Account suggestions
      RadioBoxSettingWidget(
          title: 'Recently uploaded book reel',
          radioButton: DynamicRadioButton(
              options: options,
              selectedOption: selectedMostWatchedReels,
              onChanged: (value) {
                setState(() {
                  selectedMostWatchedReels = value!;
                });
              })),

      RadioBoxSettingWidget(
          title: 'Most opened book reel',
          radioButton: DynamicRadioButton(
              options: options,
              selectedOption: selectedOpenedBookReels,
              onChanged: (value) {
                setState(() {
                  selectedOpenedBookReels = value!;
                });
              }))
    ]);
  }
}
