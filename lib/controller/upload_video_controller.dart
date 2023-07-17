import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok/model/video.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class VideoUploadController extends GetxController {
  static VideoUploadController instance = Get.find();
  var uuid = Uuid();

  _createThumbnail(String videoPath) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      quality: 25,
      maxHeight: 100,
      maxWidth: 100,
    );
    return thumbnailPath;
  }

  Future<String> _uploadVideoThumbToStorage(String id, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('thumbnail').child(id);
    UploadTask uploadTask =
        reference.putFile(File(await _createThumbnail(videoPath)));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadVideoToStorage(String videoId, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('videos').child(videoId);
    UploadTask uploadTask = reference.putFile(File(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      // Video id
      String id = uuid.v1();
      String videoUrl = await _uploadVideoToStorage(id, videoPath);

      String thumbnail = await _uploadVideoThumbToStorage(id, videoPath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        caption: caption,
        commentsCount: 0,
        id: id,
        likes: [],
        profilePic: (userDoc.data()! as Map<String, dynamic>)['profilePic'],
        shareCount: 0,
        songName: songName,
        thumbnail: thumbnail,
        uid: uid,
        videoUrl: videoUrl,
      );
      await FirebaseFirestore.instance
          .collection('videos')
          .doc(id)
          .set(video.toJson());
      Get.snackbar('Done!', 'Video uploaded');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
