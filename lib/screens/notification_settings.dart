import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/navigation/navigation.dart';
import 'package:falack_app/screens/birthday_settings_screen.dart';
import 'package:falack_app/screens/follow_settings_screen.dart';
import 'package:falack_app/screens/reels_setting_screen.dart';
import 'package:falack_app/shared/components/shared_gradient_scaflod.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    return SharedGradientScaflod(
      appBarTitle: 'Notifications',
      children: [
        SwitchListTile(
            title: Text(
              'Pause all',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: FontsSize.s16),
            ),
            subtitle: Text(
              'Temporarily pause notifications',
              style: TextStyle(
                  color: Theme.of(context).dividerColor,
                  fontSize: FontsSize.s14),
            ),
            value: isPaused,
            onChanged: (bool value) {
              setState(() {
                isPaused = value;
              });
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 0)),
        const SizedBox(height: 16),
        _buildListTile('Following & followers', onTap: () {
          context.navigateTo(const FollowSettingsScreen());
        }),
        _buildListTile('Reels & book reels', onTap: () {
          context.navigateTo(const ReelsSettingScreen());
        }),
        _buildListTile('Birthdays',onTap: (){

          context.navigateTo(const BirthdaySettingsScreen());

          
        }),
      ],
    );
  }

  ListTile _buildListTile(String title, {void Function()? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: FontsSize.s16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: FontsSize.s16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
