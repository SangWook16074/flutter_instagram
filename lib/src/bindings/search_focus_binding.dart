import 'package:flutter_instagram/src/controller/search_focus_controller.dart';
import 'package:get/get.dart';

class SearchFocusBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchFocusController());
  }
}
