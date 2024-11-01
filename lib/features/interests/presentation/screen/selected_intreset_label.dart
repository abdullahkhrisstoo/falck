import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:falack_app/core/image/svg.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/interests/presentation/widgets/inward_curved_label.dart';
import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';
import 'package:flutter/material.dart';

class SelectedIntresetLabel extends StatefulWidget {
  const SelectedIntresetLabel({super.key});

  @override
  State<SelectedIntresetLabel> createState() => _SelectedIntresetLabelState();
}

class _SelectedIntresetLabelState extends State<SelectedIntresetLabel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(
            Icons.arrow_forward_ios_sharp,

            size: 30,
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.scrim,
                  Theme.of(context).colorScheme.scrim,
                  Theme.of(context).colorScheme.scrim,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back, size: 30)),
                        const FlutterLogo(
                          size: 60,
                        ),
                        InkWell(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.arrow_back, size: 1),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: context.h * 0.14),
                    Text(
                      'Computer and technology is your ticket to earning points and badges.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: FontsSize.s28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      'it\'s your time to shine and dominate this category like a boss!',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: FontsSize.s18,
                          fontWeight: Fonts.bold),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    const InwardCurvedLabel(
                      icon: '🎨',
                      title: 'Arts & Entertainment',
                    )
                  ]),
            )));
  }
}
