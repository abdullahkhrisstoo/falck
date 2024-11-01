import 'dart:io';
import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaPickerWidget extends StatelessWidget {
  final void Function(File?) onMediaPicked;
  final bool isVideo;
  final int? imageQuality;
  final Duration? maxVideoDuration;
  final ImageSource source;

  const MediaPickerWidget({
    super.key,
    required this.onMediaPicked,
    this.isVideo = false,
    this.imageQuality,
    this.maxVideoDuration,
    required this.source,
  });

  Future<void> _pickMedia(BuildContext context, ImageSource source) async {
    final mediaService = MediaService();
    File? file;
    if (isVideo) {
      file = await mediaService.pickVideo(
        source: source,
        maxDuration: maxVideoDuration,
      );
    } else {
      file = await mediaService.pickImage(
        source: source,
        imageQuality: imageQuality,
      );
    }
    onMediaPicked(file);
  }

  @override
  Widget build(BuildContext context) {
    return FilledButtonWidget(
        title: isVideo ? 'Select Video' : 'Select Image',
        onPressed: () => _pickMedia(context, source));
  }
}

// todo:
class MediaService {
  MediaService._privateConstructor();

  static final MediaService _instance = MediaService._privateConstructor();

  factory MediaService() {
    return _instance;
  }

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({
    required ImageSource source,
    int? imageQuality,
  }) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality ?? 85,
      );
      return pickedFile != null ? File(pickedFile.path) : null;
    } catch (e) {
      debugPrint("Error picking image: $e");
      return null;
    }
  }

  Future<File?> pickVideo({
    required ImageSource source,
    Duration? maxDuration,
  }) async {
    try {
      final pickedFile = await _picker.pickVideo(
          source: source,
          maxDuration: maxDuration ?? const Duration(minutes: 5));
      return pickedFile != null ? File(pickedFile.path) : null;
    } catch (e) {
      debugPrint("Error picking video: $e");
      return null;
    }
  }
}
