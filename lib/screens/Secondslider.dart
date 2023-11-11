import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/screens/Thirdslider.dart';

class Secondslide extends StatefulWidget {
  const Secondslide({super.key});

  @override
  State<Secondslide> createState() => _SecondslideState();
}

class _SecondslideState extends State<Secondslide> {
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
                      image: AssetImage('images/second.png'),
                      height: 280,
                    ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
                    Text(
                      "Scan Any Qr Code",
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
                    SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            iconSize: 60,
                            icon: Icon(
                              Icons.arrow_circle_left,
                              color: AppColor.secondBackGroundColor,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Thidslide(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Next',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.mainColor,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColor.mainColor,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.secondBackGroundColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          'images/secondp.png',
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
