import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/verify_email_screen.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({Key key}) : super(key: key);

  @override
  _EnableLocationScreenState createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Your location',
            style: AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700   ),

          ),
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(VerifyEmailScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Skip',
                    style: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500  , fontColor: kColorPrimary  ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40.0, left: 50, right: 50),
                                child: CustomSurffixIcon(
                                  svgIcon: 'assets/icons/illus1.svg',
                                  size: 300,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),

                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              DefaultButton(
                                  title: 'Enable location',
                                  press: () async {
                                  Get.to(VerifyEmailScreen());
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
