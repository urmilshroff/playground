import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {
  const CounterObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('Observer detected a change: ${bloc.runtimeType} $change');
  }
}
