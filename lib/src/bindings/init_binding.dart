import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_instagram/src/controller/feed_controller.dart';
import 'package:flutter_instagram/src/controller/home_controller.dart';
import 'package:flutter_instagram/src/controller/login_controller.dart';
import 'package:flutter_instagram/src/data/provider/firebase_db.dart';
import 'package:flutter_instagram/src/data/repository/feed_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
    Get.put(HomeController());
    Get.put(FeedController(
        feedRepository: FeedRepository(
            firebaseDBapi:
                FirebaseDBApi(firebaseFirestore: FirebaseFirestore.instance))));
    Get.put(LoginController(), permanent: true);
  }
}
