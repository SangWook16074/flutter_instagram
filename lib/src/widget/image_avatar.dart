import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';

enum AvatarType { ON, OFF, STORY, MYSTORY }

class ImageAvatar extends StatelessWidget {
  final double width;
  final String url;
  final AvatarType type;
  final void Function()? onTap;
  const ImageAvatar(
      {super.key,
      this.width = 30,
      required this.url,
      required this.type,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.STORY:
        return _storyAvatar();
      case AvatarType.ON:
        return _onImage();
      case AvatarType.OFF:
        return _offImage();
      case AvatarType.MYSTORY:
        return _myStoryAvatar();
    }
  }

  Widget _offImage() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100.0)),
      child: _basicImage(),
    );
  }

  Widget _onImage() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(100.0)),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100.0)),
        child: _basicImage(),
      ),
    );
  }

  Widget _basicImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(65),
      child: SizedBox(
        width: width,
        height: width,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
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

  Widget _myStoryAvatar() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(3.5),
          child: Stack(
            children: [
              _basicImage(),
              Positioned(
                bottom: 0.5,
                right: 0.5,
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: ImageData(width: 65, path: ImagePath.addStory),
                  // child: Container(
                  //   alignment: Alignment.center,
                  //   width: 22,
                  //   height: 22,
                  //   decoration: const BoxDecoration(
                  //       color: Colors.blue, shape: BoxShape.circle),
                  //   child: const Icon(
                  //     Icons.add,
                  //     color: Colors.white,
                  //     size: 20,
                  //   ),
                  // ),
                ),
              ),
            ],
          )),
    );
  }
}
