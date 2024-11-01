import 'package:cached_network_image/cached_network_image.dart';
import 'package:falack_app/core/utils/extensions/sized_extension.dart';
import 'package:falack_app/features/authentication/presentation/screen/success_otp_screen.dart';
import 'package:falack_app/shared/post/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PostHeader extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String postTime;
  final String category;

  const PostHeader(
      {super.key,
      required this.profileImageUrl,
      required this.username,
      required this.postTime,
      required this.category});

  @override
  State<PostHeader> createState() => _PostHeaderState();
}

class _PostHeaderState extends State<PostHeader> {
  Color? dominantColor = Colors.grey;

  Future<void> _updatePalette() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      const CachedNetworkImageProvider(
          'https://cdn.mos.cms.futurecdn.net/mYrbe4WkTqJaEpNSEChFk-650-80.jpg'),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.red;
    });
  }

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(alignment: Alignment.center, children: [
          SizedBox(
              height: 80,
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.profileImageUrl))),
          SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                  value: 0.7,
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(dominantColor!),
                  backgroundColor: Colors.transparent)),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: dominantColor!,
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: const Offset(0, 3))
                  ], shape: BoxShape.circle),
                  child: const CircleAvatar(
                      radius: 15,
                      backgroundImage: CachedNetworkImageProvider(
                        'https://cdn.mos.cms.futurecdn.net/mYrbe4WkTqJaEpNSEChFk-650-80.jpg',
                      ))))
        ]),
        const SizedBox(width: 10),
        SizedBox(
            width: context.w * 0.2,
            child: Text(
                widget.username,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16))),
        const SizedBox(width: 10),
        Text(widget.postTime,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Spacer(),
        Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: dominantColor!,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(widget.category,
                style: const TextStyle(fontSize: 12, color: Colors.white))),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
      ],
    );
  }
}
