import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';


Future showBottomDialog({
   BuildContext context,
   String title,
   String content,
   Widget text,
   Widget textField,
   Widget btn,
  bool allowBackNavigation = false,
}) {
  assert(title != null ,
  'title and titleWidget both must not be null');
  assert(content != null ,
  'content and contentWidget both must not be null');

  final theme = Theme.of(context);

  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    isDismissible: allowBackNavigation,
    builder: (context) => WillPopScope(
      onWillPop: () async => allowBackNavigation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                      style: AppTextStyle.poppins(fontSize: 20, fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack   ),

                  ),
                ),
            SizedBox(height: 16),
                Center(
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                      style: AppTextStyle.poppins(fontSize: 14, fontWeight: FontWeight.w400 , fontColor: kDarkGrayBlack   ),

                  ),
                ),
            SizedBox(height: 10),
            text,
            textField,
            SizedBox(height:  10),
            btn,
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}