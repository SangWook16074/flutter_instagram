import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/bindings/search_focus_binding.dart';
import 'package:flutter_instagram/src/view/search_focus.dart';
import 'package:flutter_instagram/src/widget/search_grid_view.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      title: InkWell(
        highlightColor: Colors.black26,
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Get.to(() => const SearchFocus(),
              transition: Transition.fadeIn,
              binding: SearchFocusBinding(),
              id: 1);
        },
        onLongPress: () {
          Get.to(() => const SearchFocus(),
              transition: Transition.fadeIn,
              binding: SearchFocusBinding(),
              id: 1);
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(8.0)),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xff7d7d7d),
                  size: 20.0,
                ),
              ),
              Text(
                '검색',
                style: TextStyle(color: Color(0xff7d7d7d), fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SearchGridView(
      child: CachedNetworkImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU',
        fit: BoxFit.cover,
      ),
    );
  }
}
