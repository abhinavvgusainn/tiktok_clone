import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;
  myUser({
    required this.name,
    required this.email,
    required this.profilePhoto,
    required this.uid,
  });
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePic": profilePhoto,
        "email": email,
        "uid": uid,
      };
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
      name: snapshot['name'],
      email: snapshot['email'],
      profilePhoto: snapshot['profilePic'],
      uid: snapshot['uid'],
    );
  }
}
