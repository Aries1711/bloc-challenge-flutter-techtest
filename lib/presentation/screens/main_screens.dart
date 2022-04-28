// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:dev_test_github_search/constants/ui_constant.dart';
import 'package:dev_test_github_search/constants/variable.dart';
import 'package:dev_test_github_search/logic/cubit/appbar_scrolling_cubit.dart';
import 'package:dev_test_github_search/logic/cubit/search_username_cubit.dart';
import 'package:dev_test_github_search/logic/cubit/tab_active_cubit.dart';
import 'package:dev_test_github_search/presentation/widgets/card_issues_item.dart';
import 'package:dev_test_github_search/presentation/widgets/card_repositories_items.dart';
import 'package:dev_test_github_search/presentation/widgets/card_username_item.dart';
import 'package:dev_test_github_search/presentation/widgets/tab_indexing_order.dart';
import 'package:dev_test_github_search/presentation/widgets/widget_no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String keywordsValue = "";
  GithubTypeSearch _githubType = GithubTypeSearch.User;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppbarScrollingCubit>(
          create: (context) => AppbarScrollingCubit(),
        ),
        BlocProvider<TabActiveCubit>(
          create: (context) => TabActiveCubit(),
        ),
        BlocProvider<SearchUsernameCubit>(
          create: (context) => SearchUsernameCubit(),
        )
      ],
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            BlocBuilder<AppbarScrollingCubit, AppbarScrollingState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: (() {
                    if (state.counterScroll > 0.0) {
                      var position = 120.0 - state.counterScroll;
                      if (position < 120) {
                        return 120.0;
                      } else {
                        return position;
                      }
                    }
                    return 220.0;
                  }())),
                  child: NotificationListener(
                    onNotification: (t) {
                      if (t is ScrollNotification) {
                        BlocProvider.of<AppbarScrollingCubit>(context)
                            .onScroll(_scrollController.position.pixels);
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child:
                          BlocBuilder<SearchUsernameCubit, SearchUsernameState>(
                        builder: (context, state) {
                          // RETURN VALUES FOR USERNAME
                          if (_githubType == GithubTypeSearch.User &&
                              state is SearchUsernameLoaded) {
                            final data = state;
                            if (data.usernameData.isEmpty) {
                              return WidgetNoData(
                                  imagePath: 'assets/images/github-octocat.png',
                                  title: 'Upps, Data Tidak Ditemukan',
                                  subtitle:
                                      'Hasil pencarian untuk $keywordsValue kosong',
                                  showButton: false,
                                  titleButton: "",
                                  onPressButton: () {});
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (var item in data.usernameData)
                                    CardUsernameItem(
                                      item,
                                      size: size,
                                    )
                                ],
                              );
                            }
                          } else if (state is SearchUsernameError) {
                            return WidgetNoData(
                                imagePath: 'assets/images/github-octocat.png',
                                title: 'Upps, Crash',
                                subtitle: 'To many Request Attempted',
                                showButton: false,
                                titleButton: "",
                                onPressButton: () {});
                          }

                          // RETURN VALUES FOR ISSUES
                          if (_githubType == GithubTypeSearch.Issues &&
                              state is SearchIssuesLoaded) {
                            final data = state;
                            if (data.issuesData.isEmpty) {
                              return WidgetNoData(
                                  imagePath: 'assets/images/github-octocat.png',
                                  title: 'Upps, Data Tidak Ditemukan',
                                  subtitle:
                                      'Hasil pencarian untuk $keywordsValue kosong',
                                  showButton: false,
                                  titleButton: "",
                                  onPressButton: () {});
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (var item in data.issuesData)
                                    CardIssuesItem(item, size: size)
                                ],
                              );
                            }
                          } else if (state is SearchIssuesnameError) {
                            return WidgetNoData(
                                imagePath: 'assets/images/github-octocat.png',
                                title: 'Upps, Crash',
                                subtitle: 'To many Request Attempted',
                                showButton: false,
                                titleButton: "",
                                onPressButton: () {});
                          }

                          //RETURN VALUE FOR REPOSITORIES
                          if (_githubType == GithubTypeSearch.Repositories &&
                              state is SearchRepositoriesLoaded) {
                            final data = state;
                            if (data.repositoriesData.isEmpty) {
                              return WidgetNoData(
                                  imagePath: 'assets/images/github-octocat.png',
                                  title: 'Upps, Data Tidak Ditemukan',
                                  subtitle:
                                      'Hasil pencarian untuk $keywordsValue kosong',
                                  showButton: false,
                                  titleButton: "",
                                  onPressButton: () {});
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (var item in data.repositoriesData)
                                    CardRepositoriesItem(item, size: size)
                                ],
                              );
                            }
                          } else if (state is SearchRepositoriesError) {
                            return WidgetNoData(
                                imagePath: 'assets/images/github-octocat.png',
                                title: 'Upps, Crash',
                                subtitle: 'To many Request Attempted',
                                showButton: false,
                                titleButton: "",
                                onPressButton: () {});
                          }
                          return WidgetNoData(
                              imagePath: 'assets/images/github-octocat.png',
                              title: 'Upps, Data Kosong',
                              subtitle:
                                  'Yuk, Mulai mencari dari pilih kategory terus masukkan keyword kamu',
                              showButton: false,
                              titleButton: "",
                              onPressButton: () {});
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<AppbarScrollingCubit, AppbarScrollingState>(
              builder: (context, state) {
                return Positioned(
                  top: 50,
                  child: Visibility(
                    visible: state.counterScroll > 5.0 ? false : true,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      width: size.width * 0.9,
                      height: 40,
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Center(
                        child: TextFormField(
                          controller: _searchController,
                          onChanged: (value) async {
                            await Future.delayed(Duration(milliseconds: 3000));
                            setState(() {
                              keywordsValue = value;
                            });
                            if (_githubType == GithubTypeSearch.User) {
                              BlocProvider.of<SearchUsernameCubit>(context)
                                  .onTypeSearchDataUser(value);
                            } else if (_githubType == GithubTypeSearch.Issues) {
                              BlocProvider.of<SearchUsernameCubit>(context)
                                  .onTypeSearchDataIssues(value);
                            } else {
                              BlocProvider.of<SearchUsernameCubit>(context)
                                  .onTypeSearchDataRepositories(value);
                            }
                          },
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
                );
              },
            ),
            BlocBuilder<AppbarScrollingCubit, AppbarScrollingState>(
              builder: (context, state) {
                return Positioned(
                  top: (() {
                    if (state.counterScroll > 0.0) {
                      var position = 120.0 - state.counterScroll;
                      if (position < 50) {
                        return 50.0;
                      } else {
                        return position;
                      }
                    }
                    return 120.0;
                  }()),
                  child: Container(
                    width: size.width,
                    color: colorWhite,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: [
                                Radio(
                                  value: GithubTypeSearch.User,
                                  groupValue: _githubType,
                                  onChanged: (GithubTypeSearch? value) {
                                    setState(() {
                                      _githubType = value!;
                                    });
                                    if (keywordsValue != "") {
                                      BlocProvider.of<SearchUsernameCubit>(
                                              context)
                                          .onTypeSearchDataUser(keywordsValue);
                                    }
                                  },
                                ),
                                Text(
                                  'User',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: colorOrange,
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: GithubTypeSearch.Issues,
                                  groupValue: _githubType,
                                  onChanged: (GithubTypeSearch? value) {
                                    setState(() {
                                      _githubType = value!;
                                    });
                                    if (keywordsValue != "") {
                                      BlocProvider.of<SearchUsernameCubit>(
                                              context)
                                          .onTypeSearchDataIssues(
                                              keywordsValue);
                                    }
                                  },
                                ),
                                Text(
                                  'Issues',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: colorOrange,
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: GithubTypeSearch.Repositories,
                                  groupValue: _githubType,
                                  onChanged: (GithubTypeSearch? value) {
                                    setState(() {
                                      _githubType = value!;
                                    });
                                    if (keywordsValue != "") {
                                      BlocProvider.of<SearchUsernameCubit>(
                                              context)
                                          .onTypeSearchDataRepositories(
                                              keywordsValue);
                                    }
                                  },
                                ),
                                Text(
                                  'Repositories',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: colorOrange,
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        BlocProvider<TabActiveCubit>(
                          create: (context) => TabActiveCubit(),
                          child: SizedBox(
                            height: 50,
                            child: BlocBuilder<TabActiveCubit, TabActiveState>(
                              builder: (context, state) {
                                return ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15,
                                    ),
                                    TabIndexingOrder(
                                      label: "Lazy load",
                                      pageNumber: 1,
                                      onPress: () {
                                        BlocProvider.of<TabActiveCubit>(context)
                                            .onTabChoose(1);
                                      },
                                      pageSelected: state.pageSelected,
                                      size: size,
                                    ),
                                    TabIndexingOrder(
                                      label: "With Index",
                                      pageNumber: 2,
                                      onPress: () {
                                        BlocProvider.of<TabActiveCubit>(context)
                                            .onTabChoose(2);
                                      },
                                      pageSelected: state.pageSelected,
                                      size: size,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
