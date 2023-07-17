import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;

  Video({
    required this.username,
    required this.caption,
    required this.commentsCount,
    required this.id,
    required this.likes,
    required this.profilePic,
    required this.shareCount,
    required this.songName,
    required this.thumbnail,
    required this.uid,
    required this.videoUrl,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "profilePic": profilePic,
        "id": id,
        "likes": likes,
        "commentsCount": commentsCount,
        "shareCount": shareCount,
        "songName": songName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
      };
  static Video fromSnap(DocumentSnapshot snap) {
    var sst = snap.data() as Map<String, dynamic>;
    return Video(
      username: sst["username"],
      caption: sst["caption"],
      commentsCount: sst["commentsCount"],
      id: sst["id"],
      likes: sst["likes"],
      profilePic: sst["profilePic"],
      shareCount: sst["shareCount"],
      songName: sst["songName"],
      thumbnail: sst["thumbnail"],
      uid: sst["uid"],
      videoUrl: sst["videoUrl"],
    );
  }
}
