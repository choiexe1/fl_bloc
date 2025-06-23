import 'package:fl_bloc/blocs/int_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntBloc extends Bloc<IntBlocEvent, int> {
  IntBloc() : super(0) {
    on<IntIncrement>((event, emit) {
      emit(state + event.amount);
    });
  }
}
