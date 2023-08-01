import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/search_focus_controller.dart';
import 'package:flutter_instagram/src/widget/search_text_field.dart';
import 'package:get/get.dart';

class SearchFocus extends StatelessWidget {
  const SearchFocus({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SearchTextField(
            focus: true,
            controller: Get.find<SearchFocusController>().searchController,
          ),
          // actions: const [Text('취소')],
        ),
      ),
    );
  }
}
