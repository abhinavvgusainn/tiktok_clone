import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/video_controller.dart';
import 'package:tiktok/view/screens/comment_screen.dart';
import 'package:tiktok/view/widget/album_rotator.dart';
import 'package:tiktok/view/widget/tiktok_video_player.dart';
import '../widget/profile_button.dart';

class DisplayVideo_Screen extends StatelessWidget {
  DisplayVideo_Screen({super.key});
  final VideoController videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(initialPage: 0),
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  TikTokVideoPlayer(videoUrl: data.videoUrl),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.username,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        Text(data.caption),
                        Text(
                          data.songName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2, right: 10),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            profilePhotoUrl: data.profilePic,
                          ),
                          InkWell(
                            onTap: () => videoController.likedVideo(data.id),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 35,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  data.likes.length.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(()=>CommentScreen(id: data.id,)),
                                child: Icon(
                                  Icons.comment,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                data.commentsCount.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.reply,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text(
                                data.shareCount.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AlbumRotator(profilePicUrl: data.profilePic)
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
