import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final bool obscurePassword;

  const HomeState({this.obscurePassword = true});

  @override
  List<Object> get props => [obscurePassword];
}

class TabState extends HomeState {
  final int selectedIndex;

  const TabState(this.selectedIndex, {super.obscurePassword = true});

  @override
  List<Object> get props => [selectedIndex, obscurePassword];
}
