import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/Colors.dart';
import 'package:qr_app/componentes/appBar.dart';
import 'package:qr_app/settings/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      appBar: customAppBar('Settings', AppColor.backGroundColor, context),
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isDarkMode
                    ? Image(
                        image: AssetImage('images/dark.png'),
                        height: 200,
                      )
                    : Image(
                        image: AssetImage('images/light.png'),
                        height: 200,
                      ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    !isDarkMode ? 'Light mode' : 'Dark mode',
                    style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: AppColor.mainColor),
                  ),
                ),
                Transform.scale(
                    scale: 4,
                    child: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                      activeColor: Colors.blue,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.shade600,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
