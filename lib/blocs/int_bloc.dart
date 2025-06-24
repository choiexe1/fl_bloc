import 'package:fl_bloc/blocs/int_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class IntBloc extends Bloc<IntBlocEvent, int> {
  IntBloc() : super(0) {
    on<IntIncrement>((event, emit) {
      emit(state + event.amount);
    }, transformer: debounce(const Duration(milliseconds: 200)));

    on<IntError>((event, emit) {
      addError(Exception('에러 발생!'), StackTrace.current);
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  /// [onTransition]은 [onChange] 호출 이 전에 호출됨
  @override
  void onTransition(Transition<IntBlocEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
