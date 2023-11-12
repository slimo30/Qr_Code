import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/componentes/appBar.dart';
import 'package:qr_app/settings/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  final qKey = GlobalKey(debugLabel: 'QR');
  Barcode? code;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void copyCodeToClipboard(Barcode? code, BuildContext context) {
    if (code != null) {
      Clipboard.setData(ClipboardData(text: '${code.code}')).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Text copied to clipboard: Result ${code.code}',
                style:
                    TextStyle(fontSize: 16, color: AppColor.textFeaildColor)),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backGroundColor,
        appBar: customAppBar(
            'Scan Qr Code',
            isDarkMode ? AppColor.backGroundColor : AppColor.textFeaildColor,
            context),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              bottom: 150,
              left: 0,
              right: 0,
              child: buildQrView(context),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: buildResult(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.7,
        borderLength: 30,
        borderWidth: 30,
        borderColor: AppColor.mainColor,
        borderRadius: 20,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((code) {
      setState(() {
        this.code = code;
      });
    });
  }

  Widget buildResult(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return GestureDetector(
      onTap: () {
        copyCodeToClipboard(code, context);
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            color: AppColor.mainColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: EdgeInsets.all(12.0),
          child: Text(
            code != null ? 'Copy' : 'Scan Code',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: isDarkMode
                  ? AppColor.backGroundColor
                  : AppColor.textFeaildColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
