import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// import 'package:image_picker/image_picker.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/select_avtar_screen.dart';
import 'package:plasticity/views/auth/signin_screen.dart';

class CreateAccount4Screen extends StatefulWidget {

  @override
  _CreateAccount4ScreenState createState() => _CreateAccount4ScreenState();

}

class _CreateAccount4ScreenState extends State<CreateAccount4Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController religion = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dob = TextEditingController();

  bool isGenderSelected = false;
  bool isInterestSelected = false;

    // XFile _image ;

  @override
  void initState() {
    super.initState();

    // genders.add(new Gender(:"Male", , false));
    // genders.add(new Gender("Female", MdiIcons.genderFemale, false));
    // genders.add(new Gender("Others", MdiIcons.genderTransgender, false));

  }

  // _imgFromGallery() async {
  //   final ImagePicker _picker = ImagePicker();
  //   XFile image = await  _picker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50
  //   );
  //
  //   setState(() {
  //     _image = image;
  //   });
  // }

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 50, right: 50),
                                child: CustomSurffixIcon(
                                  svgIcon: 'assets/icons/step4.svg',
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
                                        'Upload your photos',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.poppins(fontSize: 12, fontWeight: FontWeight.w400    ),

                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                      // _image !=null ?    Container(
                                      //       margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                      //       decoration: BoxDecoration(
                                      //         //  border: Border.all(color: Colors.grey, width: 1),
                                      //           borderRadius: BorderRadius.circular(16),
                                      //         image: DecorationImage(
                                      //           image: FileImage(File(_image.path)),
                                      //           fit: BoxFit.cover
                                      //         )
                                      //       ),
                                      //       height: (MediaQuery.of(context).size.width / 4) - 1,
                                      //       width: (MediaQuery.of(context).size.width / 4) - 6,
                                      //
                                      //     //  child:  Image.file(File(_image!.path) , fit: BoxFit.cover,),
                                      //
                                      //     )
                                      //         : GestureDetector(
                                      //       onTap:(){
                                      //         _imgFromGallery();
                                      //       },
                                      //       child: Container(
                                      //         margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                      //         decoration: BoxDecoration(
                                      //             border: Border.all(
                                      //                 color: Colors.grey, width: 1),
                                      //             borderRadius: BorderRadius.circular(16)),
                                      //         height: (MediaQuery.of(context).size.width / 4) - 1,
                                      //         width: (MediaQuery.of(context).size.width / 4) - 6,
                                      //         child: ClipRRect(
                                      //             borderRadius: BorderRadius.circular(12),
                                      //             child:  Icon(
                                      //                 Icons.add
                                      //             )
                                      //         ),
                                      //       ),
                                      //     ),
                                          Container(
                                            margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius.circular(16)),
                                            height: (MediaQuery.of(context).size.width / 4) - 1,
                                            width: (MediaQuery.of(context).size.width / 4) - 6,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child:  Icon(
                                                    Icons.add
                                                )
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius.circular(16)),
                                            height: (MediaQuery.of(context).size.width / 4) - 1,
                                            width: (MediaQuery.of(context).size.width / 4) - 6,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child:  Icon(
                                                    Icons.add
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius.circular(16)),
                                            height: (MediaQuery.of(context).size.width / 4) - 1,
                                            width: (MediaQuery.of(context).size.width / 4) - 6,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child:  Icon(
                                                    Icons.add
                                                )
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius.circular(16)),
                                            height: (MediaQuery.of(context).size.width / 4) - 1,
                                            width: (MediaQuery.of(context).size.width / 4) - 6,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child:  Icon(
                                                    Icons.add
                                                )
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey, width: 1),
                                                borderRadius: BorderRadius.circular(16)),
                                            height: (MediaQuery.of(context).size.width / 4) - 1,
                                            width: (MediaQuery.of(context).size.width / 4) - 6,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child:  Icon(
                                                    Icons.add
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),

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
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DefaultButton(
                      title: 'Done',
                      press: () async {
                        Get.to(SelectAvatarScreen());
                      }),
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
                              style: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w500  , fontColor: kDarkGrayBlack   ),

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

            ],
          ),
        )
    );
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
