import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/view/screens/add_caption_screen.dart';

class addVideoScreen extends StatelessWidget {
  addVideoScreen({super.key});

  VideoPick(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar('Video Selected', video.path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddCaptionScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    } else {
      Get.snackbar('Error', 'Please check your video');
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => VideoPick(ImageSource.gallery,context),
            child: Text('Gallery'),
          ),
          SimpleDialogOption(
            onPressed: () => VideoPick(ImageSource.camera,context),
            child: Text('Camera'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: const Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
