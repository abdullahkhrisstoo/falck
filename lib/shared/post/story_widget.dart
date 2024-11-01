import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {
        'name': 'Your story',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'true',
      },
      {
        'name': 'Moe salti',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
      {
        'name': 'Aya hamdan',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
      {
        'name': 'Moe salti',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
      {
        'name': 'Moe salti',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
      {
        'name': 'Moe salti',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
      {
        'name': 'Moe salti',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
      {
        'name': 'Moe salti',
        'image': 'https://picsum.photos/200/400',
        'isYourStory': 'false',
      },
    ];

    return SizedBox(
        height: context.h * 0.15,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              bool isYourStory = stories[index]['isYourStory'] == 'true';
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    Stack(children: [
                      Column(
                        children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(stories[index]['image']!,
                                  width: context.h * 0.1,
                                  height: context.h * 0.1,
                                  fit: BoxFit.cover)),
                              SizedBox(height: 10,)
                        ],
                      ),
                      if (isYourStory)
                        const Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: CircleAvatar(
                                radius: 12, child: Icon(Icons.add, size: 16)))
                    ]),
                    const SizedBox(height: 10),
                    Text(stories[index]['name']!)
                  ]));
            }));
  }
}
