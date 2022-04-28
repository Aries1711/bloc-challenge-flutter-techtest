// ignore_for_file: prefer_const_constructors

import 'package:dev_test_github_search/constants/ui_constant.dart';
import 'package:dev_test_github_search/data/models/username.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardUsernameItem extends StatelessWidget {
  UsernameModel usernameData;

  CardUsernameItem(
    this.usernameData, {
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 5, bottom: 10, left: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width,
      height: 80,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(usernameData.imageUrl),
              backgroundColor: colorTransparent,
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              child: Text(
                usernameData.name,
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorPrimary,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
