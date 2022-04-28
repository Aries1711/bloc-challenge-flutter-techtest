import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_active_state.dart';

class TabActiveCubit extends Cubit<TabActiveState> {
  TabActiveCubit() : super(TabActiveState(pageSelected: 1));

  void onTabChoose(int pageChoose) =>
      emit(TabActiveState(pageSelected: pageChoose));
}
