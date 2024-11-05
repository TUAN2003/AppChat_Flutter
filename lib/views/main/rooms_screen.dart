import 'package:appchat/models/room_model.dart';
import 'package:appchat/providers/main_provider.dart';
import 'package:appchat/views/screens.dart';
import 'package:appchat/views/widgets/avatar_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<RoomsProvider>(context);
    final stream = mainProvider.getRooms();
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          if ((snapshot.data?.docs.length ?? 0) > 0) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (_, index) =>
                  _buildItem(context, snapshot.data?.docs[index]),
              itemCount: snapshot.data?.docs.length,
            );
          } else {
            return Center(
              child: Text("No users"),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      final room = RoomModel.fromDocSnap(document);
      return ListTile(
        minTileHeight: 60,
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => ChatScreen(room))),
        leading: AvatarCustom(
          url: room.avatarUrl,
        ),
        title: Text(room.name),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildListStory() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => AvatarCustom(
            url:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9f592d59-36be-4be8-bfae-16ad6c1e4877/dfkqk0m-418a089a-8a35-4eeb-ac94-16ac85365958.jpg/v1/fill/w_1280,h_2276,q_75,strp/gundam_aerial_by_darkfreedom23_dfkqk0m-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjI3NiIsInBhdGgiOiJcL2ZcLzlmNTkyZDU5LTM2YmUtNGJlOC1iZmFlLTE2YWQ2YzFlNDg3N1wvZGZrcWswbS00MThhMDg5YS04YTM1LTRlZWItYWM5NC0xNmFjODUzNjU5NTguanBnIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.RJYPmvVgqF0pGKEV0tmzpcwjWGmAuKtyG3KvzckVvLs',
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
