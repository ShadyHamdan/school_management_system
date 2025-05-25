import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/Home_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState(0));

  void changeTab(int index) => emit(TabState(index));
}
