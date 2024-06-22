import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground/counter_cubit.dart';

void main() {
  group(
    CounterCubit,
    () {
      late CounterCubit counterCubit;

      setUp(() {
        counterCubit = CounterCubit();
      });

      test(
        'initial state is 0',
        () {
          expect(counterCubit.state, equals(0));
        },
      );

      blocTest(
        'increments by 1 when add pressed',
        build: () => counterCubit,
        act: (cubit) => cubit.incrementCounter(),
        expect: () => [1],
      );
    },
  );
}
