// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:dev_test_github_search/constants/ui_constant.dart';
import 'package:dev_test_github_search/presentation/widgets/card_issues_item.dart';
import 'package:dev_test_github_search/presentation/widgets/card_repositories_items.dart';
import 'package:dev_test_github_search/presentation/widgets/card_username_item.dart';
import 'package:dev_test_github_search/presentation/widgets/list_item_feature.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  final String title;
  MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 170),
            child: NotificationListener(
              onNotification: (t) {
                if (t is ScrollEndNotification) {
                  print(_scrollController.position.pixels);
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListItemFeatures(
                      title: "Internet Connection Status Streams",
                      subtitle:
                          "Hy, try to connect and disconnect your internet use wifi or mobile data",
                    ),
                    CardUsernameItem(size: size),
                    CardIssuesItem(size: size),
                    CardRepositoriesItem(size: size)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
              width: size.width * 0.9,
              height: 40,
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              width: size.width,
              height: 100,
              color: colorOrange,
            ),
          )
        ],
      ),
    );
  }
}
