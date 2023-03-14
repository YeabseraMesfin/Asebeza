import 'package:equatable/equatable.dart';

abstract class ItemState extends Equatable {}

class TestInitialState extends ItemState {
  @override
  List<Object> get props => [];
}

class TestLoadingState extends ItemState {
  @override
  List<Object> get props => [];
}

class TestSuccessState extends ItemState {
  final int counterVal;
  TestSuccessState(this.counterVal);
  @override
  List<Object> get props => [];
}

class TestFailState extends ItemState {
  String message;

  TestFailState(this.message);

  @override
  List<Object> get props => [];
}