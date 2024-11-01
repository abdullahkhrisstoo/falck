import 'package:falack_app/shared/button/like_btn.dart';
import 'package:falack_app/shared/post/post_bottom.dart';
import 'package:falack_app/shared/post/post_header.dart';
import 'package:flutter/material.dart';
import 'package:falack_app/shared/components/cahce_network_img.dart';

class PostWidget extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String postTime;
  final String category;
  final String postContent;
  final List<String> postImages;
  final int likes;
  final int comments;
  final int shares;

  const PostWidget({
    super.key,
    required this.profileImageUrl,
    required this.username,
    required this.postTime,
    required this.category,
    required this.postContent,
    required this.postImages,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          PostHeader(
              profileImageUrl: widget.profileImageUrl,
              username: widget.username,
              postTime: widget.postTime,
              category: widget.category),
          const SizedBox(height: 10),
          Text(widget.postContent, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          LikeBtn(
              child: GestureDetector(onTap: () {
                
              }, child: _buildPostImages(context))),
          const SizedBox(height: 10),
          PostBottom(
            likes: widget.likes,
            comments: widget.comments,
            shares: widget.shares,
            saved: 1,
          ),
        ]));
  }

  Widget _buildPostImages(BuildContext context) {
    if (widget.postImages.length == 1) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: CacheImageWidget(
            imgURL: widget.postImages[0],
            width: double.infinity,
            fit: BoxFit.fill,
            height: 400),
      );
    } else if (widget.postImages.length == 2) {
      return Row(
        children: [
          Expanded(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: CacheImageWidget(
                      imgURL: widget.postImages[0],
                      width: 250,
                      fit: BoxFit.fill,
                      height: 250))),
          const SizedBox(width: 10),
          Expanded(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: CacheImageWidget(
                      imgURL: widget.postImages[1],
                      width: 250,
                      fit: BoxFit.fill,
                      height: 250)))
        ]
      );
    } else if (widget.postImages.length == 3) {
      return Row(
        children: [
          Expanded(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: CacheImageWidget(
                      imgURL: widget.postImages[0],
                      width: 250,
                      fit: BoxFit.fill,
                      height: 250))),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: CacheImageWidget(
                      imgURL: widget.postImages[1],
                      width: 250,
                      fit: BoxFit.fill,
                      height: 125)),
              const SizedBox(height: 10),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: CacheImageWidget(
                      imgURL: widget.postImages[2],
                      width: 250,
                      fit: BoxFit.fill,
                      height: 125))
            ]
          ))
        ]
      );
    } else {
      return Row(children: [
        Expanded(
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: CacheImageWidget(
                    imgURL: widget.postImages[0],
                    width: 250,
                    fit: BoxFit.fill,
                    height: 250))),
        const SizedBox(width: 10),
        Expanded(
            child: Column(children: [
          Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: CacheImageWidget(
                  imgURL: widget.postImages[1],
                  width: 250,
                  fit: BoxFit.fill,
                  height: 180)),
          const SizedBox(height: 10),
          Container(
              width: 250,
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surfaceContainerHigh),
              child: const Icon(Icons.add))
        ]))
      ]);
    }
  }
}
