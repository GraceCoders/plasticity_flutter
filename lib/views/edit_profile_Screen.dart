import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/interests_screen.dart';
import 'package:plasticity/views/upload_your_photo_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();

}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController timezoneController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController authPersonController = TextEditingController();
  TextEditingController authPersonNumberController = TextEditingController();

  String selectedGender = 'Select a gender';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          'Edit profile',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: double.infinity,
        margin: EdgeInsets.only(left: 15 , right: 15 , top: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0 , right: 0 , top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                      onTap: (){
                        Get.to(UploadYourPhotoScreen());
                      },
                      title:  Text( 'Your Photos' ,
                        style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor: kMediumBlack),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CustomSurffixIcon(
                          svgIcon: 'assets/icons/images.svg',
                          size: 30,
                        ),
                      ),
                      trailing:  Icon(Icons.arrow_forward_ios_rounded ,color: kMediumBlack , size: 20, ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 0.0 , right: 0.0),
                      child: Divider(color: Colors.grey.withOpacity(.5),thickness: 1,),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0 , right: 0 , top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: (){
                        Get.to(InterestsScreen());
                      },
                      contentPadding: EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                      title:  Text( 'Interests' ,
                        style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor: kMediumBlack),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CustomSurffixIcon(
                          svgIcon: 'assets/icons/interests.svg',
                          size: 30,
                        ),
                      ),
                      trailing:  Icon(Icons.arrow_forward_ios_rounded ,color: kMediumBlack , size: 20, ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0 , right: 0.0),
                      child: Divider(color: Colors.grey.withOpacity(.5),thickness: 1,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text('Other details' ,
                style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w700 , fontColor: kMediumBlack),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Form(
                  key:  _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp("[a-z]")),
                        ],
                        validator: (val){
                          if(val.isEmpty || val.length < 2 ){
                            return 'Bio is required';
                          }
                          return null;
                        },
                        controller: businessNameController,
                        decoration: InputDecoration(labelText: 'Bio' ,
                          labelStyle: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: kLightGrey),
                        ),
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp("[a-z]")),
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val){
                          if(val.isEmpty ){
                            return 'Birthday is required';
                          }
                          return null;
                        },
                        controller: addressController,
                        decoration: InputDecoration(
                            helperText: ' ',
                            labelText: 'Birthday' ,
                          labelStyle: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: kLightGrey),

                        ),
                      ),
                      GestureDetector (
                        onTap: () => _showGenderDialog,
                        child: TextFormField (
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if(val.isEmpty ) {
                              return 'Gender is required';
                            }
                            return null;
                          },
                          readOnly: true,
                          controller: businessEmailController,
                          decoration: InputDecoration(
                            hintText: selectedGender,
                              labelText: 'Gender ' ,
                            labelStyle: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: kLightGrey),

                          ),
                        ),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp("[a-z]")),
                        ],
                        controller: authPersonController,
                        validator: (val){
                          if(val.isEmpty  ){
                            return 'Religion is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration (
                            labelText: 'Religion ' ,
                          labelStyle: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: kLightGrey),

                        ),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly,
                        ],
                        validator: (val){
                          if(val.isEmpty || val.length < 10){
                            return 'Language Spoken is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: phonenoController,
                        decoration:
                        InputDecoration(labelText: 'Language Spoken ' ,
                          labelStyle: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: kLightGrey),

                        ),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        validator: (val){
                          if(val.isEmpty || val.length < 10){
                            return 'Interested In is required';
                          }
                          return null;
                        },
                        controller: phonenoController,
                        decoration: InputDecoration(labelText: 'Interested In ' ,
                            labelStyle: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w400 , fontColor: kLightGrey),


                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding:  const EdgeInsets.only(left: 0.0, right: 0.0, top: 25, bottom: 15),
                      child: Container(
                        height: 53,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
                          onPressed: (){},
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(40),
                          //
                          // ),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          // color: kColorPrimary,
                          child: Text(
                            'Save changes',
                            style: AppTextStyle.poppins(fontSize: 15 , fontWeight: FontWeight.w700 , fontColor: Colors.white),


                          ),
                        ),

                      ),
                    ),
                  )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _showGenderDialog(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/error.svg',
                    size: 30,
                  ),
                  Text(
                      '  Report',
                      textAlign: TextAlign.left,
                      style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor: kDarkGrayBlack),

                  ),
                ],
              ),
              Divider(thickness: 1 , color: Colors.grey,),
              Row(
                children: [
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/del.svg',
                    size: 30,
                  ),
                  Text(
                      '  Clear Chat',
                      textAlign: TextAlign.left,
                      style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w500 , fontColor: kDarkGrayBlack),


                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
