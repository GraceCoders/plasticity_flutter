import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/select_location_screen.dart';

class SelectAvatarScreen extends StatefulWidget {

  @override
  _SelectAvatarScreenState createState() => _SelectAvatarScreenState();

}

class _SelectAvatarScreenState extends State<SelectAvatarScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController religion = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dob = TextEditingController();

  bool isGenderSelected = false;
  bool isInterestSelected = false;

 // XFile _image ;

  String genderValue = 'avatar1.svg';

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
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Select Avatar',
            style: AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700    ),

          ),
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(EnableLocationScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20),
                child: Text(
                  'Skip',
                  style: AppTextStyle.poppins(fontSize: 16, fontWeight: FontWeight.w500    ),

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //   margin: EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 8),
                              //   decoration: BoxDecoration(
                              //     // border: Border.all(
                              //     //     color: Colors.grey, width: 1),
                              //       borderRadius: BorderRadius.circular(16)),
                              //   height: (MediaQuery.of(context).size.width ) * .4 ,
                              //   width: (MediaQuery.of(context).size.width) ,
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(12),
                              //     child: _image != null ? Image.file(File(_image.path)) :  CustomSurffixIcon(
                              //       svgIcon: 'assets/icons/$genderValue',
                              //       size: 100,
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25, right: 25, top: 20),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                           GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                genderValue = 'avatar1.svg';
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color: Colors.grey, width: 1),
                                                  borderRadius: BorderRadius.circular(16)),
                                              height: (MediaQuery.of(context).size.width / 4) - 1,
                                              width: (MediaQuery.of(context).size.width / 4) - 6,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child:  CustomSurffixIcon(
                                                    svgIcon: 'assets/icons/avatar1.svg',
                                                    size: 70,
                                                  ),
                                              ),
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                genderValue = 'avatar2.svg';
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                  //border: Border.all(
                                                      // color: Colors.grey, width: 1),
                                                  borderRadius: BorderRadius.circular(16)),
                                              height: (MediaQuery.of(context).size.width / 4) - 1,
                                              width: (MediaQuery.of(context).size.width / 4) - 6,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: CustomSurffixIcon(
                                                    svgIcon: 'assets/icons/avatar2.svg',
                                                    size: 70,
                                                  ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                genderValue = 'avatar3.svg';
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color: Colors.grey, width: 1),
                                                  borderRadius: BorderRadius.circular(16)),
                                              height: (MediaQuery.of(context).size.width / 4) - 1,
                                              width: (MediaQuery.of(context).size.width / 4) - 6,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child:  CustomSurffixIcon(
                                                    svgIcon: 'assets/icons/avatar3.svg',
                                                    size: 70,
                                                  ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                genderValue = 'avatar4.svg';
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color: Colors.grey, width: 1),
                                                  borderRadius: BorderRadius.circular(16)),
                                              height: (MediaQuery.of(context).size.width / 4) - 1,
                                              width: (MediaQuery.of(context).size.width / 4) - 6,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: CustomSurffixIcon(
                                                    svgIcon: 'assets/icons/avatar4.svg',
                                                    size: 70,
                                                  ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                genderValue = 'avatar5.svg';
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color: Colors.grey, width: 1),
                                                  borderRadius: BorderRadius.circular(16)),
                                              height: (MediaQuery.of(context).size.width / 4) - 1,
                                              width: (MediaQuery.of(context).size.width / 4) - 6,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child:  CustomSurffixIcon(
                                                    svgIcon: 'assets/icons/avatar5.svg',
                                                    size: 70,
                                                  ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                genderValue = 'avatar6.svg';
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                  // border: Border.all(
                                                  //     color: Colors.grey, width: 1),
                                                  borderRadius: BorderRadius.circular(16)),
                                              height: (MediaQuery.of(context).size.width / 4) - 1,
                                              width: (MediaQuery.of(context).size.width / 4) - 6,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child:  CustomSurffixIcon(
                                                    svgIcon: 'assets/icons/avatar6.svg',
                                                    size: 70,
                                                  ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap:(){
                                        //  _imgFromGallery();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 28, right: 0, top: 20, bottom: 0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1),
                                              borderRadius: BorderRadius.circular(40)),
                                          height: 80,
                                          width: 80 ,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child:  Icon(Icons.add)
                                          ),
                                        ),
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
              DefaultButton(
                  title: 'Done',
                  press: () async {
                    Get.to(EnableLocationScreen());
                  }),
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
