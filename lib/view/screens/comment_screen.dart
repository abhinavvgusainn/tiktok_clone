import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/comment_controller.dart';
import 'package:tiktok/view/widget/text_input.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({required this.id});
  final TextEditingController _commentsController = TextEditingController();

  CommentController commentController = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.comments[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(comment.profilePic),
                          ),
                          title: Row(
                            children: [
                              Text(
                                comment.username,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.redAccent,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                comment.comment,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                tago.format(comment.datePub),
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              Text(comment.likes.length.toString()),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              commentController.likeComment(comment.id);
                            },
                            child: Icon(Icons.favorite_outline,
                                color: comment.likes.contains(
                                        FirebaseAuth.instance.currentUser!.uid)
                                    ? Colors.red
                                    : Colors.white),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: TextInputField(
                    controller: _commentsController,
                    myIcon: Icons.comment,
                    myLabelText: 'Comment'),
                trailing: IconButton(
                  onPressed: () {
                    commentController.postComment(_commentsController.text);
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
