import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plasticity/components/custom_radio_list.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/create_account/create_account_2.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key key}) : super(key: key);

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final _formKey = GlobalKey<FormState>();

   List<Gender> genders = [
    Gender(
        name: 'Male',
        icon : Icons.male,
        isSelected: false),
    Gender(
        name: 'Female',
        icon : Icons.female,
        isSelected: false),
    Gender(
        name: 'Others',
        icon : Icons.transgender,
        isSelected: false)
  ];

  int valueHolder = 100;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title:Text(
          'Create Group',
            style:  AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700  )
        ),
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10 , right: 10 , top: 10),
              child: CustomSurffixIcon(
                svgIcon: 'assets/icons/add_avatar.svg',
                size: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10 , right: 10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key:  _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp("[a-z]")),
                        ],
                        validator: (val){
                          if(val.isEmpty || val.length < 2 ){
                            return 'Group Name* is required';
                          }
                          return null;
                        },

                        decoration: InputDecoration(labelText: 'Group Name*' ,
                          labelStyle:  AppTextStyle.poppins(fontWeight: FontWeight.w400  )
                            ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        'Maximum members',
                        textAlign: TextAlign.left,
                          style:  AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: Colors.black  )

                      ),
                      Slider(
                          value: valueHolder.toDouble(),
                          min: 1,
                          max: 100,
                          divisions: 100,
                          activeColor: kColorPrimary,
                          inactiveColor: Colors.grey.withOpacity(.4),
                          label: '${valueHolder.round()}',
                          onChanged: (double newValue) {
                            setState(() {
                              valueHolder = newValue.round();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '${newValue.round()}';
                          }
                      ),

                      SizedBox(height: 10),
                      Text(
                        'Age range',
                        textAlign: TextAlign.left,
                          style:  AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400  , fontColor: Colors.black )

                      ),
                      RangeSlider(
                        
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
                        divisions: 5,
                        activeColor: kColorPrimary,
                        inactiveColor: Colors.grey.withOpacity(.4),
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Gender',
                        textAlign: TextAlign.left,
                          style:  AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w400 , fontColor: Colors.black  )
                      ),

                      SizedBox(height: 10,),
                      chipList(),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            //shrinkWrap: true,
                            itemCount: genders.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                //  splashColor: Colors.pinkAccent,
                                onTap: () {
                                  setState(() {
                                    genders.forEach((gender) => gender.isSelected = false);
                                    genders[index].isSelected = true;
                                  });
                                },
                                child: CustomRadio(genders[index]),
                              );
                            }),
                      ),


                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter(RegExp("[a-z]")),
                        ],
                        validator: (val){
                          if(val.isEmpty || val.length < 2 ){
                            return 'Requirements is required';
                          }
                          return null;
                        },

                        decoration: InputDecoration(labelText: 'Requirements' ,
                           labelStyle:  AppTextStyle.poppins( fontWeight: FontWeight.w400  )
                            ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding:  const EdgeInsets.only(left: 0.0, right: 0.0, top: 25, bottom: 15),
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
                              onPressed: (){},
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(40),
                              //
                              // ),
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                              // color: kColorPrimary,
                              child: Text(
                                'Save changes',
                                 style:  AppTextStyle.poppins(fontSize: 15 , fontWeight: FontWeight.w700  , fontColor: Colors.white )

                              ),
                            ),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
    );
  }
}
