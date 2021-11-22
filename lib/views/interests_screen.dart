import 'package:flutter/material.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key key}) : super(key: key);

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {

  var tags = [
    "Advice",
    "Animals",
    "Art & Design",
    "Beauty",
    "Hobbies",
    "DIY & Home",
    "Entertainment",
    "Fashion",
    "Finance",
    "Food",
    "Gaming",
    "Health & Lifestyle",
    "Music",
    "News",
    "Outdoors",
    "Reading & Literature",
    "School",
    "Sports",
    "Travel & Nature",
  ];

  var selected_tags = ["love", "me", "summer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          'Interests',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15 , right: 15 , top: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[...generate_tags()],
              ),
            ),
            DefaultButton(title: 'Save', press: (){},)
          ],
        ),
      ),

    );
  }

  Widget chip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(5.0),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    );
  }

  generate_tags() {
    return tags.map((tag) => get_chip(tag)).toList();
  }

  get_chip(name) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(left: 10 , right: 10 , top: 10),
        decoration: BoxDecoration(
            border: Border.all(color: kColorPrimary , width: 1 ),
            borderRadius: BorderRadius.circular(40.0)
        ),
        child: Text(
          name,
          style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: kDarkBlack),

        ),
      )
      // labelPadding: EdgeInsets.all(5.0),
      // label: Text(
      //   name,
      //   style: TextStyle(
      //     color: Colors.black,
      //   ),
      // ),
      //
      // backgroundColor: Colors.white,
      // elevation: 6.0,
      // shadowColor: Colors.white,
      // padding: EdgeInsets.all(6.0),
    );
  }
}
