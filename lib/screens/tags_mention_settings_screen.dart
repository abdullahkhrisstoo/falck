import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/shared/components/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';

class TagsMentionSettingsScreen extends StatefulWidget {
  const TagsMentionSettingsScreen({super.key});

  @override
  State<TagsMentionSettingsScreen> createState() =>
      _TagsMentionSettingsScreenState();
}

class _TagsMentionSettingsScreenState extends State<TagsMentionSettingsScreen> {
  String tagOption = 'Allow tags from everyone';
  String mentionOption = 'Allow mention from everyone';
  bool manuallyApproveTags = false;

  final List<String> tagOptions = [
    'Allow tags from everyone',
    'Allow tags from people that you follow',
    'Don’t allow tags'
  ];

  final List<String> mentionOptions = [
    'Allow mention from everyone',
    'Allow mention from people that you follow',
    'Don’t allow mention'
  ];

  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(
      appBarTitle: 'Tags & mentions',
      children: [
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who can tag you',
              style: TextStyle(
                fontSize: FontsSize.s16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select who can tag you in their photos and videos. If you don’t allow tags from everyone, people will see that when they try to tag you.',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: DynamicRadioButton<String>(
                options: tagOptions,
                selectedOption: tagOption,
                onChanged: (value) {
                  setState(() {
                    tagOption = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Manually approve tags',
                      style: TextStyle(
                        fontSize: FontsSize.s14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Switch(
                      value: manuallyApproveTags,
                      onChanged: (value) {
                        setState(() {
                          manuallyApproveTags = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
                        const SizedBox(height: 16),

            Text(
              'Who can mention you',
              style: TextStyle(
                  fontSize: FontsSize.s16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(height: 8),
            Text(
              'Select who can @mention you to link your account in their stories, comments, live videos, and captions. If you don’t allow @mentions, people will be notified when they try to mention you.',
              style: TextStyle(
                  fontSize: FontsSize.s14,
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)),
            ),
            const SizedBox(height: 16),
            Card(
              child: DynamicRadioButton<String>(
                options: mentionOptions,
                selectedOption: mentionOption,
                onChanged: (value) {
                  setState(() {
                    mentionOption = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
