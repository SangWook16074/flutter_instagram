import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _appBar(),
            _story(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      title: ImageData(
        path: ImagePath.logo,
        width: 300,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: ImagePath.active),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: ImagePath.dm),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Column(
                children: List.generate(
                    50,
                    (index) => Container(
                          height: 50,
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        )),
              ),
          childCount: 1),
    );
  }

  Widget _story() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              50,
              (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageAvatar(
                    type: AvatarType.STORY,
                    width: Get.size.width * 0.23,
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
