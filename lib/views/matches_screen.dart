import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'message/message_screen.dart';


class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key key}) : super(key: key);

  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  static final List<ChatModel> matchesList = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Jessica Zane",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Laurel Bone",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Lizzy Parker",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Ammy Henry",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(
            'Matches',
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700),
          ),
          actions: [

          ],
        ),
        body: GridView.builder(
          itemCount: matchesList.length,
          itemBuilder: (context, index) {
            ChatModel _model = matchesList[index];
            // return ListTile,
            return Container(
              margin: EdgeInsets.only(left: 20 , right: 20 , top: 15),
             // padding: EdgeInsets.only(top: 8),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //     border: Border.all(color: Colors.grey , width: 1)
              // ),
              child: Column(
                children: [
                CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(_model.avatarUrl),
              ),
              Text(
                _model.name,
                style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w700),

              ),
                ],
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: .4/.3

        ),
        )
    );
  }
}
