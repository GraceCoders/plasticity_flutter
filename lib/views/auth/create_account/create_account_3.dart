import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/create_account_4_screen.dart';
import 'package:plasticity/views/auth/create_account/select_avtar_screen.dart';

import '../signin_screen.dart';


class CreateAccount3 extends StatefulWidget {
  const CreateAccount3({Key key}) : super(key: key);

  @override
  _CreateAccount3State createState() => _CreateAccount3State();
}

class _CreateAccount3State extends State<CreateAccount3> {

  var tags = [
    "Advice",
    "Animals",
    "Art & Design",
    "Beauty",
    "Hobbies",
    "DIY & Home",
    "Entertainment",
    "Fashion",
    "Finance",
    "Food",
    "Gaming",
    "Health & Lifestyle",
    "Music",
    "News",
    "Outdoors",
    "Reading & Literature",
    "School",
    "Sports",
    "Travel & Nature",
  ];

  var selected_tags = ["love", "me", "summer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create an account',
            style:  AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700   )
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 50, right: 50),
                  child: CustomSurffixIcon(
                    svgIcon: 'assets/icons/step3.svg',
                    size: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10, right: 10, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Select your interests(Min. 3)',
                          textAlign: TextAlign.left,
                            style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400  )

                        ),
                      ),
                      SizedBox(height: 15,),
                      Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: <Widget>[...generate_tags()],
                      ),
                     // SizedBox(height: 20,),

                      GestureDetector(
                        onTap: (){
                          Get.to(CreateAccount4Screen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding (
                              padding: const EdgeInsets.only(top: 60.0, right: 10.0),
                              child: CustomSurffixIcon(
                                svgIcon: 'assets/icons/next_arrow.svg',
                                size: 60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                GestureDetector(
                  onTap: () {
                    Get.to(SignInScreen());
                  },
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Already have an account?",
                            style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500 , fontColor: kDarkGrayBlack  ),

                            children: <TextSpan>[
                              TextSpan(
                                text: ' Log in',
                            style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500 , fontColor: kColorPrimary  ),

                              ),
                              // can add more TextSpans here...
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  generate_tags() {
    return tags.map((tag) => get_chip(tag)).toList();
  }

  get_chip(name) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(left: 10 , right: 10 , top: 10),
          decoration: BoxDecoration(
              border: Border.all(color: kColorPrimary , width: 1 ),
              borderRadius: BorderRadius.circular(40.0)
          ),
          child: Text(
            name,
            style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: kDarkBlack  ),

          ),
        )
      // labelPadding: EdgeInsets.all(5.0),
      // label: Text(
      //   name,
      //   style: TextStyle(
      //     color: Colors.black,
      //   ),
      // ),
      //
      // backgroundColor: Colors.white,
      // elevation: 6.0,
      // shadowColor: Colors.white,
      // padding: EdgeInsets.all(6.0),
    );
  }
}
