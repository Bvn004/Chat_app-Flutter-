import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String Senderserid;
  String Senderemail;
  String Recieverid;
  String Message_;
  Timestamp timestamp;
  Message(
      {required this.Senderemail,
      required this.Senderserid,
      required this.Recieverid,
      required this.Message_,
      required this.timestamp});

  Map<String, dynamic> tomap() {
    return {
      "senderid": Senderserid,
      "senderemail": Senderemail,
      "reciever id": Recieverid,
      "message": Message_,
      "timestamp": timestamp
    };
  }
}
