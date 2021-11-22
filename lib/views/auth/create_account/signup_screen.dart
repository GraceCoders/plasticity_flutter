import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/create_account_2.dart';
import 'package:plasticity/views/auth/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dob = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Create an account' ,
            style:  AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700  ),
          ),
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
                                padding: const EdgeInsets.only(top: 10.0 , left: 50 , right: 50),
                                child: CustomSurffixIcon(
                                  svgIcon:
                                      'assets/icons/step1.svg',
                                  size: 70,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username',
                                        textAlign: TextAlign.left,
                                        style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400  ),

                                      ),
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: name,
                                        validator: (val){
                                         // String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                                         // RegExp regExp = new RegExp(p);
                                          if(val.isEmpty ){
                                            return 'Username is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // labelText: 'Email',
                                          helperText: ' ',
                                          hintStyle:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  , fontColor:Colors.grey[400]  ),

                                          contentPadding: EdgeInsets.only(
                                              top: 0, bottom: 0, left: 0),
                                          // fillColor: Colors.grey[100],
                                          // filled: true,
                                          hintText: 'Enter your username',
                                          // border: OutlineInputBorder(
                                          //     borderRadius:
                                          //     BorderRadius.circular(12),
                                          //     borderSide: BorderSide(
                                          //         color: Colors.grey,
                                          //         width: 1))
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Email',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),

                                      ),
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: email,
                                        validator: (val){
                                          String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                                          RegExp regExp = new RegExp(p);
                                          if(val.isEmpty  || !regExp.hasMatch(val) ){
                                            return 'Email is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // labelText: 'Email',
                                          helperText: ' ',
                                          hintStyle: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  , fontColor: Colors.grey[400]  ),

                                          contentPadding: EdgeInsets.only(
                                              top: 0, bottom: 0, left: 0),
                                          // fillColor: Colors.grey[100],
                                          // filled: true,
                                          hintText: 'Enter your Email address',
                                          // border: OutlineInputBorder(
                                          //     borderRadius:
                                          //     BorderRadius.circular(12),
                                          //     borderSide: BorderSide(
                                          //         color: Colors.grey,
                                          //         width: 1))
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Password',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),

                                      ),
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: password,
                                        validator: (val){
                                          // String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          // RegExp regExp = new RegExp(p);
                                          if(val.isEmpty ){
                                            return 'Password is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // labelText: 'Email',
                                          helperText: ' ',
                                          hintStyle: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  , fontColor: Colors.grey[400]  ),

                                          contentPadding: EdgeInsets.only(
                                              top: 0, bottom: 0, left: 0),
                                          // fillColor: Colors.grey[100],
                                          // filled: true,
                                          hintText: 'Enter your password',
                                          // border: OutlineInputBorder(
                                          //     borderRadius:
                                          //     BorderRadius.circular(12),
                                          //     borderSide: BorderSide(
                                          //         color: Colors.grey,
                                          //         width: 1))
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Bio',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),
                                      ),
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: bio,
                                        validator: (val){
                                          // String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          // RegExp regExp = new RegExp(p);
                                          if(val.isEmpty ){
                                            return 'About yourself is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // labelText: 'Email',
                                          helperText: ' ',
                                          hintStyle: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  , fontColor:  Colors.grey[400],  ),

                                          contentPadding: EdgeInsets.only(
                                              top: 0, bottom: 0, left: 0),
                                          // fillColor: Colors.grey[100],
                                          // filled: true,
                                          hintText: 'Write something about you',
                                          // border: OutlineInputBorder(
                                          //     borderRadius:
                                          //     BorderRadius.circular(12),
                                          //     borderSide: BorderSide(
                                          //         color: Colors.grey,
                                          //         width: 1))
                                        ),
                                      ),

                                      SizedBox(
                                        width: 5,
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                                    return CreateAccount2Screen();
                                  }));
                               //   Get.to(CreateAccount2Screen());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                                          return CreateAccount2Screen();
                                        }));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30.0 , right: 10.0),
                                        child: CustomSurffixIcon(
                                          svgIcon:
                                          'assets/icons/next_arrow.svg',
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
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
                          style: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500  , fontColor: kDarkGrayBlack  ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Log in',
                              style: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500  , fontColor: kColorPrimary  ),

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
        ));
  }
}
