import '../../core/constants/paddings.dart';
import '../../core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // control counterCubitValue is positive
    final isPositive = context.select((CounterCubit counterCubit) =>
        counterCubit.state.counterCubitValue > 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.counterPageTitle),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) => Text(
                '${state.counterCubitValue}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Padding(
            padding: Paddings.paddingBottom96,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: isPositive
                      ? context.read<CounterCubit>().decrement
                      : null,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: context.read<CounterCubit>().reset,
                  child: const Icon(Icons.restore),
                ),
                FloatingActionButton(
                  onPressed: context.read<CounterCubit>().increment,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
