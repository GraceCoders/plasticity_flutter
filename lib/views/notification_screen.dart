import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Send message",
      datetime: "08:15 PM",
      message: "You are now a member of Basketball group",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Send message",
      datetime: "08:15 PM",
      message: "It’s a match!",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/77.jpg",
      name: "Send message",
      datetime: "08:15 PM",
      message: "Ammy Henry liked  your profile",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(
            'Notifications',
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700),
          ),
          actions: [

          ],
        ),
        body: ListView.separated(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            ChatModel _model = dummyData[index];
            // return ListTile,
            return ListTile(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                //   return ChatScreen();
                // }));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_model.avatarUrl),
              ),
              title:  Text(_model.message ,
                style: AppTextStyle.poppins(fontSize: 15 , fontWeight: FontWeight.w400),
               ),
              subtitle: Text(_model.name ,
                style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: kColorPrimary),
                ),
              trailing: Text(
                _model.datetime,
                style: AppTextStyle.poppins(fontSize: 12 , fontWeight: FontWeight.w400 , fontColor: kGray),

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
