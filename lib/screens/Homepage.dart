import 'package:flutter/material.dart';
import 'package:qr_app/Colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_app/screens/Mainpage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 234,
            ),
            Container(
              width: double.infinity,
              child: Image(
                height: 170,
                width: 170,
                image: AssetImage('images/1.png'),
              ),
            ),
            SizedBox(
              height: 180,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColor.mainColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 27,
                    ),
                    Text(
                      "Lest's start",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.backGroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: AppColor.backGroundColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
