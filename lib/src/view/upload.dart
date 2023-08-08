import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/upload_controller.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/src/widget/upload_image.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends GetView<UploadController> {
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
      body: Obx(
        () => (!controller.isDone)
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Column(
                children: [
                  _preview(),
                  _header(),
                  _images(),
                ],
              ),
      ),
    );
  }

  Widget _preview() {
    return (controller.selectedImage != null)
        ? SizedBox(
            height: Get.size.width,
            width: Get.size.width,
            child: AssetEntityImage(
              controller.selectedImage!,
              isOriginal: false,
              fit: BoxFit.contain,
            ))
        : Container(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: controller.moveToChoose,
                child: Text(
                  (controller.albums.isNotEmpty)
                      ? controller.albums[controller.index].name!
                      : '',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
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
        child: (controller.albums.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 1, crossAxisSpacing: 1),
                itemCount: controller.albums[controller.index].images!.length,
                itemBuilder: (context, index) => UploadImage(
                    onTap: () {
                      controller.select(
                          controller.albums[controller.index].images![index]);
                    },
                    entity: controller.albums[controller.index].images![index],
                    fit: BoxFit.cover))
            : const Center(child: Text('텅')),
      ),
    );
  }
}
