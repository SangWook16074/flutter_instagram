import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AvatarType { ON, OFF, STORY }

class ImageAvatar extends StatelessWidget {
  final double width;
  final String url;
  final AvatarType type;
  const ImageAvatar(
      {super.key, this.width = 70, required this.url, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.STORY:
        return _storyAvatar();
      case AvatarType.ON:
        return _onImage();
      case AvatarType.OFF:
        return _offImage();
    }
  }

  Widget _offImage() {
    return SizedBox(
      width: 70 / Get.mediaQuery.devicePixelRatio,
      child: CircleAvatar(
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100.0)),
          child: _basicImage(),
        ),
      ),
    );
  }

  Widget _onImage() {
    return SizedBox(
      width: 70 / Get.mediaQuery.devicePixelRatio,
      child: CircleAvatar(
        child: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(100.0)),
          child: Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0)),
            child: _basicImage(),
          ),
        ),
      ),
    );
  }

  Widget _basicImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(65),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _storyAvatar() {
    return Container(
        padding: const EdgeInsets.all(3.5),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfffce80a),
                  Color(0xfffc3a0a),
                  Color(0xffc80afc),
                ])),
        child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: _basicImage()));
  }
}
