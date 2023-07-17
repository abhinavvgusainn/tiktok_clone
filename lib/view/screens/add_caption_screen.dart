import 'dart:io';
import 'package:get/get.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/controller/upload_video_controller.dart';
import 'package:tiktok/view/widget/text_input.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class AddCaptionScreen extends StatefulWidget {
  File videoFile;
  String videoPath;
  AddCaptionScreen({
    super.key,
    required this.videoFile,
    required this.videoPath,
  });

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  VideoUploadController videoUploadController =
      Get.put(VideoUploadController());
  TextEditingController songNameController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                children: [
                  TextInputField(
                      controller: songNameController,
                      myIcon: Icons.music_note,
                      myLabelText: 'Song Name'),
                  SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                      controller: captionController,
                      myIcon: Icons.closed_caption,
                      myLabelText: 'Caption'),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      videoUploadController.uploadVideo(
                        songNameController.text,
                        captionController.text,
                        widget.videoPath,
                      );
                    },
                    child: Text('Upload'),
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
