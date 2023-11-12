import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/componentes/appBar.dart';
import 'package:qr_app/componentes/elevatedButton.dart';
import 'package:qr_app/settings/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class GenrateQrcode extends StatefulWidget {
  const GenrateQrcode({super.key});

  @override
  State<GenrateQrcode> createState() => _GenrateQrcodeState();
}

class _GenrateQrcodeState extends State<GenrateQrcode> {
  final TextEditingController qrCodeController = TextEditingController();
  final ScreenshotController screenshotController = ScreenshotController();
  Future<void> captureAndSaveImage() async {
    final Uint8List? unit8list = await screenshotController.capture();
    if (unit8list != null) {
      final PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        final result = await ImageGallerySaver.saveImage(unit8list);
        if (result['isSuccess']) {
          print('image saved successfully');
        } else {
          print('image not saved successfully ${result['error']}');
        }
      } else {
        print('Permission to access denied');
      }
    }
  }

  String data = "";

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColor.backGroundColor : AppColor.textFeaildColor,
      appBar: customAppBar(
        'Generate Qr Code',
        isDarkMode ? AppColor.secondBackGroundColor : AppColor.textFeaildColor,
        context,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: isDarkMode
                  ? AppColor.secondBackGroundColor
                  : AppColor.textFeaildColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Screenshot(
                        controller: screenshotController,
                        child: QrImageView(
                          data: data,
                          version: QrVersions.auto,
                          size: 230,
                          backgroundColor: Colors.white,
                          gapless: false,
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage('images/4.png'),
                      width: 250,
                      height: 250,
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColor.textFeaildColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppColor.textFeaildColor,
                      ),
                      controller: qrCodeController,
                      onChanged: (value) {
                        setState(() {
                          qrCodeController.text = value;
                        });
                      },
                      cursorColor: AppColor.textFeaildColor,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter Data',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textFeaildColor,
                        ),
                      ),
                    ),
                  ),
                ),
                customElevatedButton(
                  buttonText: 'Generate Qr Code',
                  onPressed: () {
                    setState(() {
                      data = qrCodeController.text;
                    });
                  },
                ),
                customElevatedButton(
                  onPressed: () async {
                    await captureAndSaveImage();
                  },
                  buttonText: 'Download QR Code',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
