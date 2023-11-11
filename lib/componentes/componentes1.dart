import 'package:flutter/material.dart';
import 'package:qr_app/componentes/elevatedButton.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onPressed;

  CustomCardWidget({
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 200,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 130,
            height: 130,
          ),
          SizedBox(
            height: 50,
          ),
          customElevatedButton(
            buttonText: buttonText,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
