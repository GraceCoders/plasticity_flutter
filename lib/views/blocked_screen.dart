import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'message/message_screen.dart';


class BlockedContactScreen extends StatefulWidget {
  const BlockedContactScreen({Key key}) : super(key: key);

  @override
  _BlockedContactScreenState createState() => _BlockedContactScreenState();
}

class _BlockedContactScreenState extends State<BlockedContactScreen> {

  static final List<ChatModel> matchesList = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Jessica Zane",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Lizzy Parker",
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
          'Blocked',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700  ),
        ),
        actions: [

        ],
      ),
      body: ListView.builder(
        itemCount: matchesList.length,
        itemBuilder: (context, index) {
          ChatModel _model = matchesList[index];
          // return ListTile,
          return Container(
            margin: EdgeInsets.only(left: 20 , right: 20 , top: 25),
            padding: EdgeInsets.only(top: 8),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
            //     border: Border.all(color: Colors.grey , width: 1)
            // ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    //   return ChatScreen(chatModel: dummyData[index],);
                    // }));
                  },
                  //   contentPadding: EdgeInsets.symmetric(vertical: 0 , horizontal: 4),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(_model.avatarUrl),
                  ),
                  //  minLeadingWidth: 40,
                  title: Text(
                    _model.name,
                    style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w700  ),

                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only( top: 8.0),
                    child: Container(
                      height: 53,
                      width:  120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(width: 1 , color: kColorPrimary)
                      ),
                      child: Center(
                        child: Text('Unblock' ,
                          style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w500 , fontColor: kColorPrimary  ),
                        ),
                      ),
                      // ignore: deprecated_member_use
                    ),
                  ),

                ),
                SizedBox(height: 5,),
                Divider(thickness: 1, color: Colors.grey.withOpacity(.5),)
              ],
            ),
          );
        },
      )
    );
  }
}
