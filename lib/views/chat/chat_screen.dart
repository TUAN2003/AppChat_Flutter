import 'package:appchat/models/room_model.dart';
import 'package:appchat/views/widgets/avatar_custom.dart';
import 'package:appchat/views/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final RoomModel roomModel;
  const ChatScreen(this.roomModel, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        titleSpacing: 5,
        title: Row(
          children: [
            AvatarCustom(
              url: widget.roomModel.avatarUrl,
              diameter: 45,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.roomModel.name),
                Text(
                  overflow: TextOverflow.ellipsis,
                  'Đang hoạt động',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ))
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
        ],
      ),
    );
  }
}
