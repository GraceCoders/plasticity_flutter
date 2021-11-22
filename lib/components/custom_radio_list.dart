import 'package:flutter/material.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/create_account_2.dart';

import 'custom_surfix_icon.dart';

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width / 3.8,
      margin: EdgeInsets.only(right: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: _gender.isSelected ? kColorPrimary : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          border: Border.all(color: kColorPrimary , width: 1)
      ),
     // margin: new EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            _gender.icon,
            color: _gender.isSelected ? Colors.white : kColorPrimary,
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            _gender.name,
            style: TextStyle(
                color: _gender.isSelected ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
