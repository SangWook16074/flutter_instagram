import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/src/data/model/feed.dart';

class FirebaseDBApi {
  final FirebaseFirestore firebaseFirestore;
  FirebaseDBApi({
    required this.firebaseFirestore,
  });

  Stream<List<Feed>> getFeeds() {
    try {
      return firebaseFirestore
          .collection('feeds')
          .snapshots()
          .map((querySnapshot) {
        List<Feed> feeds = [];
        for (var feed in querySnapshot.docs) {
          final feedModel = Feed.fromDocumentSnapshot(feed);
          feeds.add(feedModel);
        }
        return feeds;
      });
    } catch (e) {
      throw Exception();
    }
  }
}
