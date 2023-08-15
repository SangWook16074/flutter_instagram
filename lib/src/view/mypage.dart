import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:flutter_instagram/src/widget/mypage_button.dart';
import 'package:flutter_instagram/src/widget/mypage_info.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late final _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    context: context,
                    builder: (context) => Container(
                          height: 400,
                        ));
              },
              child: const Text(
                '_ugsxng99',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ImageData(
              path: ImagePath.arrowDownIcon,
              width: 60,
            )
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ImageData(path: ImagePath.upload),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ImageData(path: ImagePath.menuIcon),
          ),
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _info(),
                _buttons(),
                _tabs(),
                _images(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _info() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: ImageAvatar(
              width: 100,
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
              type: AvatarType.MYSTORY),
        ),
        Padding(
          padding: EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: MyPageInfo(count: 35, label: '게시물'),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: MyPageInfo(count: 167, label: '팔로워'),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: MyPageInfo(count: 144, label: '팔로잉'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 4, child: MyPageButton(onTap: () {}, label: '프로필 편집')),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(flex: 4, child: MyPageButton(onTap: () {}, label: '프로필 공유')),
          const SizedBox(
            width: 10.0,
          ),
          Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: const Color(0xfff3f3f3),
                  borderRadius: BorderRadius.circular(4.0)),
              child: ImageData(path: ImagePath.addFriend))
        ],
      ),
    );
  }

  Widget _images() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
        itemCount: 50,
        itemBuilder: (context, index) => Container(
              color: Colors.blue,
            ));
  }

  Widget _tabs() {
    return TabBar(controller: _controller, indicatorColor: Colors.black, tabs: [
      Tab(
        child: ImageData(path: ImagePath.gridViewOff),
      ),
      Tab(
        child: ImageData(path: ImagePath.myTagImageOff),
      ),
    ]);
  }
}
