import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';
import 'package:flutter/material.dart';

class AccountPrivacySettingsScreen extends StatefulWidget {
  const AccountPrivacySettingsScreen({super.key});

  @override
  State<AccountPrivacySettingsScreen> createState() =>
      _AccountPrivacySettingsScreenState();
}

class _AccountPrivacySettingsScreenState
    extends State<AccountPrivacySettingsScreen> {
  bool isPrivateAccount = false;
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(appBarTitle: 'Account Privacy', children: [
      const SizedBox(height: 16),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SwitchListTile(
            title: Text('Private account',
                style: TextStyle(
                    fontSize: FontsSize.s14,
                    fontWeight: Fonts.semiBold,
                    color: Theme.of(context).colorScheme.onPrimary)),
            value: isPrivateAccount,
            onChanged: (bool value) {
              setState(() {
                isPrivateAccount = value;
              });
            }),
        const SizedBox(height: 16),
        Text(
            showFullDescription
                ? 'When your account is public, your profile and posts can be seen by anyone, on or off Instagram, even if they don’t have an Instagram account. '
                    'When your account is private, only the followers that you approve can see what you share, including your photos or videos on hashtag and location pages, and your followers and following lists.'
                : 'When your account is public, your profile and posts can be seen by anyone, on or off Instagram, even if they don’t have an Instagram account...',
            style: TextStyle(fontSize: FontsSize.s12)),
        const SizedBox(height: 8),
        GestureDetector(
            onTap: () {
              setState(() {
                showFullDescription = !showFullDescription; // Toggle the flag
              });
            },
            child: Text(showFullDescription ? 'Show less' : 'Read more',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: FontsSize.s16,
                    decoration: TextDecoration.underline)))
      ])
    ]);
  }
}
