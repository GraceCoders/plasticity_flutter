import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:get/get.dart';

import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/components/explore_json.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/card_details_screen.dart';
import 'package:plasticity/views/payment_screen.dart';
import 'package:search_page/search_page.dart';
import 'notification_screen.dart';

/*
Title:ExploreScreen
Purpose:ExploreScreen
Created By:Kalpesh Khandla
*/

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  static final List<ChatModel> searchData = [
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

  // late CardController controller;

  List itemsTemp = [];
  int itemLength = 0;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding:
              const EdgeInsets.only(top: 0.0, left: 10, right: 0, bottom: 0),
          child: CustomSurffixIcon(
            svgIcon: 'assets/icons/avatar1.svg',
            size: 30,
          ),
        ),
        title: Text(
          'Hi! John',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 ),

        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 0, right: 10, bottom: 0),
              child: CustomSurffixIcon(
                svgIcon: 'assets/icons/notification.svg',
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          searchWidget(),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return CardDetailScreen();
              }));
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 1.7,
              child: TinderSwapCard(
                totalNum: itemLength,
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * 0.75,
                minWidth: MediaQuery.of(context).size.width * 0.75,
                minHeight: MediaQuery.of(context).size.height * 0.6,
                cardBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 2),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(itemsTemp[index]['img']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.25),
                                Colors.black.withOpacity(0),
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(itemsTemp[index]['name'],
                                  style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w700 , fontColor: Colors.white),

                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(itemsTemp[index]['age'],
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: Colors.white),),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    itemsTemp[index]['likes'].length,
                                    (indexLikes) {
                                  if (indexLikes == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          // color:   Colors.white
                                          //     .withOpacity(0.4)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            itemsTemp[index]['likes']
                                                [indexLikes],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.circular(30),
                                        // color:   Colors.white
                                        //     .withOpacity(0.4)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          itemsTemp[index]['likes'][indexLikes],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                  // print(itemsTemp.length);
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                  if (index == (itemsTemp.length - 1)) {
                    setState(() {
                      itemLength = itemsTemp.length - 1;
                    });
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSurffixIcon(
                svgIcon: 'assets/icons/dislike.svg',
                size: 90,
              ),
              GestureDetector(
                onTap: () => showProductLoaderDialog(context),
                child: CustomSurffixIcon(
                  svgIcon: 'assets/icons/superlike.svg',
                  size: 90,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CustomSurffixIcon(
                  svgIcon: 'assets/icons/like.svg',
                  size: 90,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget searchWidget() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: TextField(
        readOnly: true,
        onTap: () {
          showSearch(
              context: context,
              delegate: SearchPage(
                barTheme: ThemeData(
                    appBarTheme: AppBarTheme(
                        elevation: 0,
                        iconTheme: IconThemeData(color: Colors.black),
                        backgroundColor: Colors.white),
                    iconTheme: IconThemeData(color: Colors.black)),
                onQueryUpdate: (s) {},
                items: searchData,
                searchLabel: 'Search ',
                suggestion: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Popular groups',
                          style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w700 ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomSurffixIcon(
                              svgIcon: 'assets/icons/popular.svg',
                              size: 30,
                            ),
                            Text(
                              'Soccer',
                              style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomSurffixIcon(
                              svgIcon: 'assets/icons/popular.svg',
                              size: 30,
                            ),
                            Text('Cricket',
                                style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomSurffixIcon(
                              svgIcon: 'assets/icons/popular.svg',
                              size: 30,
                            ),
                            Text('Basketball',
                                style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 ),

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                failure: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Center(
                      child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search results',
                          style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w700 ),

                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: dummyData2.length,
                            itemBuilder: (context, index) {
                              ChatModel _model = dummyData2[index];
                              // return ListTile,
                              return Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
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
                                        backgroundImage:
                                            NetworkImage(_model.avatarUrl),
                                      ),
                                      title: Row(
                                        children: <Widget>[
                                          Text(
                                            _model.name,
                                            style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w700 ),

                                          ),
                                          SizedBox(
                                            width: 16.0,
                                          ),
                                        ],
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.group,
                                              color: kColorPrimary,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '50',
                                              style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400),

                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              'View requirements',
                                              style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: kColorPrimary),

                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 53,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0)),
                                        gradient: LinearGradient(colors: [
                                          kColorPrimary,
                                          kColorPrimaryBtn,
                                        ]),
                                      ),
                                      // ignore: deprecated_member_use
                                      child: FlatButton(
                                        onPressed: () {},
                                        //  height: 50,
                                        //  onPressed: () => _showDialog(context),
                                        // shape: RoundedRectangleBorder(
                                        //   borderRadius: BorderRadius.circular(40),
                                        //
                                        // ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 12),
                                        // color: kColorPrimary,
                                        child: Text(
                                          'Join group',
                                          style: AppTextStyle.poppins(fontSize: 15 , fontWeight: FontWeight.w700 , fontColor: Colors.white),

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
                  )),
                ),
                filter: (product) => [
                  // product.productID,
                ],
                builder: (product) => GestureDetector(
                  onTap: () async {
                    // Navigator.of(context)
                    //     .pop();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder:
                    //             (context) =>
                    //             ProductDetailsScreen(
                    //               showEditButtons:
                    //               true,
                    //               liked:
                    //               true,
                    //               productID:
                    //               product.productID,
                    //             )));
                  },
                  child: ListTile(
                    title: Text('ff'),
                    trailing: Text('ffff'),
                  ),
                ),
              ));
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: 'Search Product',
            hintStyle: AppTextStyle.poppins( fontWeight: FontWeight.w300),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            )),
      ),
    );
  }

  showProductLoaderDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(vertical: 5 , horizontal: 0),
            titlePadding: EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSurffixIcon(
                  svgIcon: 'assets/icons/superlike.svg',
                  size: 80,
                ),
                Text(
                  'Superlikes',
                  style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 , fontColor: kDarkBlack),
                ),
                SizedBox(height: 10,)
              ],
            ),
            content:   Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context , index){
                    return Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(left: 10 , right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: kColorPrimary , width: 1 ),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Advance',
                            style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w700 , fontColor: kDarkBlack),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            '\$8.99/month',
                            style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w500 , fontColor: kColorPrimary),

                          ),
                        ],
                      ),
                    );
                  }),
            ),

            actions: [
              DefaultButton(
                title: 'Buy superlikes',
                press: (){
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                 return PaymentScreen();
               }));

                },
              )
            ],
          );
        });
  }
}
