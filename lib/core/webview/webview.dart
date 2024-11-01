import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicWebView extends StatelessWidget {
  final String url;

  const DynamicWebView({super.key, required this.url});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Show a Snackbar or AlertDialog to inform the user
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await _launchURL();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child:  const Text('Open Web Page'),
    );
  }
}
