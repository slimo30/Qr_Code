import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/Colors.dart';

import 'package:qr_app/screens/Splash.dart';
import 'package:qr_app/settings/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
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
