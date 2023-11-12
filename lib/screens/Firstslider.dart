import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/screens/Secondslider.dart';

class Firstslide extends StatelessWidget {
  const Firstslide({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Container(
          child: Stack(
            children: [
              Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image(
                      image: AssetImage('images/first.png'),
                      height: 280,
                    ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
                    Text(
                      "Generate your ",
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColor.backGroundColor),
                    ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " own QR Code ",
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColor.backGroundColor),
                    ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
                    SizedBox(
                      height: 120,
                    ),
                    IconButton(
                      iconSize: 60,
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: AppColor.secondBackGroundColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Secondslide(),
                          ),
                        );
                      },
                    )
                        .animate()
                        .fade(duration: 500.ms)
                        .scale(delay: 500.ms)
                        .fade(delay: 500.ms),
                  ],
                ),
              ),
              Positioned(
                top: 550,
                child: Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'images/firstp.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
