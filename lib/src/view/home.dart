import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/feed_controller.dart';
import 'package:flutter_instagram/src/widget/feed.dart';
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
      snap: true,
      title: ImageData(
        path: ImagePath.logo,
        width: 400,
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
    return GetX<FeedController>(builder: (controller) {
      return SliverList.builder(
          itemCount: controller.feeds.length,
          itemBuilder: (context, index) {
            final feed = controller.feeds[index];
            return FeedWidget(feed: feed);
          });
    });
  }

  Widget _story() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ImageAvatar(
                    width: Get.size.width * 0.2,
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
                    type: AvatarType.MYSTORY),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('내 스토리'),
              )
            ],
          ),
          ...List.generate(
            20,
            (index) => SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ImageAvatar(
                      width: Get.size.width * 0.2,
                      type: AvatarType.STORY,
                      url:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '$index번째 사용자',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
