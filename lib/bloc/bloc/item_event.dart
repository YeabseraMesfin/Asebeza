import 'package:equatable/equatable.dart';
import 'package:asbeza/data/model/model.dart';

abstract class ItemEvent extends Equatable {}

class GetDataButtonPressed extends ItemEvent {
  @override
  List<Object> get props => [];
}
class AsbezaFetchEvent extends ItemEvent {
  AsbezaFetchEvent();

  @override
  List<Object> get props => [];
}

class HistoryEvent extends ItemEvent {
  final Item asbeza;
  HistoryEvent({required this.asbeza});

  @override
  List<Object> get props => [];

  get data => asbeza;
}