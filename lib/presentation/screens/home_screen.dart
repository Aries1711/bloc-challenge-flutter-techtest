// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dev_test_github_search/constants/ui_constant.dart';
import 'package:dev_test_github_search/presentation/widgets/list_item_feature.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: colorGithub,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'assets/images/github.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Hy, Everyone',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: colorPrimary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  'Im, Arisqi Setyawan who will impress you!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: colorPrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: Text(
                  'in this flutter dev test bloc library i will show you much more awesome feature as an extention from the requirement!, the following feature is :',
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
              ListItemFeatures(
                title: "Internet Connection Status Streams",
                subtitle:
                    "Hy, try to connect and disconnect your internet use wifi or mobile data",
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                          size.width, 60) // put the width and height you want
                      ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/main');
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  label: Text("TO THE MAIN PAGE"),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
