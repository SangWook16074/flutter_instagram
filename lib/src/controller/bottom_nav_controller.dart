import 'dart:io';

import 'package:flutter_instagram/src/bindings/upload_binding.dart';
import 'package:flutter_instagram/src/view/upload.dart';
import 'package:get/get.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class BottomNavigationController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  final List<int> _history = [0];

  int get pageIndex => _pageIndex.value;

  void changeIndex(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.REELS:
      case Page.MYPAGE:
        moveToPage(value);
      case Page.UPLOAD:
        moveToUpload();
    }
  }

  void moveToPage(int value) {
    if (_history.last != value && Platform.isAndroid) {
      _history.add(value);
      print(_history);
    }
    _pageIndex(value);
  }

  Future<bool> popAction() async {
    if (_history.length == 1) {
      return true;
    } else {
      _history.removeLast();
      _pageIndex(_history.last);
      return false;
    }
  }

  void moveToUpload() {
    Get.to(() => const Upload(), binding: UploadBinding());
  }
}
