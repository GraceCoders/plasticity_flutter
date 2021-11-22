import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';


class DefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const DefaultButton({ this.title,  this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding:  const EdgeInsets.only(left: 20.0, right: 20.0, top: 25, bottom: 15),
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
              onPressed: press,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(40),
              //
              // ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
             // color: kColorPrimary,
              child: Text(
                title,
                  style: AppTextStyle.poppins(fontSize: 15, fontWeight: FontWeight.w700 , fontColor:  Colors.white  )  ,

              ),
            ),

        ),
      ),
    );
  }
}
