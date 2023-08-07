import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 게시물'),
        titleTextStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
              onTap: Get.back, child: ImageData(path: ImagePath.closeImage)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(path: ImagePath.nextImage),
          )
        ],
      ),
      body: Column(
        children: [
          _preview(),
          _header(),
          _images(),
        ],
      ),
    );
  }

  Widget _preview() {
    return Container(
      height: Get.size.width,
      width: Get.size.width,
      color: Colors.black,
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '최근 항목',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ImageData(
              path: ImagePath.arrowDownIcon,
              width: 60,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Color(0xff808080), shape: BoxShape.circle),
                child: ImageData(
                  path: ImagePath.imageSelectIcon,
                  width: 60,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Color(0xff808080), shape: BoxShape.circle),
                child: ImageData(
                  path: ImagePath.cameraIcon,
                  width: 60,
                )),
          ],
        )
      ],
    );
  }

  Widget _images() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemCount: 50,
            itemBuilder: (context, index) => Container(
                  color: Colors.blue,
                )),
      ),
    );
  }
}
