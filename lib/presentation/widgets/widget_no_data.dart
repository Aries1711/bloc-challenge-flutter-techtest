// ignore_for_file: prefer_const_constructors

import 'package:dev_test_github_search/constants/ui_constant.dart';
import 'package:dev_test_github_search/presentation/widgets/button_general.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetNoData extends StatelessWidget {
  final String imagePath, title, subtitle, titleButton;
  final bool showButton;
  final VoidCallback onPressButton;

  const WidgetNoData(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.showButton,
      required this.titleButton,
      required this.onPressButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              imagePath,
              width: size.width * 0.5,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colorPrimary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: showButton,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: ButtonGeneral(
                    onPress: onPressButton,
                    backgroundColor: colorGithub,
                    textButton: titleButton,
                    textColor: colorWhite,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
