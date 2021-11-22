import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/components/explore_json.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/payment_screen.dart';

class CardDetailScreen extends StatefulWidget {

  const CardDetailScreen({Key key}) : super(key: key);

  @override
  _CardDetailScreenState createState() => _CardDetailScreenState();

}

class _CardDetailScreenState extends State<CardDetailScreen> {

  List itemsTemp = [];
  int itemLength = 0;

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
      backgroundColor: Colors.black.withOpacity(.3),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(''),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: CustomSurffixIcon(
              svgIcon: 'assets/icons/cross_white.svg',
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
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
                              style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w700 , fontColor: Colors.white  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(itemsTemp[index]['age'],
                              textAlign: TextAlign.center,
                              style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: Colors.white  ),
                          ),
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
                  style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 , fontColor: kDarkBlack  ),

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
                            style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w700 , fontColor: kDarkBlack  ),

                          ),
                          SizedBox(height: 10,),
                          Text(
                            '\$8.99/month',
                            style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w500 , fontColor: kColorPrimary  ),

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
