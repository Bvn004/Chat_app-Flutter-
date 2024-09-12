import 'package:chatapp/auth_user.dart';
import 'package:chatapp/objects.dart/chatbubble.dart';
import 'package:chatapp/objects.dart/textfield.dart';
import 'package:chatapp/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatelessWidget {
  String Useremail;
  final recieverid;

  Chatpage({super.key, required this.Useremail, required this.recieverid});

  final TextEditingController msgcontroller = TextEditingController();
  Chatservice _chatservice = Chatservice();
  AuthUser _authUser = AuthUser();
  void sendmsg() async {
    if (msgcontroller.text.isNotEmpty) {
      _chatservice.sendmessage(recieverid, msgcontroller.text);

      msgcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(Useremail),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildmsg(),
          ),
          _builduserinput(),
        ],
      ),
    );
  }

  Widget buildmsg() {
    String senderid = _authUser.getcurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatservice.getmessages(recieverid, senderid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildmessageitem(doc))
                .toList());
      },
    );
  }

  Widget _buildmessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool iscurrentuser = data["senderid"] == _authUser.getcurrentUser()!.uid;
    var alignment =
        iscurrentuser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              iscurrentuser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Chatbubble(Message: data["message"], iscurrentuser: iscurrentuser)
          ],
        ));
  }

  Widget _builduserinput() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
              child: Textfieldd(
            controllerr: msgcontroller,
            Hinttext: "enter your message",
            obscuretext: false,
          )),
          Container(
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: Center(
                  child: IconButton(
                      onPressed: sendmsg,
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ))))
        ],
      ),
    );
  }
}
