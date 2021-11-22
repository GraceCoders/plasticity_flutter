import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';

import 'custom_surfix_icon.dart';

class SelectButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final String assets;
  final String selectedAssets;
  bool isSelected = false;
   SelectButton({ this.title,  this.press , this.assets , this.selectedAssets,    this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding:  const EdgeInsets.only(left: 20.0, right: 20.0, top: 25, bottom: 15),
        child: Container(
          height: 53,
          width: MediaQuery.of(context).size.width / 3,
         // margin: EdgeInsets.only(left: 40 , right: 40),
          decoration: BoxDecoration(
            color: isSelected ? kColorPrimary : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            border: Border.all(color: kColorPrimary , width: 1)
          ),
          // ignore: deprecated_member_use
          child: FlatButton(
            //  height: 50,
            onPressed: press,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            // color: kColorPrimary,
            child: Row(
              children: [
                isSelected ?  Padding(
                  padding: const EdgeInsets.only(top: 1.0 , left: 0 , right: 2),
                  child: CustomSurffixIcon(
                    svgIcon:
                    'assets/icons/$selectedAssets',
                    size: 30,
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.only(top: 1.0 , left: 0 , right: 2),
                  child: CustomSurffixIcon(
                    svgIcon:
                    'assets/icons/$assets',
                    size: 30,
                  ),
                ),
                Text(
                  title,
                  style: AppTextStyle.poppins(fontSize: 15, fontWeight: FontWeight.w700 , fontColor: isSelected ?  Colors.white : Colors.black,   ),

                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}