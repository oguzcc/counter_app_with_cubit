import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterCubitValue: 0));

  void increment() =>
      emit(CounterState(counterCubitValue: state.counterCubitValue + 1));

  void decrement() =>
      emit(CounterState(counterCubitValue: state.counterCubitValue - 1));

  void reset() => emit(CounterState(counterCubitValue: 0));
}
