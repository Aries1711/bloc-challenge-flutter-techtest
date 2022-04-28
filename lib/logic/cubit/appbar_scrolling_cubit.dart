import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appbar_scrolling_state.dart';

class AppbarScrollingCubit extends Cubit<AppbarScrollingState> {
  AppbarScrollingCubit() : super(AppbarScrollingState(counterScroll: 0.0));

  void onScroll(double scrollValue) =>
      emit(AppbarScrollingState(counterScroll: scrollValue));
}
