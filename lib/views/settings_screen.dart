import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/blocked_screen.dart';
import 'package:plasticity/views/contact_us_screen.dart';
import 'package:plasticity/views/delete_account_Screen.dart';
import 'package:plasticity/views/edit_profile_Screen.dart';
import 'package:plasticity/views/matches_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  static final List<ChatModel> dummyData = [
    ChatModel(
      name: "Edit profile",
    ),
    ChatModel(
      name: "Matches",
    ),
    ChatModel(
      name: "Blocked Contacts",
    ),
    ChatModel(
      name: "Delete Account",
    ),
    ChatModel(
      name: "Contact Us",
    ),
    ChatModel(
      name: "Terms & Conditions",
    ),
    ChatModel(
      name: "Privacy Policy",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(
            'Settings',
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700),
          ),
          actions: [

          ],
        ),
        body: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                image: DecorationImage(
                  image: NetworkImage('https://randomuser.me/api/portraits/women/77.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                     backgroundColor : kColorPrimary,
                      child: Icon(Icons.edit , color: Colors.white,)
                  )
                ],
              ),

            ),
            SizedBox(height: 50,),
            Expanded(
              child: ListView.builder(
                itemCount: dummyData.length ,
                itemBuilder: (context, index) {
                  ChatModel _model = dummyData[index];
                  // return ListTile,
                  if(dummyData.length == index + 1){
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Center(child: Text('Logout' ,
                          style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor:kColorPrimary ),
                          ),)
                    );
                  }
                  return GestureDetector(
                    onTap: (){
                      if(index == 0){
                        Get.to(EditProfileScreen());
                      }
                      if(index == 1){
                        Get.to(MatchesScreen());
                      }
                      if(index == 2){
                        Get.to(BlockedContactScreen());
                      }
                      if(index == 3 ){
                        Get.to(DeleteAccountScreen());
                      }
                      if(index == 4 ){
                        Get.to(ContactUsScreen());
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15 , right: 15 , top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                             Text(_model.name ,
                               style: AppTextStyle.poppins(fontSize: 16 , fontColor: kMediumBlack , fontWeight: FontWeight.w500),
                            ),
                              Icon(Icons.arrow_forward_ios_rounded ,color: kMediumBlack , size: 20, )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0 , right: 0.0),
                            child: Divider(color: Colors.grey.withOpacity(.5),thickness: 1,),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        )
    );
  }
}

class ChatModel {

  final String name;


  ChatModel({ this.name});
}
