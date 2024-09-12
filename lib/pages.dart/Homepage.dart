import 'package:chatapp/auth_user.dart';
import 'package:chatapp/objects.dart/user_tile.dart';
import 'package:chatapp/pages.dart/auth_gate.dart';
import 'package:chatapp/pages.dart/chatpage.dart';
import 'package:chatapp/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final Chatservice _chatservice = Chatservice();
  final AuthUser _authUser = AuthUser();

  void logout() {
    AuthUser _logout = AuthUser();
    _logout.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Venkat you pc has been hacked , send 1000 rs to free your pc , lmao")),
        backgroundColor: Colors.transparent,
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: _builduserlist(),
    );
  }

  Widget _builduserlist() {
    return StreamBuilder(
        stream: _chatservice.getuserstream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error ");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("waiting");
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userdata) => _buildUserListItem(userdata, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userdata, BuildContext context) {
    if (userdata["email"] != _authUser.getcurrentUser()!.email) {
      return UserTile(
          text: userdata["email"],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chatpage(
                          Useremail: userdata["email"],
                          recieverid: userdata["uid"],
                        )));
          });
    } else {
      return Container();
    }
  }
}
