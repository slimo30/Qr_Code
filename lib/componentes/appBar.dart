import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_app/Colors.dart';

AppBar customAppBar(
    String titleText, Color containerColor, BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: AppColor.backGroundColor,
    title: Text(
      titleText,
      style: GoogleFonts.inter(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        color: AppColor.mainColor,
      ),
    ),
    centerTitle: true,
    leading: Row(
      children: [
        SizedBox(width: 40),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Navigate back when the arrow is pressed
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.mainColor,
              size: 30,
            ),
          ),
        ),
      ],
    ),
    leadingWidth: 100,
  );
}
