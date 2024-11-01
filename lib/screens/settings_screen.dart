import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:falack_app/core/navigation/navigation.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/screens/account_privacy_settings_screen.dart';
import 'package:falack_app/screens/notification_settings.dart';
import 'package:falack_app/screens/tags_mention_settings_screen.dart';
import 'package:falack_app/screens/terms_and_condition_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double availableHeight = (context.h * 0.84246575342476) -
        context.topPadding -
        context.bottom -
        context.appBarHeight;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("Profile"),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48), topRight: Radius.circular(48)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.h * 0.1),
                    Container(
                        height: availableHeight,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.scrim,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: context.h * 0.05),
                                  // Account Section
                                  buildSectionTitle('Account'),
                                  buildSettingsOption(
                                    context,
                                    title: 'Profile settings',
                                    icon: Icons.person,
                                  ),
                                  buildSettingsOption(
                                    context,
                                    title: 'Notifications',
                                    icon: Icons.notifications,
                                    onTap: (){
                                      context.navigateTo(const NotificationSettings());
                                    }
                                  ),
                                  buildSettingsOption(
                                    context,
                                    title: 'Account privacy',
                                    icon: Icons.lock,
                                    onTap: (){
                                      context.navigateTo(const AccountPrivacySettingsScreen());
                                    }
                                  ),
                                  buildSettingsOption(
                                    context,
                                    title: 'Tags & mentions',
                                    icon: Icons.tag,
                                    onTap: (){
                                      context.navigateTo(const TagsMentionSettingsScreen());
                                    }
                                  ),
                                  const SizedBox(height: 20),
                                  // About & Support Section
                                  buildSectionTitle('About & Support'),

                                  buildSettingsOption(
                                    context,
                                    title: 'Privacy centre',
                                    icon: Icons.security,
                                  ),
                                  buildSettingsOption(context,
                                      title: 'Terms and conditions',
                                      onTap: (){
                                        context.navigateTo(const TermsAndConditionScreen());
                                      },
                                      icon: Icons.gavel),
                                  buildSettingsOption(context,
                                      title: 'Help center',
                                      icon: Icons.help_outline),
                                  const SizedBox(height: 20),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .errorContainer)),
                                      onPressed: () {},
                                      child: ListTile(
                                          leading: Icon(Icons.logout,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .errorContainer),
                                          title: Text('Log out',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .errorContainer)))),
                                  const SizedBox(height: 20)
                                ])))
                  ])),
          Positioned(
              left: 0,
              right: 0,
              top: context.h * 0.05555,
              child: Column(children: [
                const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg',
                    )),
                SizedBox(
                    width: context.w * 0.3,
                    child: Text('Abdullah Khrais',
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: FontsSize.s12,
                            fontWeight: FontWeight.bold)))
              ]))
        ]));
  }

  Widget buildSectionTitle(String title) {
    return Text(title,
        style: TextStyle(fontSize: FontsSize.s18, fontWeight: Fonts.bold));
  }

  Widget buildSettingsOption(BuildContext context,
      {required String title, required IconData icon, void Function()? onTap}) {
    return Card(
      child: ListTile(
          leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
          title: Text(title, style: TextStyle(fontSize: FontsSize.s18)),
          onTap: onTap),
    );
  }
}
