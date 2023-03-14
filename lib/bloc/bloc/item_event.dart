import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {}

class GetDataButtonPressed extends ItemEvent {
  @override
  List<Object> get props => [];
}