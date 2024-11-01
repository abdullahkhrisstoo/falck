import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsRichTextComponents extends StatelessWidget {
  const TermsRichTextComponents(
      {super.key, this.termsOfUseMethod, this.privacyNoticeMethod});
  final void Function()? termsOfUseMethod;
  final void Function()? privacyNoticeMethod;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text:
                'By selecting "I Agree" below, I have reviewed and agree to the ',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),

            children: [
          TextSpan(
              text: 'Terms of Use',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = termsOfUseMethod),
          const TextSpan(text: ' and acknowledge the '),
          TextSpan(
              text: 'Privacy Notice',
              style: const TextStyle(color: Colors.blue),
              // style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer),
              recognizer: TapGestureRecognizer()..onTap = privacyNoticeMethod),
          const TextSpan(text: '. I am at least 18 years of age.')
        ]));
  }
}
