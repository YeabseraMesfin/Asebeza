import 'package:bloc/bloc.dart';
import 'package:asbeza/bloc/bloc/item_event.dart';
import 'package:asbeza/bloc/bloc/item_state.dart';

import '../../data/model/repository.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
final _apiServiceProvider = ApiServiceProvider();
  List history = [];
  ItemBloc() : super(TestInitialState()) {
    on<AsbezaFetchEvent>((event, emit) async {
      emit(TestLoadingState());
      try {
        final activity = await _apiServiceProvider.fetchActivity();
        emit(TestSuccessState(asbeza: activity!, history: history));
      } catch (e) {
        emit(TestInitialState());
      }
    });

    on<HistoryEvent>((event, emit) => {history.add(event.data)});
  }
}