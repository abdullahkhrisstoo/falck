import 'package:falack_app/shared/post/post_bottom.dart';
import 'package:falack_app/shared/post/post_header.dart';
import 'package:flutter/material.dart';

class ReelsWidget extends StatelessWidget {
  const ReelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 450,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://picsum.photos/200/400',
                          ),
                          fit: BoxFit.cover))),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: PostHeader(
                  profileImageUrl: 'https://picsum.photos/200/400',
                  username: 'Abdullah khrais',
                  postTime: '4h',
                  category: 'enginering'
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(Icons.speaker),
                ),
              )
            ],
          ),
        ),
        const PostBottom(
          likes: 10,
          comments: 10,
          shares: 10,
          saved: 1,
        ),
      ],
    );
  }
}
