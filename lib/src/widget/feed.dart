import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/data/model/feed.dart';
import 'package:flutter_instagram/src/widget/comment_bottom_sheet.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeedWidget extends StatefulWidget {
  final Feed feed;
  const FeedWidget({
    super.key,
    required this.feed,
  });

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  int _current = 0;

  final DraggableScrollableController controller =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _images(),
        _options(),
        _comment(),
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
                url: widget.feed.userUrl,
                type: AvatarType.BASIC,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.feed.userName,
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
        itemCount: widget.feed.images.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            color: Colors.black,
            width: Get.size.width,
            height: Get.size.width,
            child: CachedNetworkImage(
              imageUrl: widget.feed.images[index],
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
              child: GestureDetector(
                  onTap: showCommentSheet,
                  child: ImageData(path: ImagePath.replyIcon)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(child: ImageData(path: ImagePath.dm)),
            ),
          ],
        ),
        (widget.feed.images.length == 1)
            ? Container()
            : AnimatedSmoothIndicator(
                activeIndex: _current,
                count: widget.feed.images.length,
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
              '좋아요 ${widget.feed.countLike}개',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableText(
              '컨텐츠 입니다.\n컨텐츠 입니다.\n컨텐츠 입니다.\n컨텐츠 입니다.\n컨텐츠 입니다.',
              expandText: '더보기',
              linkColor: Colors.grey,
              prefixText: widget.feed.userName,
              prefixStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                '댓글 ${widget.feed.countComment}개 모두 보기',
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
                onTap: () {},
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

  void showCommentSheet() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        enableDrag: true,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (_) => const CommentBottomSheet());
  }
}
