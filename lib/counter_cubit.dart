import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, statusLoading: true));

  void incrementValue() => emit(CounterState(counterValue: state.counterValue + 1, statusLoading: state.statusLoading));
}
