import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/componentes/componentes1.dart';
import 'package:qr_app/screens/GenerateQrCode.dart';
import 'package:qr_app/screens/ScanQrCode.dart';
import 'package:qr_app/settings/Settings.dart';
import 'package:qr_app/settings/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColor.backGroundColor : AppColor.textFeaildColor,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
            color: isDarkMode
                ? AppColor.backGroundColor
                : AppColor.textFeaildColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settings(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.settings,
                            size: 25,
                            color: AppColor.mainColor,
                          ),
                          label: Text(
                            'Settings',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColor.mainColor),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                isDarkMode
                                    ? AppColor.backGroundColor
                                    : AppColor.textFeaildColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCardWidget(
                    imagePath: 'images/2.png',
                    buttonText: "Scan Qr code",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanQrCode(),
                      ),
                    ),
                  ),
                  CustomCardWidget(
                    imagePath: 'images/3.png',
                    buttonText: "Generate Qr code",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenrateQrcode(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
