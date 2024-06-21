import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) => Scaffold(
          body: Center(
            child: Text(
              state.toString(),
              style: const TextStyle(fontSize: 32),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().incrementCounter(),
          ),
        ),
      ),
    );
  }
}
