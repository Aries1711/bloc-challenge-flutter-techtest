// ignore_for_file: prefer_const_constructors

import 'package:dev_test_github_search/constants/ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabIndexingOrder extends StatelessWidget {
  final VoidCallback? onPress;
  final String label;
  final int pageSelected, pageNumber;
  final Size size;

  const TabIndexingOrder({
    Key? key,
    required this.onPress,
    required this.label,
    required this.pageSelected,
    required this.pageNumber,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        height: 100,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: pageSelected == pageNumber ? colorGithub : colorWhite,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(5.0),
            topRight: const Radius.circular(5.0),
            bottomLeft: const Radius.circular(5.0),
            bottomRight: const Radius.circular(5.0),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: pageSelected == pageNumber ? colorWhite : colorGithub,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
