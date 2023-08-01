import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_instagram/src/view/home.dart';
import 'package:flutter_instagram/src/view/search.dart';
import 'package:flutter_instagram/src/widget/image_avatar.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavigationController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: controller.popAction,
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _bottom(),
        ),
      ),
    );
  }

  Widget _bottom() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.pageIndex,
      onTap: controller.changeIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(
              path: ImagePath.homeOff,
            ),
            activeIcon: ImageData(
              path: ImagePath.homeOn,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: ImageData(
              path: ImagePath.searchOff,
            ),
            activeIcon: ImageData(
              path: ImagePath.searchOn,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: ImageData(
              path: ImagePath.upload,
            ),
            activeIcon: ImageData(
              path: ImagePath.upload,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: ImageData(
              path: ImagePath.reelsOff,
            ),
            activeIcon: ImageData(
              path: ImagePath.reelsOn,
            ),
            label: 'Home'),
        const BottomNavigationBarItem(
            icon: ImageAvatar(
              type: AvatarType.OFF,
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
            ),
            activeIcon: ImageAvatar(
              type: AvatarType.ON,
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
            ),
            label: 'Home'),
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.pageIndex,
      children: [
        const Home(),
        Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: (settings) {
            return GetPageRoute(
              page: () => const Search(),
            );
          },
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }
}
