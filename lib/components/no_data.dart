import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';

import 'custom_surfix_icon.dart';

class NoData extends StatelessWidget {
  const NoData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSurffixIcon(
              svgIcon: 'assets/icons/message_empty.svg',
              size: 100,
            ),
            Text('No Messages Yet!',
              style: AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700 ),

            ),
            SizedBox(height: 10,),
            Text('You have not received any messages yet. Please check back later.' ,
              style: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400  )  ),


          ],
        ),
      ),
    );
  }
}
