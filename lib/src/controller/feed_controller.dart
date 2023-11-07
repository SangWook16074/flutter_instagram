import 'package:flutter_instagram/src/data/model/feed.dart';
import 'package:flutter_instagram/src/data/repository/feed_repository.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final FeedRepository feedRepository;
  FeedController({required this.feedRepository});

  List<Feed> get feeds => _feeds.value;

  @override
  void onReady() {
    super.onReady();
    _feeds.bindStream(_fetchData());
  }

  Stream<List<Feed>> _fetchData() => feedRepository.getFeeds();
}
