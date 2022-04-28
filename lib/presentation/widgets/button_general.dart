// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonGeneral extends StatelessWidget {
  final VoidCallback onPress;
  final Color backgroundColor;
  final String textButton;
  final Color textColor;

  const ButtonGeneral(
      {Key? key,
      required this.onPress,
      required this.backgroundColor,
      required this.textButton,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              textButton,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
