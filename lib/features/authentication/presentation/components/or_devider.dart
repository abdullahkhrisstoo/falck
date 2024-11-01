import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:flutter/material.dart';

class OrDeviderWidget extends StatelessWidget {
  const OrDeviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1)),
      const SizedBox(width: 10),
      Text('OR',
          style: TextStyle(fontSize: FontsSize.s16, fontWeight: Fonts.medium)),
      const SizedBox(width: 10),
      Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1))
    ]);
  }
}
