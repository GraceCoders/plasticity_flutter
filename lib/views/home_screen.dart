import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/views/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading:  Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 10, right: 0 , bottom: 0),
            child: CustomSurffixIcon(
              svgIcon: 'assets/icons/avatar1.svg',
              size: 30,
            ),
          ),
          title:Text(
            'Hi! John',
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 ),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(NotificationScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 0, right: 10 , bottom: 0),
                child: CustomSurffixIcon(
                  svgIcon: 'assets/icons/notification.svg',
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Container());
  }
}
