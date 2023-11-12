import 'package:flutter/material.dart';
import 'package:qr_app/Colors.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;

    if (_isDarkMode) {
      AppColor.backGroundColor = Colors.black;
      AppColor.mainColor = const Color.fromRGBO(92, 166, 176, 1);
      AppColor.secondBackGroundColor = const Color.fromRGBO(28, 28, 28, 1);
      AppColor.textFeaildColor = const Color.fromRGBO(217, 217, 217, 1);
    } else {
      AppColor.backGroundColor = Colors.white;
      AppColor.mainColor = const Color.fromRGBO(92, 166, 176, 1);
      AppColor.secondBackGroundColor = const Color.fromRGBO(217, 217, 217, 1);
      AppColor.textFeaildColor = const Color.fromRGBO(28, 28, 28, 1);
    }

    notifyListeners();
  }
}
