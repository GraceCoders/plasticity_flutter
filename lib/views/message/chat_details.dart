import 'package:flutter/material.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/model/message.dart';
import 'package:plasticity/model/user.dart';
import 'package:plasticity/views/message/message_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatModel chatModel;

  ChatScreen({ this.chatModel});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      //width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? kColorPrimary : Color(0xFFF2F4F5),
        borderRadius:isMe ? BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(40)
        ): BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(40),
        )
      ),
      // decoration: BoxDecoration(
      //   color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
      //   borderRadius: isMe
      //       ? BorderRadius.only(
      //           topLeft: Radius.circular(15.0),
      //           bottomLeft: Radius.circular(15.0),
      //         )
      //       : BorderRadius.only(
      //           topRight: Radius.circular(15.0),
      //           bottomRight: Radius.circular(15.0),
      //         ),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

         // SizedBox(height: 8.0),
          Text(
            message.text,
            style:isMe ?
            AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor:  Colors.white ):
               AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: Colors.black  ),

          ),
        ],
      ),
    );
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            msg,
            Text(
              message.time,
                style:  AppTextStyle.poppins(fontSize: 12 , fontWeight: FontWeight.w400 , fontColor:  Color(0xff7a7a7a) )
             ),

          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          msg,
          Text(
              message.time,
              style:  AppTextStyle.poppins(fontSize: 12 , fontWeight: FontWeight.w400 , fontColor:  Color(0xff7a7a7a) )

          ),

        ],
      ),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      //margin: EdgeInsets.only(left: 5 , right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40)
      ),

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)

        )),
        elevation: 5.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.photo),
              //   iconSize: 25.0,
              //   color: Theme.of(context).primaryColor,
              //   onPressed: () {},
              // ),
              Expanded(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {},
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type here...',
                  ),
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(20.0)

                )),
                color: kColorPrimary,
                padding: EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                onPressed: (){

                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0 , bottom: 20),
                  child: Icon(Icons.send , color: Colors.white,),
                )
              ),
            ],
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leadingWidth: 30,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chatModel.avatarUrl),
            ),
            SizedBox(width: 10,),
            Text(
              widget.chatModel.name,
                style:  AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700  )

            ),
          ],
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            child: CustomSurffixIcon(
              svgIcon: 'assets/icons/call.svg',
              size: 30,
            ),
          ),
          GestureDetector(
            onTap: () => _showDialog(context),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, right: 5, bottom: 0),
              child: CustomSurffixIcon(
                svgIcon: 'assets/icons/menu_black.svg',
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      isDismissible: true,
      builder: (context) => WillPopScope(
        onWillPop: () async => true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/error.svg',
                    size: 30,
                  ),
                  Text(
                      '  Report',
                      textAlign: TextAlign.left,
                    style:  AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor:  kDarkGrayBlack )

                  ),
                ],
              ),
              Divider(thickness: 1 , color: Colors.grey,),
              Row(
                children: [
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/del.svg',
                    size: 30,
                  ),
                  Text(
                      '  Clear Chat',
                      textAlign: TextAlign.left,
                    style:  AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor: kDarkGrayBlack )

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
