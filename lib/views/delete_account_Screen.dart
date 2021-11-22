import 'package:flutter/material.dart';

import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({Key key}) : super(key: key);

  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Delete Account',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 ),

        ),
        actions: [],
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
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: CustomSurffixIcon(
                                    svgIcon: 'assets/icons/del.svg',
                                    size: 40,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  border:
                                      Border.all(color: Colors.grey.withOpacity(.4), width: 1)),
                              height: 80,
                              width: 80,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 25, right: 25, top: 40 , ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Are you sure you want to delete your account?",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.poppins(fontSize: 16 , fontWeight: FontWeight.w700 ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Deleting your account will delete all your data from this app and you won’t be able to recover it.",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.poppins(fontSize: 12 , fontWeight: FontWeight.w400 ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            DefaultButton(
                                title: 'Delete Account', press: () async {}),
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
    );
  }
}
