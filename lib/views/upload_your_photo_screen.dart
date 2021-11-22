import 'package:flutter/material.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';

class UploadYourPhotoScreen extends StatefulWidget {
  const UploadYourPhotoScreen({Key key}) : super(key: key);

  @override
  _UploadYourPhotoScreenState createState() => _UploadYourPhotoScreenState();
}

class _UploadYourPhotoScreenState extends State<UploadYourPhotoScreen> {
  // XFile _image ;
  //
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
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          'Your Photos',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700),
         // style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [

        ],
      ),
      body:  Padding(
        padding: EdgeInsets.only(
            left: 5, right: 5, top: 20),
        child: Form(
         // key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Upload your photos',
              //   textAlign: TextAlign.left,
              //   style: GoogleFonts.poppins(
              //       fontSize: 12,
              //       fontWeight: FontWeight.w400),
              // ),
              SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // _image !=null ?
                  // Container(
                  //   margin: EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                  //   decoration: BoxDecoration(
                  //     //  border: Border.all(color: Colors.grey, width: 1),
                  //       borderRadius: BorderRadius.circular(16),
                  //       image: DecorationImage(
                  //           image: FileImage(File(_image.path)),
                  //           fit: BoxFit.cover
                  //       )
                  //   ),
                  //   height: (MediaQuery.of(context).size.width / 4) - 1,
                  //   width: (MediaQuery.of(context).size.width / 4) - 6,
                  //
                  //   //  child:  Image.file(File(_image!.path) , fit: BoxFit.cover,),
                  //
                  // )
                  //     : GestureDetector(
                  //   onTap:(){
                  //     _imgFromGallery();
                  //   },
                  //   child: CustomSurffixIcon(
                  //     svgIcon: 'assets/icons/add_img.svg',
                  //     size: 120,
                  //   ),
                  // ),
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/add_img.svg',
                    size: 120,
                  ),
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/add_img.svg',
                    size: 120,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/add_img.svg',
                    size: 120,
                  ),
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/add_img.svg',
                    size: 120,
                  ),
                  CustomSurffixIcon(
                    svgIcon: 'assets/icons/add_img.svg',
                    size: 120,
                  ),
                ],
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
