import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/upload_controller.dart';
import 'package:get/get.dart';

class UploadChoice extends GetView<UploadController> {
  const UploadChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  controller.changeIndex(index);
                },
                title: Text(controller.albums[index].name!),
              ))),
    );
  }
}
