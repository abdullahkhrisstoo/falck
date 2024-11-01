import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';
import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(appBarTitle: 'Terms And Condition', children: [
      const SizedBox(height: 16),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
            'When your account is public, your profile and posts can be seen by anyone, on or off Instagram, even if they don’t have an Instagram account. '
            'When your account is private, only the followers that you approve can see what you share, including your photos or videos on hashtag and location pages, and your followers and following lists.'
            'When your account is public, your profile and posts can be seen by anyone, on or off Instagram, even if they don’t have an Instagram account...',
            style: TextStyle(fontSize: FontsSize.s12)),
        const SizedBox(height: 8),
      ])
    ]);
  }
}
