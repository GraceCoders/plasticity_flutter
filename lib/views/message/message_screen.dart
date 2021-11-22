import 'package:flutter/material.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/views/message/chat_details.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  static final List<ChatModel> dummyData = [
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
      avatarUrl: "https://randomuser.me/api/portraits/women/77.jpg",
      name: "Lizzy Parker",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/81.jpg",
      name: "Ammy Henry",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
      name: "Elizabeth Gray",
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
            'Messages',
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700  ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 0, right: 10 , bottom: 0),
              child: CustomSurffixIcon(
                svgIcon: 'assets/icons/search.svg',
                size: 25,
              ),
            ),
          ],
        ),
      body: ListView.separated(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          ChatModel _model = dummyData[index];
          // return ListTile,
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return ChatScreen(chatModel: dummyData[index],);
              }));
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_model.avatarUrl),
            ),
            title: Row(
              children: <Widget>[
                Text(_model.name ,
                  style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w700  ),),
                SizedBox(
                  width: 16.0,
                ),

              ],
            ),
            subtitle: Text(_model.message ,
              style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400  ),),
            trailing: Text(
              _model.datetime,
              style: AppTextStyle.poppins(fontSize: 12 , fontWeight: FontWeight.w400  ),

            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0 , right: 15.0),
            child: Divider(color: Colors.grey.withOpacity(.5),thickness: 1,),
          );
      },)
    );
  }
}

class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  ChatModel({ this.avatarUrl,  this.name, this.datetime, this.message});
}
