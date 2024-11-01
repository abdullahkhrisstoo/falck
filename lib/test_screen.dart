import 'package:falack_app/shared/button/animated_toggle.dart';
import 'package:falack_app/shared/post/post_widget.dart';
import 'package:falack_app/shared/post/reels_widget.dart';
import 'package:falack_app/shared/post/story_widget.dart';
import 'package:flutter/material.dart';

class TestScreen2 extends StatefulWidget {
  const TestScreen2({super.key});

  @override
  State<TestScreen2> createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedToggle(
              values: const ['English', 'Arabic'],
              onToggleCallback: (value) {
                setState(() {
                  // _toggleValue = value;
                });
              },
            ),
            const Spacer(),
            // Right Section: Filter, Search, and Notification Buttons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.tune), // Filter Icon
                  onPressed: () {},
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.search), // Search Icon
                  onPressed: () {},
                  color: Colors.white,
                ),
                IconButton(
                  icon:
                      const Icon(Icons.notifications_none), // Notification Icon
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoryWidget(),
            PostWidget(
              profileImageUrl: 'https://picsum.photos/200/300',
              username: 'Maia yousef',
              postTime: '4h',
              category: 'Art & Entertainment',
              postContent:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              postImages: [
                'https://picsum.photos/200/400',
                'https://picsum.photos/200/100',
                'https://picsum.photos/400/500',
                'https://picsum.photos/200/300',
                'https://picsum.photos/200/300',
              ],
              likes: 50000,
              comments: 200,
              shares: 10,
            ),
            ReelsWidget()
          ],
        ),
      ),
    );
  }
}
