import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plasticity/components/custom_radio_1.dart';
import 'package:plasticity/components/custom_radio_list.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/components/outline_button.dart';
import 'package:plasticity/components/select_container.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/create_account_3.dart';
import 'package:plasticity/views/auth/create_account/create_account_4_screen.dart';
import 'package:plasticity/views/auth/create_account/select_location_screen.dart';
import 'package:plasticity/views/auth/signin_screen.dart';

class CreateAccount2Screen extends StatefulWidget {
  @override
  _CreateAccount2ScreenState createState() => _CreateAccount2ScreenState();
}

class _CreateAccount2ScreenState extends State<CreateAccount2Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController religion = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dob = TextEditingController();

  bool isGenderSelected = false;
  bool isInterestSelected = false;

   List<Gender> genders = [
  Gender(
  name: 'Male',
  icon : Icons.male,
  isSelected: false),
  Gender(
  name: 'Female',
      icon : Icons.female,
  isSelected: false),
  Gender(
  name: 'Others',
      icon : Icons.transgender,
  isSelected: false)
  ];

   List<Interests> interests = [
    Interests(
        name: 'Male',
        icon : Icons.male,
        isSelected: false),
    Interests(
        name: 'Female',
        icon : Icons.female,
        isSelected: false),
    Interests(
        name: 'Others',
        icon : Icons.transgender,
        isSelected: false)
  ];

  @override
  void initState() {
    super.initState();

    // genders.add(new Gender(:"Male", , false));
    // genders.add(new Gender("Female", MdiIcons.genderFemale, false));
    // genders.add(new Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Create an account',
            style: AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700   ),
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
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 50, right: 50),
                                child: CustomSurffixIcon(
                                  svgIcon: 'assets/icons/step2.svg',
                                  size: 70,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, top: 20),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gender',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),

                                      ),
                                      SizedBox(height: 15,),
                                      chipList(),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            //shrinkWrap: true,
                                            itemCount: genders.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                              //  splashColor: Colors.pinkAccent,
                                                onTap: () {
                                                  setState(() {
                                                    genders.forEach((gender) => gender.isSelected = false);
                                                    genders[index].isSelected = true;
                                                  });
                                                },
                                                child: CustomRadio(genders[index]),
                                              );
                                            }),
                                      ),
                                      SizedBox(height: 20,),
                                      Text(
                                        'Religion',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),
                                      ),
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: religion,
                                        validator: (val) {
                                          // String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          // RegExp regExp = new RegExp(p);
                                          if (val.isEmpty) {
                                            return 'Religion is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // labelText: 'Email',
                                          helperText: ' ',
                                          hintStyle: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  , fontColor: Colors.grey[400]  ),

                                          contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 0),
                                          // fillColor: Colors.grey[100],
                                          // filled: true,
                                          hintText: 'What is your religion?',
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
                                      Text('Language Spoken',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),

                                      ),
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        controller: email,
                                        validator: (val) {
                                          String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regExp = new RegExp(p);
                                          if (val.isEmpty || !regExp.hasMatch(val)) {
                                            return 'Language is required';
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
                                          hintText: 'Select the language you know',
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
                                        'Interested in',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400   ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            //shrinkWrap: true,
                                            itemCount: interests.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                //  splashColor: Colors.pinkAccent,
                                                onTap: () {
                                                  setState(() {
                                                    interests.forEach((gender) =>
                                                    gender.isSelected = false);
                                                    interests[index].isSelected =
                                                    true;
                                                  });
                                                },
                                                child: CustomInterestRadio(interests[index]),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(CreateAccount3());
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
                      ),
                    ],
                  ),
                ),
              ),
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


  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }



}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender({ this.name,  this.icon,  this.isSelected});


}

class Interests {
  String name;
  IconData icon;
  bool isSelected;

  Interests({ this.name,  this.icon,  this.isSelected});
}
