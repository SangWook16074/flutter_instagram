import 'package:flutter_instagram/src/data/model/feed.dart';
import 'package:flutter_instagram/src/data/provider/firebase_db.dart';

class FeedRepository {
  final FirebaseDBApi firebaseDBapi;
  FeedRepository({required this.firebaseDBapi});

  Stream<List<Feed>> getFeeds() => firebaseDBapi.getFeeds();
}
