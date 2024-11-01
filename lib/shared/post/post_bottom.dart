import 'package:flutter/material.dart';

class PostBottom extends StatelessWidget {
  final int likes;
  final int comments;
  final int shares;
  final int saved;

  const PostBottom({
    super.key,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildStatIcon(
              () {},
              Icons.favorite,
              count: likes,
            ),
            const SizedBox(width: 20),
            _buildStatIcon(() {}, Icons.comment, count: comments),
            const SizedBox(width: 20),
            _buildStatIcon(() {}, Icons.share, count: shares)
          ]),
          _buildStatIcon(() {}, Icons.share, count: null)
        ],
      ),
    );
  }

  Widget _buildStatIcon(void Function()? onTap, IconData icon, {int? count}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 4),
          if (count != null)
            Text(
              '$count',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
