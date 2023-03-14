import 'package:bloc/bloc.dart';
import 'package:init/bloc/test_event.dart';
import 'package:init/bloc/test_state.dart';

class ItemBloc extends Bloc<TestEvent, TestState> {
  int counter = 0;
  ItemBloc() : super(TestSuccessState(0)) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(TestLoadingState());
      counter++;
      emit(TestSuccessState(counter));
    });
  }
}