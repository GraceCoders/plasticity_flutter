import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasticity/components/bottom_sheet.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import '../dashboard_screen.dart';
import 'create_account/signup_screen.dart';

class SignInScreen extends StatefulWidget {

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
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
                      SizedBox(height: 8.5),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: CustomSurffixIcon(
                                svgIcon: 'assets/icons/logo.svg',
                                size: 160,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Log in to Plasticity',
                              style:  AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25, right: 25, top: 26),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      'Email',
                                      textAlign: TextAlign.left,
                                      style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400  ),
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
                                        hintStyle:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor:  Colors.grey[400]  ),
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
                                        style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400  ),
                                    ),
                                    TextFormField(
                                      // inputFormatters: <TextInputFormatter>[
                                      //   WhitelistingTextInputFormatter(RegExp("[a-z]")),
                                      // ],
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      controller: password,
                                      validator: (val) {
                                        if (val.isEmpty || val.length < 6) {
                                          return 'Password is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          helperText: ' ',
                                        hintStyle:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor:  Colors.grey[400]  ),

                                          contentPadding: EdgeInsets.only(
                                              top: 0, bottom: 0, left: 0),
                                          hintText: 'Enter your Password',
                                       // suffixIcon: Icon(Icons.remove_red_eye , color: Colors.grey[400],)
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () => _showDialog(context),
                                          child: Text(
                                            'Forgot Password ?',
                                              style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: kColorPrimary  ),

                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DefaultButton(
                                title: 'Log in',
                                press: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState?.save();
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (BuildContext context){
                                      return DashboardScreen();
                                    }),  (Route<dynamic> route) => false )
                                    ;
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => OTPScreen(
                                      //             number,
                                      //             businessName.text,
                                      //             firstName.text,
                                      //             lastName.text)));
                                  }
                                }),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return SignUpScreen();
                  }));
                 // Get.to(SignUpScreen());
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
                          text: "Don't have an account?",
                     style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500 , fontColor: kDarkGrayBlack  ),

                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign up',
                          style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500 , fontColor: kColorPrimary ),

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


  void _showDialog(BuildContext context) {
    showBottomDialog(
      context: context,
      allowBackNavigation: true,
      title: 'Forgot Password',
      content: 'Enter the email associated with your account so that we can send you the instructions to reset password.',
      text: Text(
        'Email',
        textAlign: TextAlign.left,
          style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400  ),

      ),
      textField:  TextFormField(
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
    hintStyle:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: Colors.grey[400]  ),
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
      btn:  DefaultButton(
          title: 'Send instructions',
          press: () async {
             Navigator.of(context).pop();
          }),
    );
  }
}
