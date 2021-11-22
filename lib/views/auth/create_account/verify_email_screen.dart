import 'package:flutter/material.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/dashboard_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Verify Email',
            style:  AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700 ),
          ),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Center(
            //     child: Text(
            //       'Skip',
            //       style: GoogleFonts.poppins(fontSize: 14, color: kColorPrimary, fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // ),
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
                                    top: 30.0, left: 50, right: 50 , bottom: 40),
                                child: CustomSurffixIcon(
                                  svgIcon: 'assets/icons/email.svg',
                                  size: 100,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    Text(
                                      'You must have recieved a verification code your email. Enter the code below to proceed.',
                                      textAlign: TextAlign.center,
                                      style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400 ),

                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      'Email',
                                      textAlign: TextAlign.left,
                                      style:  AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400 ),

                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            controller: otp,
                                            validator: (val){
                                              if(val.isEmpty  ){
                                                return 'Email is required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              // labelText: 'Email',
                                              helperText: ' ',
                                              hintStyle:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor:  Colors.grey[400] ),

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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DefaultButton(
                                  title: 'Submit',
                                  press: () async {
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (BuildContext context){
                                      return DashboardScreen();
                                    }),  (Route<dynamic> route) => false )
                                    ;
                                  }),
                              //SizedBox(height: 10,),
                              GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                  //   return SignUpScreen();
                                  // }));
                                  // Get.to(SignUpScreen());
                                },
                                child: Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: "Didn't recieved?",
                                          style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500 , fontColor: kDarkGrayBlack ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Resend',
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
