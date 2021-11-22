import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/message/message_screen.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key key}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();

}

class _GroupScreenState extends State<GroupScreen> {

  String screenType = "myProfile";
  String secondScreenType = "about";

  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Football",
      datetime: "08:15 PM",
      message: "Jessica: Lorem ipsum dolor sit...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Cricket",
      datetime: "08:15 PM",
      message: "Henry: Duis aute irure dolor in...",
    ),

  ];
  static final List<ChatModel> dummyData1 = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Gaming",
      datetime: "08:15 PM",
      message: "Lizzy: Duis aute irure dolor in...",
    ),

  ];
  static final List<ChatModel> dummyData2 = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Gamers (Boys)",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Basketball",
      datetime: "08:15 PM",
      message: "Lorem ipsum dolor sit, consectetu...",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Groups',
            style:  AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700   )

        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 0, right: 10, bottom: 0),
            child: CustomSurffixIcon(
              svgIcon: 'assets/icons/search.svg',
              size: 25,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(left: 20 , right: 20),
                // padding: EdgeInsets.only(left: 20 , right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.grey.withOpacity(.4)),
                  color: Colors.white,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            screenType = "myProfile";
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.3),
                              //     spreadRadius: 1,
                              //     blurRadius: 2,
                              //     offset: Offset(0, 3), // changes position of shadow
                              //   ),
                              // ],
                              color: screenType == "myProfile"
                                  ? kColorPrimary
                                  : Colors.white,
                              border: Border.all(
                                color: screenType == "myProfile"
                                    ? kColorPrimary
                                    : Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text("Your groups",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                          style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w700 , fontColor: screenType == "myProfile"
                           ? Colors.white
                             : Color(0xff001561), )
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            screenType = "schoolProfile";
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.3),
                              //     spreadRadius: 1,
                              //     blurRadius: 2,
                              //     offset: Offset(0, 3), // changes position of shadow
                              //   ),
                              // ],
                              color: screenType == "schoolProfile"
                                  ? kColorPrimary
                                  : Colors.white,
                              border: Border.all(
                                  color: screenType == "schoolProfile"
                                      ? kColorPrimary
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text("Suggested",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                            style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w700 , fontColor: screenType == "schoolProfile"
                              ? Colors.white
                                 : Color(0xff001561), )
                               ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          screenType == 'myProfile'
              ? Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 8, bottom: 8),
                      child: Text("Created by you",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700 , fontColor: Color(0xff3A4A3F)  )

                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: dummyData.length,
                        itemBuilder: (context, index) {
                          ChatModel _model = dummyData[index];
                          // return ListTile,
                          return ListTile(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                              //   return ChatScreen(chatModel: dummyData[index],);
                              // }));
                            },
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(_model.avatarUrl),
                            ),
                            title: Row(
                              children: <Widget>[
                                Text(
                                  _model.name,
                                style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w700  )
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              _model.message,
    style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 )

                            ),
                            trailing: Text(
                              _model.datetime,
    style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   )


                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Divider(
                              color: Colors.grey.withOpacity(.5),
                              thickness: 1,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 8, bottom: 8),
                      child: Text("Others groups",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                  style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700 , fontColor: Color(0xff3A4A3F)  )
     ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: dummyData1.length,
                        itemBuilder: (context, index) {
                          ChatModel _model = dummyData1[index];
                          // return ListTile,
                          return ListTile(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                              //   return ChatScreen(chatModel: dummyData[index],);
                              // }));
                            },
                            leading: CircleAvatar(
                             radius: 30,
                              backgroundImage: NetworkImage(_model.avatarUrl),
                            ),
                            title: Row(
                              children: <Widget>[
                                Text(
                                  _model.name,
                                style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700  )

                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              _model.message,
                              style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  )

                            ),
                            trailing: Text(
                              _model.datetime,
                            style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   )

                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Divider(
                              color: Colors.grey.withOpacity(.5),
                              thickness: 1,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: dummyData2.length,
                    itemBuilder: (context, index) {
                      ChatModel _model = dummyData2[index];
                      // return ListTile,
                      return Container(

                        margin: EdgeInsets.only(left: 20 , right: 20 , top: 15),
                        padding: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          border: Border.all(color: Colors.grey , width: 1)
                        ),
                        child: Column(
                          children: [
                            ListTile(

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
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    _model.name,
                                  style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700  )
                                  ),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only( top: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.group , color: kColorPrimary,),
                                    SizedBox(width: 10,),
                                    Text(
                                      '50',
                                       style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  )

                                    ),
                                    SizedBox(width: 30,),
                                    Text(
                                      'View requirements',
                                    style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: kColorPrimary )

                                    ),
                                  ],
                                ),
                              ),

                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 53,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight : Radius.circular(20.0),
                                    bottomLeft : Radius.circular(20.0)),
                                gradient: LinearGradient(
                                    colors: [
                                      kColorPrimary,
                                      kColorPrimaryBtn,
                                    ]
                                ),
                              ),
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                //  height: 50,
                                onPressed: () => _showDialog(context),
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(40),
                                //
                                // ),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                // color: kColorPrimary,
                                child: Text(
                                  'Join group',
                                 style:  AppTextStyle.poppins(fontSize: 15, fontWeight: FontWeight.w700 , fontColor: Colors.white  )

                                ),
                              ),

                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Gender',
                      textAlign: TextAlign.left,
            style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack  )

                  ),
                  Text(
                      'Location',
                      textAlign: TextAlign.left,
                    style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack  )
                  ),
                  Text(
                      'Age',
                      textAlign: TextAlign.left,
                    style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack  )

                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Male   ',
                      textAlign: TextAlign.left,
                style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w400 , fontColor: kDarkGrayBlack  )

                  ),
                  Text(
                      'Sydney  ',
                      textAlign: TextAlign.left,
                    style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: kDarkGrayBlack  )

                  ),
                  Text(
                      '20-60',
                      textAlign: TextAlign.left,
                    style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: kDarkGrayBlack  )

                  ),
                ],
              ),
              SizedBox(height: 16),
            Text(
              'Requirements',
              textAlign: TextAlign.left,
              style:  AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack  )

            ),

              SizedBox(height: 10),
             // text,
             // textField,
              SizedBox(height:  10),
              DefaultButton(
                  title: 'Join group',
                  press: () async {
                    Navigator.of(context).pop();
                  }),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
