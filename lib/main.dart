import 'package:flutter/material.dart';
import 'package:qr_app/screens/Firstslider.dart';
import 'package:qr_app/screens/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Splash(),
    );
  }
}
