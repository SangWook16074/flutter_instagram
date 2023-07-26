import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Feed extends StatefulWidget {
  final String userUrl;
  final String userName;
  final List<String> images;
  final int countLikes;
  final int countComment;
  const Feed(
      {super.key,
      required this.userUrl,
      required this.userName,
      required this.images,
      required this.countLikes,
      required this.countComment});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _images(),
        _options(),
        // _comment(),
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageAvatar(
                url: widget.userUrl,
                type: AvatarType.BASIC,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.userName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.more_horiz),
        )
      ],
    );
  }

  Widget _images() {
    return CarouselSlider.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            color: Colors.black,
            width: Get.size.width,
            height: Get.size.width,
            child: CachedNetworkImage(
              imageUrl: widget.images[index],
              fit: BoxFit.cover,
            ),
          );
        },
        options: CarouselOptions(
          enableInfiniteScroll: false,
          aspectRatio: 1,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ));
  }

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: ImageData(path: ImagePath.likeOffIcon)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(child: ImageData(path: ImagePath.dm)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  GestureDetector(child: ImageData(path: ImagePath.replyIcon)),
            ),
          ],
        ),
        (widget.images.length == 1)
            ? Container()
            : AnimatedSmoothIndicator(
                activeIndex: _current,
                count: widget.images.length,
                effect: const ScrollingDotsEffect(
                    dotColor: Colors.black26,
                    activeDotColor: Colors.blue,
                    activeDotScale: 1,
                    spacing: 4.0,
                    dotWidth: 6.0,
                    dotHeight: 6.0),
              ),
        Row(
          children: [
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    child: ImageData(path: ImagePath.bookMarkOffIcon)),
              ),
            ),
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    child: ImageData(path: ImagePath.bookMarkOffIcon)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: ImageData(path: ImagePath.bookMarkOffIcon)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _comment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '좋아요 ${widget.countLikes}개',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableText(
              '컨텐츠 입니다.\n컨텐츠 입니다.\n컨텐츠 입니다.\n컨텐츠 입니다.\n컨텐츠 입니다.',
              expandText: '더보기',
              linkColor: Colors.grey,
              prefixText: widget.userName,
              prefixStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                '댓글 ${widget.countComment}개 모두 보기',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ImageAvatar(
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
                  type: AvatarType.BASIC,
                ),
              ),
              GestureDetector(
                onTap: showCommentModal,
                child: const Text(
                  '댓글 달기...',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void showCommentModal() {
    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0))),
        builder: (context) {
          return Column(
            children: [
              const Text(
                '댓글',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Divider(
                height: 10,
                color: Colors.black26,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.countComment,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  ImageAvatar(
                                      url:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRisv-yQgXGrto6OxQxX62JyvyQGvRsQQ760g&usqp=CAU',
                                      type: AvatarType.BASIC)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      '$index _user',
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      '$index 번째 댓글입니다.',
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      '답글 달기',
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        });
  }
}
