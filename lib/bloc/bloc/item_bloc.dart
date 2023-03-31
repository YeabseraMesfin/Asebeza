import 'package:asbeza/data%20base/service.dart';
import 'package:bloc/bloc.dart';
import 'package:asbeza/bloc/bloc/item_event.dart';
import 'package:asbeza/bloc/bloc/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/api.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
final _apiServiceProvider = ApiServiceProvider();
  List history = [];
  List historyLoad=[];
  final _service = Service();
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

   
  
   on<HistoryEvent>((event, emit) {
          if (!historyLoad.contains(event.data))
            {
              // _service.wipeDate(),
              historyLoad.add(event.data);
              event.data.itemAdded = 1;
              _service.saveItem(event.data);
            }
        });
  }
}