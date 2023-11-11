import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_app/Colors.dart';

Widget customElevatedButton({
  required String buttonText,
  required Function() onPressed,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.mainColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
    onPressed: onPressed,
    child: Container(
      alignment: Alignment.center,
      width: 200,
      height: 50,
      child: Text(
        buttonText,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColor.backGroundColor,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
