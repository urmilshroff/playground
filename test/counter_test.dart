import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground/counter_cubit.dart';

/*
blocTest creates a new bloc-specific test case with the given description.
blocTest will handle asserting that the bloc emits the expected states
(in order) after act is executed. blocTest also handles ensuring that no
additional states are emitted by closing the bloc stream before evaluating the
expectation.

setUp is optional and should be used to set up any dependencies prior to
initializing the bloc under test. setUp should be used to set up state necessary
for a particular test case. For common set up code, prefer to use setUp from
package:test/test.dart.

build should construct and return the bloc under test.

seed is an optional Function that returns a state which will be used to seed the
bloc before act is called.

act is an optional callback which will be invoked with the bloc under test and
should be used to interact with the bloc.

skip is an optional int which can be used to skip any number of states. skip
defaults to 0.

wait is an optional Duration which can be used to wait for async operations
within the bloc under test such as debounceTime.

expect is an optional Function that returns a Matcher which the bloc under test
is expected to emit after act is executed.

verify is an optional callback which is invoked after expect and can be used for
additional verification/assertions. verify is called with the bloc returned by
build.

errors is an optional Function that returns a Matcher which the bloc under test
is expected to throw after act is executed.

tearDown is optional and can be used to execute any code after the test has run.
tearDown should be used to clean up after a particular test case. For common
tear down code, prefer to use tearDown from package:test/test.dart.

tags is optional and if it is passed, it declares user-defined tags that are
applied to the test. These tags can be used to select or skip the test on the
command line, or to do bulk test configuration.
*/

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
        'increments to 4 when add pressed',
        build: () => counterCubit,
        act: (cubit) {
          cubit.incrementCounter(); // 1
          cubit.incrementCounter(); // 2
          cubit.incrementCounter(); // 3
          cubit.incrementCounter(); // 4
        },
        skip: 3, // skips first 3 states
        expect: () => [4],
      );
    },
  );
}
