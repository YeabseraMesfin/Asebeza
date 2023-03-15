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
  final List asbeza;
  final List history;
  TestSuccessState({required this.asbeza, required this.history});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TestFailState extends ItemState {
  String message;

  TestFailState(this.message);

  @override
  List<Object> get props => [];
}