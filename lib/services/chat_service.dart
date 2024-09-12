import 'package:chatapp/objects.dart/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chatservice {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<List<Map<String, dynamic>>> getuserstream() {
    return _firestore.collection("Users").snapshots().map((snapshots) {
      return snapshots.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendmessage(String recieverID, message) async {
    final String Currentuserid = _auth.currentUser!.uid;
    final String Currenuseremail = _auth.currentUser!.email!;
    final Timestamp Timespamp = Timestamp.now(); //getting sender info;

    Message newmessage = Message(
        Senderemail: Currenuseremail,
        Senderserid: Currentuserid,
        Recieverid: recieverID,
        Message_: message,
        timestamp: Timespamp);

    List<String> ids = [Currentuserid, recieverID];
    ids.sort();

    String chatid = ids.join('_'); // sort method is present in the list
    await _firestore
        .collection("chatrooms")
        .doc(chatid)
        .collection("messages")
        .add(newmessage.tomap());
  }

  Stream<QuerySnapshot> getmessages(String Userid, otheruserid) {
    List<String> id = [Userid, otheruserid];
    id.sort();
    String chatroomid = id.join('_');
    return _firestore
        .collection("chatrooms")
        .doc(chatroomid)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
