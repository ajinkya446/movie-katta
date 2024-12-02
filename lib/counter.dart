import 'package:eMeet/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // int value = 0;
  //
  // void onTappedButton() {
  //   setState(() {
  //     value = value + 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.statusLoading) {
            const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          if (!state.statusLoading) {
            return Center(child: Text(state.counterValue.toString(), style: const TextStyle(fontSize: 20, color: Colors.white)));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).incrementValue();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
