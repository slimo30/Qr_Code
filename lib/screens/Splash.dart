import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/screens/Firstslider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
    debugPrint('test');
  }

  _navigatehome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Firstslide(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Image(
            image: AssetImage(
              'images/qr.png',
            ),
          ),
        ),
      )
          .animate()
          .fade(duration: 500.ms)
          .scale(delay: 500.ms)
          .fade(delay: 500.ms),
    );
  }
}
