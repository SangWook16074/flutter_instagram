import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadImage extends StatelessWidget {
  final void Function()? onTap;
  final AssetEntity entity;
  final BoxFit fit;
  const UploadImage(
      {super.key, this.onTap, required this.entity, required this.fit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AssetEntityImage(
        entity,
        fit: fit,
        isOriginal: false,
      ),
    );
  }
}
