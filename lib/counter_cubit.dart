import 'package:flutter_bloc/flutter_bloc.dart';

/// here [int] is the [state]
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void incrementCounter() {
    final newVal = state + 1;
    emit(newVal);
  }
}
