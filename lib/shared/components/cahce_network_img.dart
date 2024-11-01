import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageWidget extends StatelessWidget {
  const CacheImageWidget({
    super.key,
    required this.imgURL,
    this.loadingWidget = const CircularProgressIndicator(),
    this.errorWidget = const Icon(Icons.error),
    this.fit = BoxFit.cover, required this.width, required this.height,
    
  });

  final String imgURL;
  final Widget loadingWidget;
  final Widget errorWidget;
  final BoxFit fit;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imgURL,
      fit: fit,
      maxHeightDiskCache: 1000,
      maxWidthDiskCache: 1000,
      placeholder: (context, url) => loadingWidget,
      errorWidget: (context, url, error) => errorWidget,
      fadeInDuration: const Duration(seconds: 1),
      fadeOutDuration: const Duration(seconds: 1),
    );
  }
}
