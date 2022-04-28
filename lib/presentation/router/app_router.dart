import 'package:dev_test_github_search/logic/cubit/appbar_scrolling_cubit.dart';
import 'package:dev_test_github_search/presentation/screens/home_screen.dart';
import 'package:dev_test_github_search/presentation/screens/main_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Intro Page",
          ),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            title: "Intro Page",
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    // _counterCubit.close();
  }
}
