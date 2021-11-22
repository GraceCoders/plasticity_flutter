import 'package:flutter/material.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Contact Us',
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 ),

          ),
          actions: [

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
                                    top: 30.0, left: 50, right: 50 , bottom: 20),
                                child: CustomSurffixIcon(
                                  svgIcon: 'assets/icons/contact.svg',
                                  size: 250,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25, right: 25, top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(
                                      'Your query',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle.poppins(fontSize: 12 , fontWeight: FontWeight.w400 ),

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
                                                return 'Query is required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              // labelText: 'Email',
                                              helperText: ' ',
                                              hintStyle: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: Colors.grey[400] ),

                                              contentPadding: EdgeInsets.only(
                                                  top: 0, bottom: 0, left: 0),
                                              // fillColor: Colors.grey[100],
                                              // filled: true,
                                              hintText: 'Enter your query',

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
        ));
  }
}
