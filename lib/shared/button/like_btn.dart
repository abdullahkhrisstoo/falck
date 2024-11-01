import 'package:audioplayers/audioplayers.dart';
import 'package:falack_app/core/sound/sound.dart';
import 'package:flutter/material.dart';

class LikeBtn extends StatefulWidget {
  final Widget child;
  const LikeBtn({super.key, required this.child});

  @override
  State<LikeBtn> createState() => _LikeBtnState();
}

class _LikeBtnState extends State<LikeBtn> with SingleTickerProviderStateMixin {
  bool _liked = false;
  bool _showHeart = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  Offset _tapPosition = Offset.zero;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playLikeSound() async {
    await _audioPlayer.play(Sound.LIKE);
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _handleDoubleTap(TapDownDetails details) {
    setState(() {
      _liked = !_liked;
      _showHeart = true;
      _tapPosition = details.localPosition;
    });
    _controller.forward().then((_) => _controller.reverse());

    _playLikeSound();
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _showHeart = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTapDown: _handleDoubleTap,
        onDoubleTap: () {
          setState(() {
            _liked = !_liked;
            _showHeart = true;
          });
        },
        child: Stack(children: [
          widget.child,
          if (_showHeart)
            Positioned(
                top: _tapPosition.dy - 50,
                left: _tapPosition.dx - 50,
                child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: AnimatedOpacity(
                        opacity: _showHeart ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(Icons.favorite,
                            color: Theme.of(context).colorScheme.errorContainer,
                            size: 40))))
        ]));
  }
}
